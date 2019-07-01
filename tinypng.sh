#!/bin/bash

FILENAME=$1
HAS_JQ=`which jq`

if [ "$HAS_JQ" == "" ]
then
  echo "jq is required"
  exit 1
fi

if [ -e $FILENAME ]
then
  if [ -z $TINYPNG_KEY ]
  then
    echo "No TINYPNG_KEY set"
    exit 1
  else
    echo "Converting \"$FILENAME\"..."
    OUTPUT_URL=$(curl --user "api:$TINYPNG_KEY" \
      --data-binary @"$FILENAME" -s https://api.tinify.com/shrink \
      | jq -r ".output.url"
    )

    echo "Fetching converted image..."
    curl $OUTPUT_URL -s --output $FILENAME

    echo "\"$FILENAME\" converted!"
  fi
else
  echo "File: \"$FILENAME\" not found"
  exit 1
fi
