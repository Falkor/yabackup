# ----------------------------------------------------------------
#                                                -*- Autoconf -*-
# Copyright (c) 2009 -- see the copyright file
# Author: Sebastien Varrette <Sebastien.Varrette@uni.lu> 
#
# This is the configure.ac file for backup.
# Process this file with autoconf to produce a configure script.
# ----------------------------------------------------------------

AC_INIT([yabackup],[1.0],[yabackup-support@lists.uni.lu])

AC_PREREQ(2.60)
AC_CONFIG_AUX_DIR(config)
AM_INIT_AUTOMAKE([-Wall -Wno-portability])	

PACKAGE_NAME="yaBackup"
PACKAGE_SUMMARY="Yet Another Backup script"
PACKAGE_DESCRIPTION="a highly flexible script utility to backup directories from your local system on various targets (external drive, sparsebundle, remote server with SSH access, NAS with AFP access, EncFS volume etc.)"
PACKAGE_WEBSITE="http://falkor.github.com/yabackup"
PACKAGE_BUGS="http://github.com/Falkor/yabackup/issues"
PACKAGE_SUPPORT="yabackup-support@lists.uni.lu"

AC_SUBST(PACKAGE_NAME)
AC_SUBST(PACKAGE_SUMMARY)
AC_SUBST(PACKAGE_DESCRIPTION)
AC_SUBST(PACKAGE_WEBSITE)
AC_SUBST(PACKAGE_BUGS)
AC_SUBST(PACKAGE_SUPPORT)

# ----------------------------------------------------------------
# Checks for programs.
# ----------------------------------------------------------------
AC_PROG_INSTALL
AC_PROG_SSH
# following macro defined in acinclude.m4
PROG_PERL
PROG_POD2MAN
PROG_POD2TEXT
PROG_RSYNC

# ----------------------------------------------------------------
# Macros that should be defined to compile:
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# --with && --enable OPTIONS
# ----------------------------------------------------------------
AC_MSG_CHECKING([for website generation using pod2html and Website Meta Langage] )
AC_ARG_ENABLE(
        www, 
        [AS_HELP_STRING([--enable-www],[enable the generation of the web site using pod2html and wml [default=no]])],
        [case "${enableval}" in
    	      yes) AC_MSG_RESULT([on])
	           PROG_POD2HTML
	           PROG_WMK
	           PROG_WML
	           generate_website=true ;;
  	      no)  AC_MSG_RESULT([off])
	           generate_website=false ;;
  	      *)   AC_MSG_ERROR(bad value ${enableval} for --enable-www) ;;
         esac
        ],
        [AC_MSG_RESULT([off])
        generate_website=false]
)
AM_CONDITIONAL(generate_WEBSITE, test x$generate_website = xtrue)


# TODO: see equivalent tool now that I move everything to git
dnl AC_MSG_CHECKING([for automatic generation of ChangeLog from the subversion repository logs])
dnl AC_ARG_ENABLE(
dnl         svn2cl, 
dnl         [AS_HELP_STRING([--enable-svn2cl],[enable the  automatic generation of ChangeLog from the subversion repository logs using the script svn2cl.sh (see http://arthurdejong.org/svn2cl/) [default=no]])],
dnl         [case "${enableval}" in
dnl     	      yes) AC_MSG_RESULT([on])
dnl 	           PROG_SVN2CL
dnl 	           use_svn2cl=true ;;
dnl   	      no)  AC_MSG_RESULT([off])
dnl 	           use_svn2cl=false ;;
dnl   	      *)   AC_MSG_ERROR(bad value ${enableval} for --enable-svn2cl) ;;
dnl          esac
dnl         ],
dnl         [AC_MSG_RESULT([off])
dnl          use_svn2cl=false]
dnl )
dnl AM_CONDITIONAL(use_SVN2CL, test x$use_svn2cl = xtrue)

# ----------------------------------------------------------------
# Checks for libraries.
# ----------------------------------------------------------------
# Generate this list by: 
# ./bootstrap -e
# You can also look/launch 'perl tests/t/modules.t'

AC_CHECK_CPAN_MODULES(
        Config::General
        Cwd
        Data::Dumper
        Exception::Class
        Exception::Class::TryCatch
        Expect
        File::Basename
        Getopt::Long
        Hash::Util
        List::Util
        Log::Handler
        Mac::PropertyList
        Pod::Usage
        Storable
        Term::ANSIColor
        Term::ReadKey
)

# ----------------------------------------------------------------
# ----------------------------------------------------------------

AC_CONFIG_SRCDIR([bin/yabackup.in])
AC_CONFIG_FILES([
	Makefile
	bin/Makefile
	bin/yabackup
        doc/Makefile
        doc/yabackup.conf.example
        doc/README_HEADER.pod
        doc/INSTALL.pod
        tests/Makefile
        tests/yaBackupCheck.pm
	www/include/wmlrc.default
	www/Makefile
])

AC_OUTPUT
