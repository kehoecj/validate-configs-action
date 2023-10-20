#!/bin/sh

# Entrypoint wrapper for the validator executable
# Maps the string of inputs to CLI arguments

set -e

SEARCH_PATH=$1
validator --exclude-dirs=$2 --exclude-file-types=$3 --reporter=$4 $SEARCH_PATH