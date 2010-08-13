#!/usr/bin/perl -w
###!@PERL@ -w

##############################################################################
# File      : modules.t
#
# Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#               http://varrette.gforge.uni.lu
# $Id$ 
#
# Description : Part of the test suite of ibackup
#               Check the used modules
#
#               'perldoc Test::More' for more details
##############################################################################
use iBackupCheck qw( :all );

use strict;
use warnings;

use Test::More qw( no_plan );
use File::Basename;
use Data::Dumper;

diag('Test used modules');
open FILE, "$iBackupCheck::SCRIPT" || die "$!\n";
# remember: read the filter from bottom to top
my @module_list =
  grep { !/(warnings|strict)/ } # remove these common modules
  grep { s/^use\s+// }          # remove 'use '
  grep { s/\s*(;|\()[.\s]*$// } # remove final part (from ; to the end of line)
  grep { /^use / }              # filter use lines
  <FILE>;
close FILE;

# print "List of the used packages:\n"; # , Dumper \@module_list;
# foreach (@module_list) { print "   $_\n"; }

foreach my $module (@module_list) {
    use_ok( "$module" );
}







