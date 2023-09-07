#!/bin/sh

# File name of the script is needed to check if it is being sourced
SCRIPT_NAME="docker-env.sh"

# Check if the script is being sourced
if [ "${0##*/}" != "$SCRIPT_NAME" ]
then
    echo "--------------------------------------------"
    echo "Setting up COMMON environment for docker ..."
    echo "--------------------------------------------"

    export HOSTNAME=$HOSTNAME
    echo "Exported HOSTNAME=$HOSTNAME"

    export ENV_URL="flashstor.max.lan"
    echo "Exported ENV_URL=$ENV_URL"

    export TZ="Australia/Melbourne"
    echo "Exported TZ=$TZ"


    #export ENV_DOCKER_USER=$USER
    export ENV_DOCKER_USER="greg"
    echo "Exported ENV_DOCKER_USER=$ENV_DOCKER_USER"

    export ENV_DOCKER_UID=$(id -u $ENV_DOCKER_USER)
    echo "Exported ENV_DOCKER_UID=$ENV_DOCKER_UID"

    export ENV_DOCKER_GID=$(id -g $ENV_DOCKER_USER)
    echo "Exported ENV_DOCKER_GID=$ENV_DOCKER_GID"


    export ENV_SMTP_PASSWORD=$(cat ../secrets/gmail.pwd)
    echo "Exported ENV_SMTP_PASSWORD=$ENV_SMTP_PASSWORD"

    export ENV_SMTP_USER_NAME=$(cat ../secrets/gmail_user.secret)
    echo "Exported ENV_SMTP_USER_NAME=$ENV_SMTP_USER_NAME"

    export ENV_NOTIFICATION_EMAIL=$(cat ../secrets/notify_user_email.secret)
    echo "Exported ENV_NOTIFICATION_EMAIL=$ENV_NOTIFICATION_EMAIL"



    echo ""

else
    echo "FAIL: Please call script with - source ./$SCRIPT_NAME"

    exit 1

fi
