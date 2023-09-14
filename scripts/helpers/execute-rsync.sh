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

# Include functions for drawing lines
#source $(dirname "$0")/helpers/draw-line.sh
source $1/draw-line.sh



# Base directories
BASE_DIR_SHARE='/share'
BASE_DIR_BACKUP='/share/USB1/backup'



# Colours to use in echo
COL_HEAD='\033[97;1m'                 # Heading colour - bold bright white
COL_RESET='\033[0m'                   # No colour

# Base options for rsync
OPT_BASE_RSYNC_DR='-nrvh --delete'    # Dry run sync
OPT_BASE_RSYNC_EX='-rvh --delete'     # Execute sync



# Execute the rsync command
#  $1 - source directory
#  $2 - destination directory
#  $3 - base rsync command
#  $4 - extended rsync options (i.e. exclude directories)
#  
rsync_command () {

    # Handle the second argument as an exclude directive
    if [ -z "$4" ]
      then
        # No exclude directive
        OPTIONS_FINAL_RSYNC="${3}"

      else
        # Exclude directive
        OPTIONS_FINAL_RSYNC="${3} ${4}"
    fi

    draw_line
    printf "${COL_HEAD}Processing ${1}${COL_RESET}\n"
    printf " source: ${1}\n"
    printf " destination: ${2}\n"
    printf " base command: ${3}\n"
    printf " extended options: ${4}\n"
    printf " command: rsync ${OPTIONS_FINAL_RSYNC} ${1} ${2}\n"
    draw_line

    rsync ${OPTIONS_FINAL_RSYNC} ${1} ${2}

    printf "\n"
}



# Execute a check of a share (dry run)
#  $1 - share
#  $2 - extended rsync options (i.e. exclude directories)
#
check_backup () {

    rsync_command "${BASE_DIR_SHARE}/${1}/" "${BASE_DIR_BACKUP}/${1}/" "${OPT_BASE_RSYNC_DR}" "${2}"
}


