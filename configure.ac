# ----------------------------------------------------------------
#                                                -*- Autoconf -*-
# Copyright (c) 2009 -- see the copyright file
# Author: Sebastien Varrette <Sebastien.Varrette@uni.lu> 
#
# This is the configure.ac file for backup.
# Process this file with autoconf to produce a configure script.
# ----------------------------------------------------------------

AC_INIT([backup],[0.1],[sebastien.varrette@uni.lu])
AC_PREREQ(2.60)
AC_CONFIG_AUX_DIR(config)
AM_INIT_AUTOMAKE([-Wall])	

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


# ----------------------------------------------------------------
# Macros that should be defined to compile:
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# --with && --enable OPTIONS
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# Checks for libraries.
# ----------------------------------------------------------------
AC_CHECK_PERL_MODULES(Storage,, AC_MSG_ERROR(Can't find the Perl modules Storage))



# ----------------------------------------------------------------
# Checks for header files. 
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# Checks for typedefs, structures, and compiler characteristics.
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# Checks for library functions.
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# --with && --enable OPTIONS
# ----------------------------------------------------------------


# ----------------------------------------------------------------
# ----------------------------------------------------------------


AC_CONFIG_SRCDIR([bin/backup])
AC_CONFIG_FILES([
	Makefile
#	doc/Makefile
#	doc/man/Makefile
#	doc/html/Makefile
])

AC_OUTPUT
