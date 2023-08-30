#!/bin/sh

# File name of the script is needed to check if it is being sourced
SCRIPT_NAME="docker-env.sh"

# Check if the script is being sourced
if [ "${0##*/}" != "$SCRIPT_NAME" ]
then   
    
    echo "----------------------------------------------"
    echo "Setting up SPECIFIC environment for docker ..."
    echo "----------------------------------------------"

    export ENV_DVB_SMTP_PASSWORD=$ENV_SMTP_PASSWORD
    echo "Exported ENV_DVB_SMTP_PASSWORD=$ENV_DVB_SMTP_PASSWORD"

    export ENV_DVB_SMTP_USER_NAME=$ENV_SMTP_USER_NAME
    echo "Exported ENV_DVB_SMTP_USER_NAME=$ENV_DVB_SMTP_USER_NAME"

    export ENV_DVB_NOTIFICATION_EMAIL=$ENV_NOTIFICATION_EMAIL
    echo "Exported ENV_DVB_NOTIFICATION_EMAIL=$ENV_DVB_NOTIFICATION_EMAIL"

    # This is always +1 (e.g. a value of 9 keeps 10 backups)
    export ENV_KEEP_LAST_BACKUPS="9"
    echo "Exported ENV_KEEP_LAST_BACKUPS=$ENV_KEEP_LAST_BACKUPS"

    echo ""

else
    echo "FAIL: Please call script with - source ./env.sh"

    exit 1
  
fi
