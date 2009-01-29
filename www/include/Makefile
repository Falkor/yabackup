####################################################################################
# Makefile (configuration file for GNU make - see http://www.gnu.org/software/make/)
#
# Author : Sebastien Varrette <Sebastien.Varrette@imag.fr>
#          Web page : http://www-id.imag.fr/~svarrett/
#
# Please refer to ../Makefile for more informations on compilation options
# Alternatively, you may try 'make help'
# 

# List of the files to compile in this subdir
SRC = $(wildcard *.wml)
FILES_TO_COMPILE  = index.wml
OTHER_SRC_FILES = $(filter-out $(FILES_TO_COMPILE),$(SRC))  
FILES_TO_GENERATE = $(FILES_TO_COMPILE:.wml=.html)

WMK = `which wmk`

all: $(FILES_TO_COMPILE)
	${MAKE} -C ../
#	@$(WMK) -I ../ $(FILES_TO_COMPILE)

$(FILES_TO_COMPILE) : $(OTHER_SRC_FILES) 
	@touch $@

distclean : 
	rm -f $(FILES_TO_GENERATE)

test :
	@echo "SRC = $(SRC)"
	@echo "FILES_TO_COMPILE = $(FILES_TO_COMPILE)"
	@echo "OTHER_SRC_FILES  = $(OTHER_SRC_FILES)"
%:
	$(MAKE) -C ../ $@
