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

    echo ""

else
    echo "FAIL: Please call script with - source ./env.sh"

    exit 1
  
fi
