#!/usr/bin/perl -w

##############################################################################
# File      : init.t
#
# Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#               http://varrette.gforge.uni.lu
# $Id$ 
#
# Description : Part of the test suite of yaBackup
#               Ensure everything is set correctly before the real tests begins
#
# 'perldoc Test::More' for more details
##############################################################################
use yaBackupCheck qw( :all );

use strict;
use warnings;
use Test::More qw( no_plan );

diag('Test global variables');
yaBackupCheck::print_variables();

diag('Test common test configuration');
ok( (-f "$yaBackupCheck::SCRIPT"),"The script '$yaBackupCheck::SCRIPT' is present" );

# No longer needed as I lauch it via perl
# # Now that the script is present, make it executable for further test (this is
# # done on 'make install' but not here where we test the generated script prior
# # to the installation
# my $res = chmod 0755, "$yaBackupCheck::SCRIPT";
# ok( $res == 1, "make the script '$yaBackupCheck::SCRIPT' executable for future tests");



