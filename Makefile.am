## ----------------------------------------------------------------------------
##                                                             -*- Automake -*-
## Makefile.am - Configuration file for GNU Automake 
##               See http://www.gnu.org/software/automake/
##
## Copyright (c) 2009 Sebastien Varrette <Sebastien.Varrette@uni.lu>
##               http://varrette.gforge.uni.lu
## $Id$ 
##
## This is the main Makefile.am file for yaBackup
## ----------------------------------------------------------------------------

ACLOCAL_AMFLAGS = -I config/m4 

include $(top_srcdir)/config/vars.am

EXTRA_DIST += \
	AUTHORS \
	ChangeLog  \
	COPYING    \
	bootstrap  \
	DISCLAIMER \
	INSTALL    \
	NEWS       \
	FAQ        \
	README     \
	TODO       \
	acinclude.m4 \
	config/m4  \
	config/vars.am \
	doc        \
	$(icons_DATA) \
	$(yabackupconfexamples_DATA)

icons_DATA = \
	$(srcdir)/icons/yabackup_afpEncrypted_Icon.png        \
	$(srcdir)/icons/yabackup_afp_Icon.png                 \
	$(srcdir)/icons/yabackup_defaultEncrypted_Icon.png    \
	$(srcdir)/icons/yabackup_default_Icon.png             \
	$(srcdir)/icons/yabackup_driveEncrypted_Icon.png      \
	$(srcdir)/icons/yabackup_drive_Icon.png               \
	$(srcdir)/icons/yabackup_fileEncrypted_Icon.png       \
	$(srcdir)/icons/yabackup_file_Icon.png                \
	$(srcdir)/icons/yabackup_sparsebundle_Icon.png        \
	$(srcdir)/icons/yabackup_sshEncrypted_Icon.png        \
	$(srcdir)/icons/yabackup_ssh_Icon.png                 \
	$(srcdir)/icons/OK_yabackup_afpEncrypted_Icon.png     \
	$(srcdir)/icons/OK_yabackup_afp_Icon.png              \
	$(srcdir)/icons/OK_yabackup_defaultEncrypted_Icon.png \
	$(srcdir)/icons/OK_yabackup_default_Icon.png          \
	$(srcdir)/icons/OK_yabackup_driveEncrypted_Icon.png   \
	$(srcdir)/icons/OK_yabackup_drive_Icon.png            \
	$(srcdir)/icons/OK_yabackup_fileEncrypted_Icon.png    \
	$(srcdir)/icons/OK_yabackup_file_Icon.png             \
	$(srcdir)/icons/OK_yabackup_sparsebundle_Icon.png     \
	$(srcdir)/icons/OK_yabackup_sshEncrypted_Icon.png     \
	$(srcdir)/icons/OK_yabackup_ssh_Icon.png              \
	$(srcdir)/icons/KO_yabackup_afpEncrypted_Icon.png     \
	$(srcdir)/icons/KO_yabackup_afp_Icon.png              \
	$(srcdir)/icons/KO_yabackup_defaultEncrypted_Icon.png \
	$(srcdir)/icons/KO_yabackup_default_Icon.png          \
	$(srcdir)/icons/KO_yabackup_driveEncrypted_Icon.png   \
	$(srcdir)/icons/KO_yabackup_drive_Icon.png            \
	$(srcdir)/icons/KO_yabackup_fileEncrypted_Icon.png    \
	$(srcdir)/icons/KO_yabackup_file_Icon.png             \
	$(srcdir)/icons/KO_yabackup_sparsebundle_Icon.png     \
	$(srcdir)/icons/KO_yabackup_sshEncrypted_Icon.png     \
	$(srcdir)/icons/KO_yabackup_ssh_Icon.png

iconsdir   = $(datarootdir)/icons/yabackup

install-icons:
	mkdir -p $(iconsdir)
	for icon in $(icons_DATA); do \
		$(INSTALL_DATA) $$icon $(iconsdir); \
	done 

yabackupconfexamples_DATA = $(srcdir)/doc/yabackup.conf.example

yabackupconfexamplesdir   = $(datarootdir)/doc/yabackup/examples

install-yabackupconfexamples:
	mkdir -p $(yabackupconfexamplesdir)
	for conf in $(yabackupconfexamples_DATA); do \
		$(INSTALL_DATA) $$conf $(yabackupconfexamplesdir); \
	done 

install-data-local: install-icons install-yabackupconfexamples

if generate_WEBSITE
WEBSITEDIR=www
endif

CLEANFILES += *~ bin/yabackup doc/yabackup.1

SUBDIRS = bin doc tests $(WEBSITEDIR)

# if use_SVN2CL
# CLEANFILES += .authors.xml
# .authors.xml: 
# 	@echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>"              >  $@
# 	@echo "<authors>"						>> $@
# 	@echo "   <author uid=\"svarrette\">"				>> $@
# 	@echo "	Sebastien Varrette &lt;Sebastien.Varrette@uni.lu&gt;"	>> $@
# 	@echo "    </author>"						>> $@
# 	@echo "    <author uid=\"gherbiet\">"				>> $@
# 	@echo "	Guillaume-Jean Herbiet &lt;Guillaume.Herbiet@uni.lu&gt;">> $@
# 	@echo "    </author>"						>> $@
# 	@echo "</authors>"						>> $@

# ChangeLog: .authors.xml
# 	svn2cl.sh -a -i --group-by-day --separate-daylogs --authors=.authors.xml -r HEAD:1
# 	$(RM) .authors.xml 
# else
# ChangeLog:
# 	@echo "Please configure with --enable-svn2cl to be able to automatically"
# 	@echo "generate the ChangeLog from from the svn repository logs"
# endif

dist-hook:
	$(RM) -r `find $(distdir) -name .svn`
	$(RM) -r $(distdir)/www/download/*
	for file in *.html .wmlrc .Makefile.dep Makefile ChangeLog FAQ backup.conf.example; do \
		$(RM) $(distdir)/www/$$file; \
	done
# # Generate man page
# backup.3 : bin/backup 
# 	$(POD2MAN) --name=BACKUP --section=3 --center="Backup v@VERSION@ Script Manual" $^ > $@

# .PHONY: doc
# doc: backup.3
# #doc: backup.3 backup.html



