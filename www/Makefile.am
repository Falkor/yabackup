## ----------------------------------------------------------------
##                                                -*- Automake -*-
## (c) 2009 -- see the copyright file
## Author: Sebastien Varrette <Sebastien.Varrette@uni.lu> 
##
## This is the Makefile.am file for web site. 
## ----------------------------------------------------------------

if generate_WEBSITE

BACKUP_SCRIPT_SRC= ../bin/backup.in
CSS_STYLESHEET   = ./include/style.css
#CSS_STYLESHEET   = ./include/andreas01.css
DOC_FROMPOD      = backup.3.html
#backup.3.x.html
# sources
SRC          = $(wildcard *.wml)
TARGET       = $(SRC:.wml=.html) ChangeLog FAQ NEWS 
MAKEFILE_DEP = .Makefile.dep
SCRIPT_DEPENDANCES = .dependances.sh

# rsync stuff on the gforge
USER=svarrette
GFORGE_PROJECT=ibackup
EXCLUDE_FROM_RSYNC=".svn  Makefile* *~ *.tag *.wml .wmkrc .wmlrc $(MAKEFILE_DEP) $(SCRIPT_DEPENDANCES)"  # item that should NOT be rsynced space separated.
RSYNC_MODE="--delete"             # use --delete to delete remote files not present
GFORGE=gforge.uni.lu
DEST_DIR="/var/lib/gforge/chroot/home/groups/$(GFORGE_PROJECT)/htdocs"
RSYNC_EXCLUDE_CMD=$(EXCLUDE_FROM_RSYNC:%=--exclude=%)
RSYNC_CMD="rsync --rsh=ssh $(RSYNC_EXCLUDE_CMD) -avz --progress $(RSYNC_MODE) . $(USER)@$(GFORGE):$(DEST_DIR)"

all: .wmlrc $(MAKEFILE_DEP) $(DOC_FROMPOD) $(TARGET) 

clean-local:
	$(RM) .wmlrc $(MAKEFILE_DEP) $(DOC_FROMPOD) $(TARGET)

$(DOC_FROMPOD): $(BACKUP_SCRIPT_SRC)
	@echo => generating $@
#	$(PERL) -MPod::Simple::HTML -e Pod::Simple::HTML::go $< $@

	$(POD2HTML) --title="Backup Documentation" \
		    --css=$(CSS_STYLESHEET) $(BACKUP_SCRIPT_SRC) > $@
	$(RM) pod2htmd.tmp pod2htmi.tmp
#	$(POD2XHTML) --css=$(CSS_STYLESHEET) --infile $(BACKUP_SCRIPT_SRC) \
#		    --outfile backup.3.x.html -noindex

.wmlrc : include/wmlrc.default
	@sed -e "s/~\.\./~\./" $< > $@

$(MAKEFILE_DEP): $(SRC)
	@./$(SCRIPT_DEPENDANCES) 

include $(MAKEFILE_DEP)

ChangeLog: ../ChangeLog
	rsync -avzu $< $@

FAQ: ../FAQ
	rsync -avzu $< $@

NEWS: ../NEWS
	rsync -avzu $< $@

rsync: all
	@echo "=> running $(RSYNC_CMD)"
	@eval $(RSYNC_CMD)

else 
all: 
	@echo "Please configure with --enable-www to be able to compile the backup web site."
endif

