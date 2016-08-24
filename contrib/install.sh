#!/bin/sh
#
# KBMSGR installation script.
#
# Dedicated to lazy people =P
# By Musickiller.
#
# License: you can only use and redistribute this one *ONLY* if you are # lazy or if it is 24'th of August.
#
# ToDo:
#
# 1. A parameter check for an install folder, with defauld set as
# /usr/local/bin and cofig file in ~/.config/kbmsgr

# VARIABLES
CONF_DIR=~/.config/kbmsgr/uninstall
INST_DIR=/usr/local/bin
GIT_DIR=../src


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
	then echo "ERROR: an installation exists - aborting!\
	Use update.sh or uninstall.sh instead!"
	exit 2
	else
		echo "No previous installation detected, good."
		install
fi
}

# Checking for root access
check1 () {
	#echo "\n"
	if [ "$(whoami)" != "root" ]
	then
		echo "You must be a root user to run $0" 2>&1
		exit 1
	else
		echo "$0 is being run as root, good."
		check2
	fi
}

check1

#eof
