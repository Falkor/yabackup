#!/usr/bin/perl -w

##############################################################################
# File      : init.t 
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
use iBackupCheck qw( :all );

use strict;
use warnings;
use Test::More qw( no_plan );

iBackupCheck::print_header('Test global variables');
iBackupCheck::print_variables();

iBackupCheck::print_header('Test common test configuration');
ok( (-f "$iBackupCheck::SCRIPT"),"The script '$iBackupCheck::SCRIPT' is present" );





