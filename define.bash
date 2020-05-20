#!/bin/bash

global_rematch() {
  local s=$1 regex=$2
  while [[ $s =~ $regex ]]; do
    echo "${BASH_REMATCH[1]}"
    s=${s#*"${BASH_REMATCH[1]}"}
  done
}

if [ -z "$TAG" ]; then
  TAG=$(global_rematch $INPUT_REF "refs\/tags\/(.*)")
  BRANCH=$(global_rematch $INPUT_REF "refs\/heads\/(.*)")
fi

# TAG
BRANCH=${BRANCH//[\/\\.]/_}
if [ -z "$TAG" ]; then
  TAG=$BRANCH
  TYPE="branch"
else
  TYPE="tag"
fi

BRANCH_LOWER=$BRANCH
BRANCH=$(echo $BRANCH | tr '[:lower:]' '[:upper:]')

 echo "::set-output name=branch_not_formatted::$BRANCH_LOWER"
 echo "::set-output name=branch::$BRANCH"
 echo "::set-output name=tag::$TAG"
 echo "::set-output name=type::$TYPE"
