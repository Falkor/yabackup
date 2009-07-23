#! /bin/bash
############################################################################################
# File   : .dependances.sh 
# Author : Sebastien VARRETTE <Sebastien.Varrette@uni.lu>
#          (Web page : http://www-id.imag.fr/~svarrett/)
# Creation date : 28 Nov 2008
#
# Description : see the print_help function or launch '.dependances.sh --help'
#  
# This program is free software; you can redistribute it and/or modify it under the terms 
# of the GNU General Public License as published by the Free Software Foundation; either 
# version 2 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
# See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this 
# program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, 
# Fifth Floor, Boston, MA  02110-1301, USA.
# 
# Sebastien Varrette <Sebastien.Varrette@uni.lu> 
# University of Luxembourg 
# 6, rue Richard Coudenhove-Kalergi
# L-1359 Luxembourg, LUXEMBOURG
############################################################################################

print_error_and_exit() {
    echo "*** ERROR *** $1"
    exit 1
}

###
# check for file inclusion in a wml file
# usage: find_include_files file.wml
##
find_include_files() {
    [ $# -eq 0 ] && print_error_and_exit "[$FUNCNAME] missing command argument"
    cat $1 | grep "#include" | sed -e "s/.*(ROOTREL)\/\(.*\)>/\.\/\1/" | xargs echo
}

MAKEFILE_DEP=.Makefile.dep
MAIN_WML=./include/main.wml

[ ! -f ${MAIN_WML} ] && print_error_and_exit "${MAIN_WML} not found"
DEFAULT_INCLUDES=`find_include_files ${MAIN_WML}`

# erase ${MAKEFILE_DEP}
echo "" > ${MAKEFILE_DEP}

for src in `ls *.wml | xargs echo`; do
    dest="${src/.wml/.html}"
    includes=`cat $src | grep "#include" | sed -e "s/.*(ROOTREL)\/\(.*\)>/\.\/\1/" | xargs echo`
    echo "$dest : $src $includes ${MAIN_WML} ${DEFAULT_INCLUDES}" >> ${MAKEFILE_DEP}
    echo -e "\t@echo \"=> [$src] generating $dest\"" >> ${MAKEFILE_DEP}
    echo -e "\t@wml -o $dest $src" >> ${MAKEFILE_DEP}
    echo "" >> ${MAKEFILE_DEP}
done
