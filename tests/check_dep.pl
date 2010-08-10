#!/usr/bin/perl -w

##############################################################################
# File      : check_dep.pl
#
# Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#               http://varrette.gforge.uni.lu
# $Id$ 
#
# Description : Check dependency to a perl module
##############################################################################
use strict;
use warnings;

my @missing=();

foreach my $dep (@ARGV) {
    push(@missing, $dep) unless (eval "require $dep");
}

if (@missing) {
    print "*** WARNING *** Missing PERL modules @missing. Please install them from CPAN\n";
    exit 1;
}

exit;
