#!/bin/bash

if [[ "$LOCUST_MODE" = "master" ]]; then
    echo "Setting up GCS Fuse..."

    apt update && apt install -y lsb-release
    export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
    echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
    apt update && apt install -y gcsfuse

    rm /locust/stats/*.* 
    gcsfuse $GCS_LOG_BUCKET /locust/stats

    echo "Finished."
elif [[ "$LOCUST_MODE" = "worker" ]]; then
    echo "Slave does not require connection to GCS"
fi