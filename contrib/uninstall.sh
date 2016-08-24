#!/bin/bash
#
# KBMSGR removal script.
#
# Dedicated to lazy people =P
# By Musickiller.
#
# License: you can only use and redistribute this one *ONLY* if you are lazy or if it is 24'th of August.

ME="${0##*/}"
MYPATH="${0}"
MY_HELP="\
usage: ${ME} [options]

options:
    full - - - remove the whole configuration dirrectory
    help - - - display help on a particular command
"

# set -x # DEBUG

# VARIABLES
CONF_DIR=~/.config/kbmsgr/uninstall
INST_DIR=`cat $CONF_DIR/inst_dir.conf`
FILES=`cat $CONF_DIR/files.conf`
FULL=0
#GIT_DIR=../src

remove () {
	echo
	echo "Started uninstallation."
	echo
	
	for FILE in $FILES; do
		rm -v $INST_DIR/$FILE
	done
	
	if [[ $FULL == 1 ]] # not "f" because it could be unintenional.
		then
			echo
			echo "Full removal of config folder:"
			echo
			rm -rf ~/.config/kbmsgr
		else
			echo
			echo "Only removing uninstallator's folder:"
			rm -rfv $CONF_DIR
			rmdir -v ~/.config/kbmsgr
	fi
	echo
	echo "Uninstallation is complete!"
	echo "Praise the Emperor!"
	echo
}

# A BIG FUNCTION IS COMMING!!!!!
show_help () { #BOOM!!!
	echo "${MY_HELP}" #VERY BIG FUNCTION!!
}

# Checking for root access
rooter () {
	if [ "$(whoami)" != "root" ]
	then
		echo "You must be a root user to run $0" 2>&1
		echo
		exit 1
	else
		echo "$0 is being run as root, good."
		remove "${@}"
	fi
}

# A Mysterious Function!
param_pam_pam () {

	local PARAMS=`getopt -o d:c:h --long ins-dir:,conf-dir:,help,full -n 'uninstall.sh' -- "${@}"`
	
	eval set -- "${PARAMS}"
	
# extract options and their arguments into variables.
while true ; do
    case "$1" in
        -d|--ins-dir)
            case "$2" in
                "") shift 2 ;;
                *) INST_DIR=${2} ; shift 2 ;;
            esac ;;
        -c|--conf-dir)
            case "$2" in
                "") shift 2 ;;
                *) CONF_DIR=${2} ; shift 2 ;;
            esac ;;
        -h|--help) show_help ; STOP=1; shift ;;
        --full) FULL=1; shift ;;
        --) shift ; break ;;
        *) $STOP=1; echo "--help for help" ; exit 3 ;;
    esac
done
}


param_pam_pam "${@}"
if [ ! ${STOP} != 0 ] ; then rooter; else exit 5 ; fi

#rm -v ${DIR}/kbmsgr{,-{loop,post,read,tui}} (just in case)
#eof
