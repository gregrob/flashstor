#!/bin/sh

# Check backup folder matches share.
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
OPTIONS_BASE_RSYNC='-nrvh --delete'


# Draw a line
draw_line () {
    echo "--------------------------------------------------------------------------------"

}


# Check script is called from the correct location
check_backup () {
    draw_line
    echo 'Checking share \'$1
    draw_line

    # Handle the second argument as an exclude directive
    if [ -z "$2" ]
      then
        # No exclude directive
        OPTIONS_FINAL_RSYNC=$OPTIONS_BASE_RSYNC 

      else
        # Exclude directive
        OPTIONS_FINAL_RSYNC=$OPTIONS_BASE_RSYNC" --exclude "$2
    fi

    echo "command: "$OPTIONS_FINAL_RSYNC
    rsync $OPTIONS_FINAL_RSYNC $BASE_DIR_SHARE/$1/ $BASE_DIR_BACKUP/$1/
    echo

}


# Full check of the NAS
full_nas_check() {
    check_backup "appliances"
    check_backup "backup"
    check_backup "camera-output"
    check_backup "development"

    check_backup "downloads"
    check_backup "incoming"
    check_backup "media"
    check_backup "misc"
    check_backup "other"
    check_backup "photo-library"
    check_backup "photo-library-temp"
    check_backup "photos"

    check_backup "qmailagent"
    check_backup "scanner-output"
    check_backup "server"
    check_backup "server-backup"
    check_backup "software"
    check_backup "tftp"

    check_backup "transfer"
    check_backup "video"
    check_backup "vm" "virtualbox"
    check_backup "Web"

}


full_nas_check


