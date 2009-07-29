# ----------------------------------------------------------------
#                                                -*- Autoconf -*-
# Copyright (c) 2009 -- see the copyright file
# Author: Sebastien Varrette <Sebastien.Varrette@uni.lu> 
# $Id$
#
# This is the configure.ac file for backup.
# Process this file with autoconf to produce a configure script.
# ----------------------------------------------------------------

AC_INIT([backup],[0.3],[sebastien.varrette@uni.lu])

AC_PREREQ(2.60)
AC_CONFIG_AUX_DIR(config)
AM_INIT_AUTOMAKE([-Wall -Wno-portability])	

# Make automake clean emacs ~ files for "make clean"
CLEANFILES="*~"
AC_SUBST(CLEANFILES)

PACKAGE_SUMMARY="a highly flexible script utility to backup directories on various targets"
AC_SUBST(PACKAGE_SUMMARY)

# ----------------------------------------------------------------
# Checks for programs.
# ----------------------------------------------------------------
AC_PROG_INSTALL
AC_PROG_SSH
# following macro defined in acinclude.m4
PROG_PERL
PROG_POD2MAN
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
     esac],
     [AC_MSG_RESULT([off])
      generate_website=false]
)
AM_CONDITIONAL(generate_WEBSITE, test x$generate_website = xtrue)


AC_MSG_CHECKING([for automatic generation of ChangeLog from the subversion repository logs])
AC_ARG_ENABLE(
    svn2cl, 
    [AS_HELP_STRING([--enable-svn2cl],[enable the  automatic generation of ChangeLog from the subversion repository logs using the script svn2cl.sh (see http://arthurdejong.org/svn2cl/) [default=no]])],
    [case "${enableval}" in
    	  yes) AC_MSG_RESULT([on])
	       PROG_SVN2CL
	       use_svn2cl=true ;;
  	  no)  AC_MSG_RESULT([off])
	       use_svn2cl=false ;;
  	  *)   AC_MSG_ERROR(bad value ${enableval} for --enable-svn2cl) ;;
     esac],
     [AC_MSG_RESULT([off])
      use_svn2cl=false]
)
AM_CONDITIONAL(use_SVN2CL, test x$use_svn2cl = xtrue)



# ----------------------------------------------------------------
# Checks for libraries.
# ----------------------------------------------------------------
AC_CHECK_CPAN_MODULES(
    Switch 
    Storable 
    Hash::Util 
    Time::localtime 
    Getopt::Long 
    POSIX 
    Getopt::Long 
    Config::General 
    Term::ANSIColor 
    Data::Dumper 
    Pod::Usage
)

# ----------------------------------------------------------------
# ----------------------------------------------------------------

AC_CONFIG_SRCDIR([bin/backup.in])
AC_CONFIG_FILES([
	Makefile
	bin/Makefile
	bin/backup
	www/include/wmlrc.default
	www/Makefile
])

AC_OUTPUT
