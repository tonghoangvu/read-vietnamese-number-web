#!/bin/bash

# RUN THIS FILE
# Pass image tag as first argument
# Pass host path (absolute path) as second argument
# All arguments should be quoted
# Example: bash run.sh "1.0.0" "$PWD/app"

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -e
set -u

# https://www.shellcheck.net/
# Unavailable in POSIX sh
set -o pipefail
IFS=$'\n\t'

# Don't have any spaces around
BASE=tonghoangvu
IMAGE=rvn-beta
TAG=$1
HOST_PATH=$2 # Must be absolute
CONTAINER_PATH=/app

# Computed variables
CONTAINER_NAME="$BASE"_"$IMAGE"_"$TAG"
IMAGE_NAME="$BASE"/"$IMAGE":"$TAG"

# Print out
echo Image: "$IMAGE_NAME"
echo Container: "$CONTAINER_NAME"
echo Host path: "$HOST_PATH"

# Remove old container (when stopped only)
# Skip and log error if no container found and container is running
docker rm "$CONTAINER_NAME" || true

# Run Docker image
docker run --mount type=bind,source="$HOST_PATH",target="$CONTAINER_PATH" --name "$CONTAINER_NAME" "$IMAGE_NAME"
ls "$HOST_PATH"
