## ----------------------------------------------------------------------------
##                                                             -*- Automake -*-
## Makefile.am - Configuration file for GNU Automake 
##               See http://www.gnu.org/software/automake/
##
## Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
##               http://varrette.gforge.uni.lu
## $Id$ 
##
## This is the Makefile.am file for testing part of yaBackup (typically 
## invoked by 'make check') 
## ----------------------------------------------------------------------------

# For more info, see http://www.gnu.org/software/hello/manual/automake/Simple-Tests.html

include $(top_srcdir)/config/vars.am

#AUTOMAKE_OPTIONS = foreign

# Add any common files (that should not be run as tests, and that do not
# require configure-variable substitution) here:
test_utils = \
	check_dep.pl \
	yaBackupCheck.pm \
	yaBackupCheck/Config.pm

EXTRA_DIST += $(test_utils)

SOURCETESTS = \
	t/00-use.t \
	t/01-init.t \
	t/02-modules.t \
	t/10-configfile.t

YABACKUP_TESTS = ${SOURCETESTS:%=${srcdir}/%}

# Perl extra flags typically to complement @INC via -I options
PERL_EXTRA_FLAGS = -I$(top_srcdir)/tests

TESTS_ENVIRONMENT = $(PERL) -Mstrict  -w $(PERL_EXTRA_FLAGS)

# Run the check test based 
check-local: ${YABACKUP_TESTS}
	$(PERL) $(top_srcdir)/tests/check_dep.pl Test::Harness
	$(PERL) $(top_srcdir)/tests/check_dep.pl Test::More
	$(PERL) $(top_srcdir)/tests/check_dep.pl Test::Cmd
	$(TESTS_ENVIRONMENT) -MTest::Harness -e '$$Test::Harness::verbose=1; runtests @ARGV;' ${YABACKUP_TESTS}


#### From https://gforge.inria.fr/scm/viewvc.php/DyALog/trunk/Tests/Makefile.am?view=markup&root=dyalog

# AUTOMAKE_OPTIONS = foreign

# SOURCETESTS = tests.t rcg.t rcg_transducer.t dcg.t bmg.t tfs.t tag.t interleave.t
# MYTESTS = ${SOURCETESTS:%=${srcdir}/%}

# PGMTEST=  append g1 g2 \
# 	mutable rcg_transducer test_display\
# 	tfs_append simple1 simple2 quad comment bmg fset\
# 	light kleene tag_parser tig_parser test.tigh gtag_parser gtig_parser\
# 	il_test ilkleene_test

# EXTRA_DIST = ${SOURCETESTS} TODO check_dep.pl append.pl g1.rcg g2.rcg list.def \
# 	mutable.pl rcg_transducer.pl test_display.pl test_display.plh\
# 	tfs_append.pl simple.rcg quad.rcg comment.pl bmg.dcg fset.dcg\
# 	light.pl kleene.dcg test.tag il_test.dcg ilkleene_test.dcg

# check-local: ${MYTESTS}
# 	make clean-local
# 	@${PERL} ${srcdir}/check_dep.pl Test::Harness
# 	@${PERL} ${srcdir}/check_dep.pl Test::More
# 	@${PERL} ${srcdir}/check_dep.pl Test::Cmd
# 	@${PERL} -MTest::Harness -e '$$Test::Harness::verbose=1; runtests @ARGV;'	${MYTESTS}

# clean-local:
# 	-rm  `${PERL} -ne 'print "$$1 " if /^compile\W+?(\w+)/' ${MYTESTS}`
# 	-rm  *.desc lib*.la g1.pl g2.pl *.o *.lo ${PGMTEST}
