#!/usr/bin/env bash
# Script to move data from one place to another
# Run on the RECIEVING END
# Credential management is your job to handle.
#
#
# After running this, empty dirs are likely to remain in the origin.
# See these pages for information:
#	 https://superuser.com/questions/676671/rsync-does-not-delete-source-directories
# https://linux.die.net/man/1/find
# This command will remove empty dirs:
#	'find . -depth -type d -empty -delete'
#
#
# By Ctrl-S 2019
#
# https://devhints.io/bash
# http://manpages.ubuntu.com/manpages/precise/man1/rsync.1.html


# Name of THIS file:
script_name="rsync_someproject"
script_filename="${script_name}.sh"
start_date=`date +"%s"`


# Note to console script is at the start of the file
echo "${script_name}: Starting script at start_date=${start_date}"


# Use 'strict mode' for BASH to avoid bugs that can break something
# https://devhints.io/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'



# Copy this script to record EXACTLY what happened when it ran
#script_filepath="${pwd}/${script_filename}"
#script_backup_filepath="${script_filename}.${start_date}.backup"
#cp $script_filepath $script_backup_filepath


# ===== ===== ===== =====
# OPTIONS
# 
# '''You can think of a trailing / on a source as  meaning
#    "copy  the  contents of this directory" as opposed to "copy the directory by name"'''
#       - http://manpages.ubuntu.com/manpages/precise/man1/rsync.1.html
#
# Origin path for rsync:
origin="USERNAME@ORIGIN_SERVER_LOCATION:/home/USERNAME/PROJECT_NAME/"
# Dest path for rsync:
dest="/media/DRIVENAME/ORIGIN_HOSTNAME/rsync/PROJECT_NAME"
# Log path for rsync:
log_path="/media/DRIVENAME/ORIGIN_HOSTNAME/log/${script_name}.${start_date}.log"
# Bandwidth limit for rsync, in KBPS:
bandwidth_limit="300"
# Remote port:
remote_port='22'


# Ensure destination dir exists
echo "${script_name}: Creating dest: $dest."
mkdir -p $dest


# Prepare arguments
# Store as an array to permit easier debugging and comments.
# https://stackoverflow.com/questions/9522631/how-to-put-a-line-comment-for-a-multi-line-command/12797512#12797512
rsync_args=(
	--verbose
	--progress
	--archive
	--compress
	--remove-source-files
	--partial
	--partial-dir='.rsync-partial'
	--filter='R  .rsync-partial/'
	--log-file=$log_path
	--itemize-changes
	--progress
	--human-readable
	--bwlimit="$bandwidth_limit"
	--rsh="ssh -p $remote_port"
	"$origin"
	"$dest"
	)


# Dislpay arguments
echo "${script_name}: rsync_args: ${rsync_args[@]}"
# Note that rsync is about to run.
echo "${script_name}: Invoking rsync."


# Run rsync.
rsync "${rsync_args[@]}"


# Remind user that empty dirs may have been left behind by rsync.
echo "${script_name}: Remember to go and remove any leftover empty dirs in the source location."
# Note to console script has reached the end of the file.
end_date=`date +"%s"`
echo "${script_name}: End of script. start_date=${start_date}; end_date=${end_date}"