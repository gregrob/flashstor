#!/bin/sh

# File name of the script is needed to check if it is being sourced
SCRIPT_NAME="docker-env.sh"

# Check if the script is being sourced
if [ "${0##*/}" != "$SCRIPT_NAME" ]
then   
    
    echo "----------------------------------------------"
    echo "Setting up SPECIFIC environment for docker ..."
    echo "----------------------------------------------"
 
    export ENV_QBITTORRENT_UI_PORT=8082
    echo "Exported ENV_QBITTORRENT_UI_PORT=$ENV_QBITTORRENT_UI_PORT"

    export ENV_QBITTORRENT_TORRENT_PORT=$(cat ./secrets/torrent_port.secret)
    echo "Exported ENV_QBITTORRENT_TORRENT_PORT=$ENV_QBITTORRENT_TORRENT_PORT"

    echo ""

else
    echo "FAIL: Please call script with - source ./env.sh"

    exit 1
  
fi
