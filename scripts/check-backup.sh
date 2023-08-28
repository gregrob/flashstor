#!/bin/sh

# Check backup folder matches share.
# Uses rsync recomendation at: https://unix.stackexchange.com/questions/170693/compare-directory-trees-regarding-file-name-and-size-and-date
#
# Just date/time and size: rsync -nrvh --delete source/ destination/
# Enforce checksum:        rsync -nrvhc --delete source/ destination/
#
#   -n   perform a trial run with no changes made
#   -r   recurse into directories
#   -v   increase verbosity
#   -h   human readable
#   -c   skip based on checksum, not mod-time & size
#
# Note the usage of trailing slashes in source/ and destination/, they are significant in rsync
#

# Base directories
BASE_DIR_SHARE='/share'
BASE_DIR_BACKUP='/share/USB1/backup'


# Draw a line
draw_line () {
    echo "--------------------------------------------------------------------------------"

}


# Check script is called from the correct location
check_backup () {

    draw_line
    echo 'Checking share \'$1
    draw_line
    rsync -nrvh --delete $BASE_DIR_SHARE/$1/ $BASE_DIR_BACKUP/$1/
    echo

}



check_backup "appliances"
check_backup "backup"
check_backup "camera-output"
check_backup "development"

check_backup "incoming"

check_backup "misc"
check_backup "other"
check_backup "photo-library"
check_backup "photo-library-temp"
check_backup "photos"

check_backup "qmailagent"
check_backup "scanner-output"
check_backup "software"
check_backup "tftp"

check_backup "transfer"
check_backup "video"
check_backup "vm"

