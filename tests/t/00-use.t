#!/usr/bin/perl -w

##############################################################################
# File      : 00-use.t
#
# Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#               http://varrette.gforge.uni.lu
# $Id$ 
#
# Description : Part of the test suite of ibackup
#               Ensure everything is set correctly before the real tests begins
#
# 'perldoc Test::More' for more details
##############################################################################
use Test::More tests => 1;

BEGIN{ use_ok('iBackupCheck');  }






