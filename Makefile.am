## ----------------------------------------------------------------
##                                                -*- Automake -*-
## (c) 2009 -- see the copyright file
## Author: Sebastien Varrette <Sebastien.Varrette@uni.lu> 
##
## This is the Makefile.am file for backup
## ----------------------------------------------------------------

ACLOCAL_AMFLAGS = -I config/m4
#AUTOMAKE_OPTIONS = dist-shar
man_MANS = backup.3

EXTRA_DIST = AUTHORS \
    COPYING    \
    ChangeLog  \
    DISCLAIMER \
    INSTALL    \
    NEWS       \
    README     \
    TODO       \
    README     \
    config/m4   

SUBDIRS = bin

# Generate man page
backup.3 : bin/backup.in 
	$(POD2MAN) --name=BACKUP --section=3 \
	 --center="Backup Script Manual" $^ > $@

# for my own purpose
backup.html : 
	[ -n "$(POD2HTML)" ] && $(POD2HTML) --title=BACKUP bin/backup.in > $@ 
	[ -n "$(POD2HTML)" ] && $(RM) pod2htmd.tmp pod2htmi.tmp

.PHONY: doc
doc: backup.3 backup.html



