## ----------------------------------------------------------------------------
##                                                             -*- Automake -*-
## Makefile.am - Configuration file for GNU Automake 
##               See http://www.gnu.org/software/automake/
##
## Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
##               http://varrette.gforge.uni.lu
## $Id$ 
##
## This is the Makefile.am file for documentation part of yaBackup
## ----------------------------------------------------------------------------

man_MANS = yabackup.1

# Generate man page
yabackup.1 : $(src_rootdir)/bin/yabackup 
	$(POD2MAN) --name=yaBackup --section=1 --center="yaBackup v@VERSION@ Script Manual" $^ > $@

.PHONY: doc
doc: yabackup.1



