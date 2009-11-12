## ----------------------------------------------------------------
##                                                -*- Automake -*-
## (c) 2009 -- see the copyright file
## Author: Sebastien Varrette <Sebastien.Varrette@uni.lu> 
## $Id$
##
## This is the Makefile.am file for backup
## ----------------------------------------------------------------

ACLOCAL_AMFLAGS = -I config/m4
#AUTOMAKE_OPTIONS = dist-shar
man_MANS = backup.3

EXTRA_DIST = AUTHORS \
    ChangeLog  \
    COPYING    \
    bootstrap  \
    DISCLAIMER \
    INSTALL    \
    NEWS       \
    FAQ        \
    README     \
    TODO       \
    config/m4  \
    www        \
    etc


if generate_WEBSITE
WEBSITEDIR=www
endif

CLEANFILES=*~ bin/backup backup.3 backup.html

SUBDIRS = bin $(WEBSITEDIR)

if use_SVN2CL
CLEANFILES += .authors.xml
.authors.xml: 
	@echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>"              >  $@
	@echo "<authors>"						>> $@
	@echo "   <author uid=\"svarrette\">"				>> $@
	@echo "	Sebastien Varrette &lt;Sebastien.Varrette@uni.lu&gt;"	>> $@
	@echo "    </author>"						>> $@
	@echo "    <author uid=\"gherbiet\">"				>> $@
	@echo "	Guillaume-Jean Herbiet &lt;Guillaume.Herbiet@uni.lu&gt;">> $@
	@echo "    </author>"						>> $@
	@echo "</authors>"						>> $@

ChangeLog: .authors.xml
	svn2cl.sh -a -i --group-by-day --separate-daylogs --authors=.authors.xml -r HEAD:1
	$(RM) .authors.xml 
else
ChangeLog:
	@echo "Please configure with --enable-svn2cl to be able to automatically"
	@echo "generate the ChangeLog from from the svn repository logs"
endif

dist-hook:
	$(RM) `find $(distdir) -name .svn`
	$(RM) $(distdir)/www/download/*


# Generate man page
backup.3 : bin/backup 
	$(POD2MAN) --name=BACKUP --section=3 --center="Backup v@VERSION@ Script Manual" $^ > $@

.PHONY: doc
doc: backup.3
#doc: backup.3 backup.html



