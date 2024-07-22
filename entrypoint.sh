#!/bin/sh

# Entrypoint wrapper for the validator executable
# Maps the string of inputs to CLI arguments

set -e

SEARCH_PATHS=$1
EXCLUDE_DIRS=$2
EXCLUDE_FILE_TYPES=$3
DEPTH=$4
REPORTER=$5
GROUP_BY=$6

CMD=validator

if [ -n "$EXCLUDE_DIRS" ]; then
  CMD="$CMD --exclude-dirs=$EXCLUDE_DIRS"
fi

if [ -n "$EXCLUDE_FILE_TYPES" ]; then
  CMD="$CMD --exclude-file-types=$EXCLUDE_FILE_TYPES"
fi

if [ -n "$DEPTH" ]; then
  CMD="$CMD --depth=$DEPTH"
fi

if [ -n "$REPORTER" ]; then
  CMD="$CMD --reporter=$REPORTER"
fi

if [ -n "$GROUP_BY" ]; then
  CMD="$CMD --group-by=$GROUP_BY"
fi

( "${CMD}" "${SEARCH_PATHS}" )
