##############################################################################
# File : Config.pm
#
# Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#               http://varrette.gforge.uni.lu
# $Id$
##############################################################################
package iBackupCheck::Config;

use iBackupCheck;

=head1 NAME

iBackupCheck::Config - set up I<ibackup> configurations for installcheck testing.

=head1 SYNOPSIS

    use iBackupCheck::Config;

    my $testconf = iBackupCheck::Config->new()
    # ... build a configuration file ...
    $testconf->add_param(...)
    $testconf->write()

The resulting configuration is always named "TESTCONF" and put in the directory
$TMPDIR/conf/. The basic configuration contains only a few parameters that are
necessary just to run I<backup> in the test environment.

=head1 WARNING

Using this module I<will> destroy any existing configuration.

=head1 FUNCTIONS

=item C<new()>

Create a new configuration object

=cut

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;
    $self->initialize();
    return $self;
}

=head1 AUTHOR

Sebastien Varrette C<< <Sebastien.Varrette@uni.lu> >>

=head1 COPYRIGHT & LICENSE

Copyright (c) 2010 Sebastien Varrette, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;                              # End of the module Config
