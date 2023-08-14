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

    export TZ="Australia/Melbourne"
    echo "Exported TZ=$TZ"

    echo ""

else
    echo "FAIL: Please call script with - source ./$SCRIPT_NAME"

    exit 1

fi
