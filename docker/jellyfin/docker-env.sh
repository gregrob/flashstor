#!/bin/sh

# File name of the script is needed to check if it is being sourced
SCRIPT_NAME="docker-env.sh"

# Check if the script is being sourced
if [ "${0##*/}" != "$SCRIPT_NAME" ]
then   
    
    echo "----------------------------------------------"
    echo "Setting up SPECIFIC environment for docker ..."
    echo "----------------------------------------------"
 
    export ENV_JELLYFIN_URL=$ENV_URL
    echo "Exported ENV_JELLYFIN_URL=$ENV_JELLYFIN_URL"

    export ENV_JELLYFIN_PORT=8096
    echo "Exported ENV_JELLYFIN_PORT=$ENV_JELLYFIN_PORT"

    export ENV_JELLYFIN_LOCAL_SORTED_MEDIA=$(cat ./secrets/local_sorted_media_path.secret)
    echo "Exported ENV_JELLYFIN_LOCAL_SORTED_MEDIA=$ENV_JELLYFIN_LOCAL_SORTED_MEDIA"

    export ENV_JELLYFIN_LOCAL_UNSORTED_MEDIA=$(cat ./secrets/local_unsorted_media_path.secret)
    echo "Exported ENV_JELLYFIN_LOCAL_UNSORTED_MEDIA=$ENV_JELLYFIN_LOCAL_UNSORTED_MEDIA"

    export ENV_JELLYFIN_LOCAL_HOME_VIDEOS=$(cat ./secrets/local_home_videos.secret)
    echo "Exported ENV_JELLYFIN_LOCAL_HOME_VIDEOS=$ENV_JELLYFIN_LOCAL_HOME_VIDEOS"

    echo ""

else
    echo "FAIL: Please call script with - source ./env.sh"

    exit 1
  
fi
