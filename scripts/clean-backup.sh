#!/bin/sh

# Include helper functions
FOLDER_HELPERS=$(dirname "$0")/helpers

source ${FOLDER_HELPERS}/execute-rsync.sh ${FOLDER_HELPERS}


# Folders
FOLDER_APPLIANCES="appliances"
FOLDER_DOWNLOADS="downloads"
FOLDER_MEDIA="media"
FOLDER_OTHER="other"
FOLDER_SCANNER_OUTPUT="scanner-output"
FOLDER_SERVER_BACKUP="server-backup"
FOLDER_TRANSFER="transfer"
FOLDER_VIDEO="video"

FOLDER_SERVER="server"
FOLDER_SERVER_MOUNTS="server-mounts"
FOLDER_SERVER_SECRETS="server-secrets"


# Invalid parameters
invalid_parameters () {
    printf "Usage: $0 [what]\n"
    printf "\n"
    printf "  ${FOLDER_APPLIANCES}\n"
    printf "  ${FOLDER_DOWNLOADS}\n"
    printf "  ${FOLDER_MEDIA}\n"
    printf "  ${FOLDER_OTHER}\n"
    printf "  ${FOLDER_SCANNER_OUTPUT}\n"
    printf "  ${FOLDER_SERVER_BACKUP}\n"
    printf "  ${FOLDER_TRANSFER}\n"
    printf "  ${FOLDER_VIDEO}\n"
    printf "\n"
    printf "  ${FOLDER_SERVER}\n"
    printf "  ${FOLDER_SERVER_MOUNTS}\n"
    printf "  ${FOLDER_SERVER_SECRETS}\n"
    printf "\n"

    # Exit from the script
    exit 1
}



# Check parameter calling
if [ "$1" = ${FOLDER_APPLIANCES} ]; then
    clean_backup ${FOLDER_APPLIANCES}

elif [ "$1" = ${FOLDER_DOWNLOADS} ]; then
    clean_backup ${FOLDER_DOWNLOADS}

elif [ "$1" = ${FOLDER_MEDIA} ]; then
    clean_backup ${FOLDER_MEDIA}

elif [ "$1" = ${FOLDER_OTHER} ]; then
    clean_backup ${FOLDER_OTHER}

elif [ "$1" = ${FOLDER_SCANNER_OUTPUT} ]; then
    clean_backup ${FOLDER_SCANNER_OUTPUT}

elif [ "$1" = ${FOLDER_SERVER_BACKUP} ]; then
    clean_backup ${FOLDER_SERVER_BACKUP}

elif [ "$1" = ${FOLDER_TRANSFER} ]; then
    clean_backup ${FOLDER_TRANSFER}

elif [ "$1" = ${FOLDER_VIDEO} ]; then
    clean_backup ${FOLDER_VIDEO}

elif [ "$1" = ${FOLDER_SERVER} ]; then
    clean_backup ${FOLDER_SERVER}

elif [ "$1" = ${FOLDER_SERVER_MOUNTS} ]; then
    clean_backup ${FOLDER_SERVER_MOUNTS}

elif [ "$1" = ${FOLDER_SERVER_SECRETS} ]; then
    clean_backup ${FOLDER_SERVER_SECRETS}

else
    invalid_parameters

fi
