#! /bin/bash
################################################################################
# create_md5sums.sh - for each subdirectory of this folder, create a file
# containing the MD5 checksum  of each file/link. That's useful to check the
# integrity of separate directories.
#
# Copyright (c) 2010 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#               http://varrette.gforge.uni.lu
# $Id$
################################################################################

print_help() {
cat <<EOF
NAME
	$0
        For each subdirectory of this folder, create a file containing the MD5 
        checksum of each file/link (generated using md5sum). 

SYNOPSIS
	$0 -h	
	$0 [--clean]

DESCRIPTION
        On each folder DIR present in the current directory, create a file 
        names DIR.md5sums that contain the md5sum of each file (or symbolic link) 
        contained in DIR

OPTIONS
	-h --help
		Display a help screen and quit.
	-c --clean
		remove the generated files.

AUTHOR
	Sebastien Varrette <Sebastien.Varrette@uni.lu>
	Web page: http://varrette.gforge.uni.lu 

REPORTING BUGS 
	Please report bugs to <Sebastien.Varrette@uni.lu>

COPYRIGHT
	This is free software; see the source for copying conditions.  There is
	NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
	PURPOSE.
EOF
}

while [ $# -ge 1 ]; do
    case $1 in
        -h | --help)    print_help;        exit 0;;
        -c | --clean)   CLEANMODE="--clean";;
        *)  echo "Unrecognized option: run '$0 --help' for usage information";
            exit 1;
    esac
    shift
done

DIRLIST=`find . -type d -maxdepth 1 -print | sed -e 's/^\.$//'`
for d in ${DIRLIST}; do
    f=${d}.md5sums
    if [ -n "$CLEANMODE" ]; then
        echo "=> removing $f"
        rm -f $f
    else
        echo "=> generating md5sums for the directory $d"
        `find $d -exec md5sum {} \; -type f -or -type l 2>/dev/null > $f`
    fi
done
