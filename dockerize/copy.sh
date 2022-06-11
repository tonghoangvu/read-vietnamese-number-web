#!/bin/sh

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -e
set -u

# https://www.shellcheck.net/
# Unavailable in POSIX sh
# set -o pipefail
# IFS=$'\n\t'

# Prepare
rm -rf /app/**
mkdir -p /app/

# Copy (/app, not /output, not /)
cp -r /output/** /app

# Done
echo OK
