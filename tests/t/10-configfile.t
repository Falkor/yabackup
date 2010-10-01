#!/usr/bin/perl -w

##############################################################################
# File      : 10-configfile.t
#
# Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#               http://varrette.gforge.uni.lu
#
# Description : Part of the test suite of yaBackup
#               Ensure everything is set correctly before the real tests begins
#               'perldoc Test::More' for more details
#
# $Id$
##############################################################################
use yaBackupCheck qw( :all );
use yaBackupCheck::Config;

use strict;
use warnings;

use Test::More qw( no_plan );
use Test::Cmd;
use Data::Dumper;

my $test;
my $conf;
my $conf_file;

my $DEBUG = 0;  # Set to 1 to have debug output

diag("Testing command line and configuration file handling");

####
# Operate a test on the backup script 
# Usage: do_test_on_configfile(expected_exit_code, "msg", "ibackup_arguments" [,"stdin"])
##
sub do_test_on_configfile($$$@) {
    #    print '[', (caller(0))[3], "] @_\n";
    my $expected_ec = shift;
    my $msg = shift;
    my $args = shift;
    my $stdin = undef;
    $stdin = "@_" if (@_);
    my $result;
    unless (defined $stdin) {
        $result = $test->run(args => "$args");
    } else {
        $result = $test->run(args => "$args",
                             stdin => <<_EOF_);
$stdin
_EOF_
    }
    if ($DEBUG) {
        print "Command 'backup $args' result:\n";
        print "   STDOUT: ", $test->stdout, "\n";
        print "   STDERR: ", $test->stderr, "\n";
    }
    $result = $result / (1 << 8); # cf http://perldoc.perl.org/functions/system.html:
    # for some reason, "The return value is the exit
    # status of the program as returned by the wait
    # call. To get the actual exit value, shift right by
    # eight"
    ok($result == $expected_ec,
       "Test with expected exit code $expected_ec [got $result]: $msg");
    $test->fail($result != $expected_ec);
}


# Initializations
$test = Test::Cmd->new(prog    => "$yaBackupCheck::SCRIPT",
                       workdir => '',
                       interpreter => 'perl',
                       verbose => $DEBUG
                      );
die "cannot create the run test\n" unless ($test);
$test->preserve();
$conf      = yaBackupCheck::Config->new();
$conf->verbose($DEBUG);
$conf_file = $conf->filename();

# Let's go
do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::CommandLineFormat'},
                      'non-existing command-line option',
                      '--unlikely-to-be-a-valid-option');

do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::CommandLineFormat'},
                      'non-existing configuration file',
                      "-f $conf_file.$$.non-existent");

system("echo '' > $conf_file");
do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::ConfigFileFormat'},
                      'empty configuration file',
                      "-f $conf_file");

#$conf->add_param_to_section('global', 'src_rootdir', "$yaBackupCheck::TESTDIR/");
$conf->initialize();
$conf->write();
do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::ConfigFileFormat'},
                      'missing \'default\' profile in the configuration file',
                      "-f $conf_file");

$conf->add_param_to_section('default', 'strange_directive', 'you-dont-care-of-my-value');
$conf->write();
do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::ConfigFileFormat'},
                      'unknown directive in a profile of the configuration file',
                      "-f $conf_file");
$conf->delete_param_in_section('default', 'strange_directive');

$conf->write();
do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::ConfigFileFormat'},
                      'empty default section (i.e. missing target_url)',
                      "-f $conf_file");


$conf->add_param_to_section('global', 'src_rootdir', "$yaBackupCheck::TMPDIR/__hopefully_unexisting_dir__");
$conf->write();
do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::DirectoryNotFound'},
                      'non-existing source directory',
                      "-f $conf_file");

$conf->add_param_to_section('global', 'src_rootdir',  "$yaBackupCheck::TESTDIR/t/data");
$conf->add_param_to_section('default','target_url',   "");
$conf->write();
do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::ConfigFileFormat'},
                      'minimal valid configuration file (with directives src_rootdir and target_url) '.
                      'yet with empty target_url',
                      "-f $conf_file");

$conf->add_param_to_section('default','target_url',   "badproto:///");
$conf->write();
do_test_on_configfile($yaBackupCheck::ExitCodes{'ibackup::Exception::UnsupportedFeature'},
                      'malformed target_url (unknown protocol)',
                      "-f $conf_file");

$conf->add_param_to_section('default','target_url', "file:///");
$conf->write();
do_test_on_configfile(0, 'complete successful dry-run', "-f $conf_file -n", "yes");


