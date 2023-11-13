#!/bin/sh

# Include helper functions
FOLDER_HELPERS=$(dirname "$0")/helpers

source ${FOLDER_HELPERS}/execute-rsync.sh ${FOLDER_HELPERS}


# Folders
FOLDER_DOWNLOADS="downloads"
FOLDER_MEDIA="media"
FOLDER_SERVER_BACKUP="server-backup"

FOLDER_SERVER="server"
FOLDER_SERVER_MOUNTS="server-mounts"


# Invalid parameters
invalid_parameters () {
    printf "Usage: $0 [what]\n"
    printf "\n"
    printf "  ${FOLDER_DOWNLOADS}\n"
    printf "  ${FOLDER_MEDIA}\n"
    printf "  ${FOLDER_SERVER_BACKUP}\n"
    printf "\n"
    printf "  ${FOLDER_SERVER}\n"
    printf "  ${FOLDER_SERVER_MOUNTS}\n"
    printf "\n"

    # Exit from the script
    exit 1
}



# Check parameter calling
if [ "$1" = ${FOLDER_DOWNLOADS} ]; then
    clean_backup ${FOLDER_DOWNLOADS}

elif [ "$1" = ${FOLDER_MEDIA} ]; then
    clean_backup ${FOLDER_MEDIA}

elif [ "$1" = ${FOLDER_SERVER_BACKUP} ]; then
    clean_backup ${FOLDER_SERVER_BACKUP}

elif [ "$1" = ${FOLDER_SERVER} ]; then
    clean_backup ${FOLDER_SERVER}

elif [ "$1" = ${FOLDER_SERVER_MOUNTS} ]; then
    clean_backup ${FOLDER_SERVER_MOUNTS}

else
    invalid_parameters

fi
