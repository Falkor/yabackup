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
DOC_FROMPOD      = backup.3.html
# sources
SRC          = $(wildcard *.wml)
TARGET       = $(SRC:.wml=.html) $(DOC_FROMPOD) ChangeLog FAQ NEWS 
MAKEFILE_DEP = .Makefile.dep
SCRIPT_DEPENDANCES = .dependances.sh

# rsync stuff on the gforge
USER=svarrette
GFORGE_PROJECT=ibackup
EXCLUDE_FROM_RSYNC=".svn  Makefile* *~ *.tag *.wml .wmkrc .wmlrc"  # item that should NOT be rsynced space separated.
RSYNC_MODE="--delete"             # use --delete to delete remote files not present
GFORGE=gforge.uni.lu
DEST_DIR="/var/lib/gforge/chroot/home/groups/$(GFORGE_PROJECT)/htdocs"
RSYNC_EXCLUDE_CMD=$(EXCLUDE_FROM_RSYNC:%=--exclude=%)
RSYNC_CMD="rsync --rsh=ssh $(RSYNC_EXCLUDE_CMD) -avz --progress $(RSYNC_MODE) . $(USER)@$(GFORGE):$(DEST_DIR)"

CLEANFILES = $(TARGET) *~

all: $(SRC) $(DOC_FROMPOD) ChangeLog FAQ NEWS
	$(WMK) $(SRC)

$(DOC_FROMPOD): 
	$(POD2HTML) --title="Backup Documentation" \
		    --css=$(CSS_STYLESHEET) $(BACKUP_SCRIPT_SRC) > $@
	$(RM) pod2htmd.tmp pod2htmi.tmp

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

