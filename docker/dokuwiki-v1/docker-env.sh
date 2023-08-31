#!/bin/sh

# File name of the script is needed to check if it is being sourced
SCRIPT_NAME="docker-env.sh"

# Check if the script is being sourced
if [ "${0##*/}" != "$SCRIPT_NAME" ]
then   
    
    echo "----------------------------------------------"
    echo "Setting up SPECIFIC environment for docker ..."
    echo "----------------------------------------------"


    export ENV_DOKUWIKI_USER_NAME=$(cat ./secrets/username.secret)
    echo "Exported ENV_DOKUWIKI_USER_NAME=$ENV_DOKUWIKI_USER_NAME"

    export ENV_DOKUWIKI_FULL_NAME=$(cat ./secrets/fullname.secret)
    echo "Exported ENV_DOKUWIKI_FULL_NAME=$ENV_DOKUWIKI_FULL_NAME"

    export ENV_DOKUWIKI_PASSWORD=$(cat ./secrets/password.pwd)
    echo "Exported ENV_DOKUWIKI_PASSWORD=$ENV_DOKUWIKI_PASSWORD"

    export ENV_DOKUWIKI_EMAIL=$(cat ./secrets/email.secret)
    echo "Exported ENV_DOKUWIKI_EMAIL=$ENV_DOKUWIKI_EMAIL"

    echo ""

else
    echo "FAIL: Please call script with - source ./env.sh"

    exit 1
  
fi
