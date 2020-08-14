#!/usr/bin/env bash
# Name of THIS file:
script_name="rsync_loop.sh"
# 
# Script to repeatedly run other scripts that
#	move data from one place to another
#	unattended.
#
# Run on the RECIEVING END
#
# Credential management is your job to handle.
#
# After running this, empty dirs are likely to remain in the origin.
# See these pages for information:
#	 https://superuser.com/questions/676671/rsync-does-not-delete-source-directories
	# https://linux.die.net/man/1/find
# This command will remove empty dirs:
#	'find . -depth -type d -empty -delete'
#
# By Ctrl-S 2019
#
# https://devhints.io/bash
# http://manpages.ubuntu.com/manpages/precise/man1/rsync.1.html
# https://stackoverflow.com/questions/13296863/difference-between-wait-and-sleep
# https://www.cyberciti.biz/faq/unix-linux-bash-get-time/


# Note to console script is at the start of the file
echo "${script_name}: Starting script."


# Use 'strict mode' for BASH to avoid bugs that can break something
# https://devhints.io/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#set -euo pipefail
# set -e # Exit if any command returns nonzero exit-code.
# set -u # Exit on undeclared variable usage.
# set -o pipefail # Return nonzero exit-code if ANY command in a pipeline did not return zero.
#
set -uo pipefail # This script runs others that MAY fail, so tolerate nonzero exit codes from those. (no -e)
IFS=$'\n\t'


# ===== ===== ===== =====
# Options
#
# Time to sleep/delay after sub-scripts in seconds.
subScriptDelay=600 # 10 minutes = 10 * 60s = 600s
# Time to delay between each loop in seconds.
loopDelay=1800 # 30 minutes = 30 * 60s = 1800s
#
#
#


# Loop over the various task-specific scripts.
# Each should be launched in a subshell.
while true; do
	# Display that we're at the beginning of a new loop.
	# Display the current time.
	# https://tecadmin.net/get-current-date-and-time-in-bash/
	loopDate=`date`
	echo "${script_name}: Starting new loop at ${loopDate}"
	

	# Task 1 - someproject
	taskOne="rsync_someproject.sh"
	echo "${script_name}: `date` - Running ${taskOne}"
	(bash "$taskOne")
	echo "${script_name}: `date` - Finished ${taskOne}, last exit code=$? "
	sleep $subScriptDelay


	# Task 2 - otherproject
	taskTwo="rsync_otherproject.sh"
	echo "${script_name}: `date` - Running ${taskTwo}"
	(bash "$taskTwo")
	echo "${script_name}: `date` - Finished ${taskTwo}, last exit code=$? "
	sleep $subScriptDelay

	# Task 3 - outbound to inbound
	taskThree="rsync_outbound_to_inbound.sh"
	echo "${script_name}: `date` - Running ${taskThree}"
	(bash "$taskThree")
	echo "${script_name}: `date` - Finished ${taskThree}, last exit code=$? "
	sleep $subScriptDelay

	# Sleep between cycles to avoid putting too much load on connection, machines, etc.
	sleep $loopDelay
done

echo "${script_name}: End of script."