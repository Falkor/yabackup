############################################################################################
# File   : acinclude.m4 
# Author : Sebastien VARRETTE <Sebastien.Varrette@uni.lu>
#
# Copyright (c) 2008 -- see the copyright file
#
# A set of useful m4 macros for yaBackup (in addition to the one placed in config/m4/)
#  
############################################################################################

# ================================================================
# ACX_PROG_PROG
# ================================================================
AC_DEFUN([ACX_PROG_PROG], [
    AC_PATH_PROG([$1],[$2])
    AC_ARG_VAR([$1],[$2 command])
#    have_$2=yes
#    test "x$$1" = x && $1="false ...$2 program required..." && have_$2=no
    if test "x$$1" = x; then
       AC_MSG_ERROR([Unable to find the program $2 which is required])
    fi 
])


# ================================================================
# PROGS to check
# ================================================================
AC_DEFUN([PROG_PERL], 	  [ACX_PROG_PROG([PERL],     [perl])])
AC_DEFUN([PROG_POD2MAN],  [ACX_PROG_PROG([POD2MAN],  [pod2man])])
AC_DEFUN([PROG_POD2TEXT], [ACX_PROG_PROG([POD2TEXT], [pod2text])])
AC_DEFUN([PROG_POD2HTML], [ACX_PROG_PROG([POD2HTML], [pod2html])])
AC_DEFUN([PROG_POD2XHTML],[ACX_PROG_PROG([POD2XHTML],[pod2xhtml])])
AC_DEFUN([PROG_RSYNC], 	  [ACX_PROG_PROG([RSYNC],    [rsync])])
AC_DEFUN([PROG_WMK],      [ACX_PROG_PROG([WMK],      [wmk])])
AC_DEFUN([PROG_WML],      [ACX_PROG_PROG([WML],      [wml])])
AC_DEFUN([PROG_SVN2CL],   [ACX_PROG_PROG([SVN2CL],   [svn2cl.sh])])
