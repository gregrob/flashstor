#!/bin/sh

# File name of the script is needed to check if it is being sourced
SCRIPT_NAME="docker-env.sh"

# Check if the script is being sourced
if [ "${0##*/}" != "$SCRIPT_NAME" ]
then   
    
    echo "----------------------------------------------"
    echo "Setting up SPECIFIC environment for docker ..."
    echo "----------------------------------------------"

    #export EXAMPLE="example var"
    #echo "Exported EXAMPLE=$EXAMPLE"

    export ENV_SMTP_PASSWORD=$(cat ./secrets/gmail.pwd)
    echo "Exported ENV_SMTP_PASSWORD=$ENV_SMTP_PASSWORD"

    # This is always +1 (e.g. a value of 9 keeps 10 backups)
    export ENV_KEEP_LAST_BACKUPS="9"
    echo "Exported ENV_KEEP_LAST_BACKUPS=$ENV_KEEP_LAST_BACKUPS"

    echo ""

else
    echo "FAIL: Please call script with - source ./env.sh"

    exit 1
  
fi
