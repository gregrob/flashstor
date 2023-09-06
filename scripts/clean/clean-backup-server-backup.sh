#!/bin/sh

# Cleans a backup folder (deleting extra files).
# Uses rsync recomendation at: https://unix.stackexchange.com/questions/170693/compare-directory-trees-regarding-file-name-and-size-and-date
#
# Just date/time and size: rsync -nrvh --delete source/ destination/
# Enforce checksum:        rsync -nrvhc --delete source/ destination/
#
#   -n          perform a trial run with no changes made
#   -r          recurse into directories
#   -v          increase verbosity
#   -h          human readable
#   -c          skip based on checksum, not mod-time & size
#
#   --delete    delete extraneous files from dest dirs
#
#   --exclude   exclude files matching PATTERN
#
#
# Note the usage of trailing slashes in source/ and destination/, they are significant in rsync
#

# Base directories
BASE_DIR_SHARE='/share'
BASE_DIR_BACKUP='/share/USB1/backup'

# Base options for rsync
OPTIONS_BASE_RSYNC='-rvh --delete'


# Draw a line
draw_line () {
    echo "--------------------------------------------------------------------------------"

}


# Check script is called from the correct location
clean_backup () {
    draw_line
    echo 'Cleaning share \'$1
    draw_line

    echo

    OPTIONS_FINAL_RSYNC=$OPTIONS_BASE_RSYNC 

    echo "command: "$OPTIONS_FINAL_RSYNC
    rsync $OPTIONS_FINAL_RSYNC $BASE_DIR_SHARE/$1/ $BASE_DIR_BACKUP/$1/
    echo

}


clean_backup "server-backup"


