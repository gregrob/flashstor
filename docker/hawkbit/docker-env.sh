#!/bin/sh

# File name of the script is needed to check if it is being sourced
SCRIPT_NAME="docker-env.sh"

# Check if the script is being sourced
if [ "${0##*/}" != "$SCRIPT_NAME" ]
then   
    
    echo "----------------------------------------------"
    echo "Setting up SPECIFIC environment for docker ..."
    echo "----------------------------------------------"

    export ENV_HAWKBIT_GENERIC_USER="admin"
    echo "Exported ENV_HAWKBIT_GENERIC_USER=$ENV_HAWKBIT_GENERIC_USER"

    export ENV_HAWKBIT_GENERIC_PWD=$(cat ./secrets/generic.pwd)
    echo "Exported ENV_HAWKBIT_GENERIC_PWD=$ENV_HAWKBIT_GENERIC_PWD"

    export ENV_HAWKBIT_GENERIC_EMAIL=$(cat ./secrets/generic_email.secret)
    echo "Exported ENV_HAWKBIT_GENERIC_EMAIL=$ENV_HAWKBIT_GENERIC_EMAIL"

    echo ""

else
    echo "FAIL: Please call script with - source ./env.sh"

    exit 1
  
fi
