##############################################################################
# File : yaBackupCheck/Config.pm
#
# Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#               http://varrette.gforge.uni.lu
#
# $Id$
##############################################################################
package yaBackupCheck::Config;

use yaBackupCheck;

=head1 NAME

yaBackupCheck::Config - set up I<yaBackup> configurations for installcheck testing.

=head1 SYNOPSIS

    use yaBackupCheck::Config;

    my $testconf = yaBackupCheck::Config->new()
    # ... build a configuration file ...
    $testconf->add_param(...)
    $testconf->write()

The resulting configuration is always named backup-config.conf and stored in the
directory $yaBackupCheck::TMPDIR/.
The basic configuration contains only a few parameters that are
necessary just to run I<backup> in the test environment.

=head1 WARNING

Using this module I<will> destroy any existing configuration.

=cut
use Carp;
use Data::Dumper;

=head1 FUNCTIONS

=over

=item C<new()>

Create a new configuration object

=cut

sub new {
    my $class = shift;
    # Reuse the definition of %config::SETTINGS in $yaBackupCheck::SCRIPT
    my $self = {'filename' => undef,
                'verbose'  => 0,
                'config'   => undef,
               };
    bless $self, $class;
    $self->initialize();
    return $self;
}

=item C<initialize()>

[re]-initialize the object i.e reset the 'config' part

=cut

sub initialize {
    my $self = shift;
    $self->{'filename'} = "$yaBackupCheck::TMPDIR/backup-config.conf";
    $self->{'config'} = {
                         # Global section
                         'global' => {
                                      'password_file'          => undef,
                                      'restrict_on_subnet'     => undef,
                                      'src_rootdir'            => undef,
                                      'dst_rootdir'            => undef,
                                      'sync_include'           => undef,
                                      'sync_exclude'           => undef,
                                      'sync_exclude_exception' => undef,
                                      'exclude_pattern'        => undef,
                                      'exclude_pattern_file'   => undef,
                                      'Directory'              => undef,
                                      'target_url'             => undef,
                                      'logdir'                 => undef,
                                      'email'                  => undef,
                                      'encfs_rawdir'           => undef,
                                     },
                         # Default section
                         'default' => undef,
                        };
}


=item C<filename([$filename])>
=item C<config()>
=item C<verbose([$verbose])>

Accessor/Mutator to access object data

=cut

sub filename {
    my $self = shift;
    if (@_) {
        $self->{'filename'} = shift;
    }
    return $self->{'filename'};
}

sub config {
    my $self = shift;
    #    if (@_) { $self->{'config'} = %{shift}; }
    return $self->{'config'};
}

sub verbose {
    my $self = shift;
    if (@_) {
        $self->{'verbose'} = shift;
    }
    return $self->{'filename'};
}

=item C<add_param_to_section($section, $param, $value)>

Add the given parameter to the configuration file for a given section.  If the
section provided do not correspond to 'global' or 'default', then it will assume
to be a new section placed under 'other' with an attribute 'name' equal to
$section.

=cut

sub add_param_to_section {
    my $self = shift;
    my ($section, $param, $value) = @_;
    if (exists($self->{'config'}->{$section})) {
        $self->{'config'}->{$section}->{$param} = $value;
    } else {
        $self->{'config'}->{$section} = { "$param" => $value };
    }
}

=item C<delete_param_in_section($section, $param)>

Delete the given parameter in the configuration file for the section

=cut

sub delete_param_in_section {
    my $self = shift;
    my ($section, $param) = @_;
    if (exists($self->{'config'}->{$section}) and
        exists($self->{'config'}->{$section}->{$param})) {
        delete $self->{'config'}->{$section}->{$param};
    }
}

=item C<print()>

Print out the internal state of $self

=cut

sub print() {
    my $self = shift;
    print Dumper $self;
}

=item C<write()>

Write out the accumulated configuration file in $yaBackupCheck::TMPDIR/backup-config.conf

=back

=cut

sub write() {
    my $self = shift;
    print "=> write backup configuration to $self->{'filename'}\n" if ($self->{'verbose'});
    open OUT, ">$self->{'filename'}" || carp "$!\n";
    foreach my $sec (keys %{$self->{'config'}}) {
        next unless defined($self->{'config'}->{$sec});
        print OUT "<$sec>\n";
        foreach my $directive (keys %{$self->{'config'}->{$sec}}) {
            next unless defined($self->{'config'}->{$sec}->{$directive});
            print OUT "\t$directive = $self->{'config'}->{$sec}->{$directive}\n";
        }
        print OUT "</$sec>\n";
    }
    close OUT;
    system("cat $self->{'filename'}") if ($self->{'verbose'});
}


=head1 AUTHOR

Sebastien Varrette C<< <Sebastien.Varrette@uni.lu> >>

=head1 COPYRIGHT & LICENSE

Copyright (c) 2010 Sebastien Varrette, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;                              # End of the module yaBackupCheck::Config
