#!/bin/sh 

SEARCH_PATH=$1
validator --exclude-dirs=$2 --exclude-file-types=$3 --reporter=$4 $SEARCH_PATH
