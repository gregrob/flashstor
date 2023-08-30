#!/bin/sh

# File name of the script is needed to check if it is being sourced
SCRIPT_NAME="docker-env.sh"

# Check if the script is being sourced
if [ "${0##*/}" != "$SCRIPT_NAME" ]
then   
    
    echo "----------------------------------------------"
    echo "Setting up SPECIFIC environment for docker ..."
    echo "----------------------------------------------"
 
    export ENV_GITLAB_URL="flashstor.max.lan"
    echo "Exported ENV_GITLAB_URL=$ENV_GITLAB_URL"

    export ENV_GITLAB_HTTP_PORT=9080
    echo "Exported ENV_GITLAB_HTTP_PORT=$ENV_GITLAB_HTTP_PORT"

    export ENV_GITLAB_SSH_PORT=9022
    echo "Exported ENV_GITLAB_SSH_PORT=$ENV_GITLAB_SSH_PORT"

    export ENV_GITLAB_SMTP_USER_NAME=$(cat ./secrets/gmail_user.pwd)
    echo "Exported ENV_GITLAB_SMTP_USER_NAME=$ENV_GITLAB_SMTP_USER_NAME"

    export ENV_GITLAB_SMTP_PASSWORD=$(cat ./secrets/gmail.pwd)
    echo "Exported ENV_GITLAB_SMTP_PASSWORD=$ENV_GITLAB_SMTP_PASSWORD"

    echo ""

else
    echo "FAIL: Please call script with - source ./env.sh"

    exit 1
  
fi
