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

# VARIABLES
CONF_DIR=~/.config/kbmsgr/uninstall
INST_DIR=`cat $CONF_DIR/inst_dir.conf`
FILES=`cat $CONF_DIR/files.conf`
#GIT_DIR=../src

remove () {
	echo "\nStarted uninstallation.\n"
	
	for FILE in $FILES; do
		rm -v $INST_DIR/$FILE
	done
	
	if [[ "$1" == "full" ]] # not "f" because it could be unintenional.
		then
			echo "\nFull removal of config folder:"
			rm -rf ~/.config/kbmsgr
		else
			echo "\nOnly removing uninstallator's folder:"
			rm -rfv $CONF_DIR
			rmdir -v ~/.config/kbmsgr
	fi
	echo "\nUninstallation is complete!"
	echo "Praise the Emperor\n!"
}

# A BIG FUNCTION IS COMMING!!!!!
show_help () { #BOOM!!!
	echo "${MY_HELP}" #VERY BIG FUNCTION!!
}

check_args () {
	echo $1
	if [ "$1" == "" -o "$1" == "full" ]
		then check_root $1
		else show_help
	fi #this was another GIANT function! (I'm bored...)
}

# Checking for root access
check_root () {
	if [ "$(whoami)" != "root" ]
	then
		echo "You must be a root user to run $0" 2>&1
		echo
		exit 1
	else
		echo "$0 is being run as root, good."
		remove $1
	fi
}

check_args $1 $2

#rm -v ${DIR}/kbmsgr{,-{loop,post,read,tui}} (just in case)
#eof
