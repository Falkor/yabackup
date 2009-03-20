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
    bootstrap  \
    DISCLAIMER \
    INSTALL    \
    NEWS       \
    FAQ        \
    README     \
    TODO       \
    config/m4  \
    www 

if generate_WEBSITE
WEBSITEDIR=www
endif

CLEANFILES="*~ bin/backup backup.3 backup.html"

SUBDIRS = bin $(WEBSITEDIR)

dist-hook:
	rm -rf `find $(distdir) -name .svn`

# Generate man page
backup.3 : bin/backup.in 
	$(POD2MAN) --name=BACKUP --section=3 --center="Backup Script Manual" $^ > $@

.PHONY: doc
doc: backup.3
#doc: backup.3 backup.html



