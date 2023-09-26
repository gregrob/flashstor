#!/bin/sh

# Include helper functions
FOLDER_HELPERS=$(dirname "$0")/helpers

source ${FOLDER_HELPERS}/execute-rsync.sh ${FOLDER_HELPERS}



# Full check of the NAS - static folders
full_nas_check_static() {
    check_backup "appliances"
    check_backup "backup"
    check_backup "camera-output"
    check_backup "development"

    check_backup "downloads"
    check_backup "incoming"
    check_backup "media" "--exclude /library"  ### Exclude symlinks to libraries
    check_backup "misc"
    check_backup "other"
    check_backup "photo-library"
    check_backup "photo-library-temp"
    check_backup "photos"

    check_backup "qmailagent"
    check_backup "scanner-output"
    ### dynamic - check_backup "server"
    check_backup "server-backup"
    ### dynamic check_backup "server-mounts"
    check_backup "software"
    check_backup "tftp"

    check_backup "transfer"
    check_backup "video"
    check_backup "vm" "--exclude /virtualbox"  ### Exclude virtualbox VM's
    check_backup "Web" "--exclude /qnap/readme.txt"  ### Exclude symlink to txt file

}

# Full check of the NAS - dynamic folders
full_nas_check_dynamic() {
    check_backup "server" "--exclude /docker --exclude /servers/flashstor"  ### Exclude docker containers and server symlinks
    check_backup "server-mounts"
}



# Invalid parameters
invalid_parameters () {
    printf "Usage: $0 [what]\n"
    printf "\n"
    printf "  all     - all folders\n"
    printf "  static  - only folders with static content\n"
    printf "\n"

    # Exit from the script
    exit 1
}



# Check parameter calling
if [ "$1" = "all" ]; then
    printf "Checking ALL folders.\n"

    full_nas_check_static
    full_nas_check_dynamic


elif [ "$1" = "static" ]; then
    printf "Checking STATIC folders.\n"

    full_nas_check_static


else
    invalid_parameters

fi
