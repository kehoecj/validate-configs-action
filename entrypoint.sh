#!/bin/sh

# Entrypoint wrapper for the validator executable
# Maps the string of inputs to CLI arguments

set -e

SEARCH_PATHS=$1
validator --exclude-dirs=$2 --exclude-file-types=$3 --depth=$4 --reporter=$5 --group-by=$6 ${SEARCH_PATHS}