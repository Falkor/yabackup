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

include $(top_srcdir)/config/vars.am

man_MANS = yabackup.1

# .PHONY: doc
# doc : $(man_MANS)

# Generate man page
yabackup.1 : $(top_srcdir)/bin/yabackup 
	$(POD2MAN) --name=yaBackup --section=1 --center="yaBackup v@VERSION@ Script Manual" $^ > $@



