#!/bin/sh
#
# KBMSGR installation script.
#
# Dedicated to lazy people =P
# By Musickiller.
#
# License: you can only use and redistribute this one *ONLY* if you
# are lazy or if it is 24'th of August. And NEVER ask me how it works!
#
# ToDo:
#
# 1. bash -c '[[ -w /usr/local/bin ]] || echo "no way, josé"'

# VARIABLES
ME="${0##*/}"
MYPATH="${0}"
MY_HELP="\
usage: ${ME} [options]

options:
    --inst-dir  -d <dirrecory>  change installation dirrectory
                                (default - /usr/local/bin)
    --conf-dit  -c <dirrecory>  change uninstaller's data directory
                                (default - ~/.config/kbmsgr/uninstall)
    --help      -h              display help and exit
"
CONF_DIR=~/.config/kbmsgr/uninstall
INST_DIR=/usr/local/bin
GIT_DIR=../src
STOP=0

# FUNCTIONS
install () {
	echo "\nInstalling...\n"

	# Make a folder for installation data
	mkdir -p $CONF_DIR
	
	# Save installation parameters:
	echo "$INST_DIR" > $CONF_DIR/inst_dir.conf
	
	# List all files to install
	FILES=`ls $GIT_DIR | grep kbmsgr`

	# Write the list (to know what to install)
	# ...and opy files.
	for FILE in $FILES; do
		echo "$FILE" >> $CONF_DIR/files.conf
		cp -v $GIT_DIR/$FILE $INST_DIR
	done 
	
	echo "\nDone!\n"
}

#Checking for old installations
check2 () { # tabulation is broken, coz I'm lazy and in gedit.
if [ -f $CONF_DIR/files.conf ]
	then echo "\nERROR: an installation exists - aborting!
Use update.sh or uninstall.sh instead!\n"
	exit 2
	else
		echo "No previous installation detected, good."
		install
fi
}

# Checking for root access
check1 () {
	#echo "\n"
	if [ -w $INST_DIR ]
	then
		echo "\nHave access to $INST_DIR"
		check2
	else
		echo "\nYou don't have access to $INST_DIR - aborting!\n" 2>&1
		exit 1
	fi
}


show_help () {
	echo "${MY_HELP}"
}


# A Mysterious Function!
param_pam_pam () {

	PARAMS=`getopt -o d:c:h --long ins-dir:,conf-dir:,help -n 'install.sh' -- "${@}"`
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
        --) shift ; break ;;
        *) $STOP=1; echo "--help for help" ; exit 3 ;;
    esac
done
}


param_pam_pam "${@}"
if [ ! ${STOP} != 0 ] ; then check1; else exit 5 ; fi


#eof
