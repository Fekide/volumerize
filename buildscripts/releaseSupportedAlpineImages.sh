#!/bin/bash -x

set -o errexit    # abort script at first error

# Setting environment variables
readonly CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

printf '%b\n' ":: Reading release config...."
source $CUR_DIR/release.sh

readonly PUSH_REPOSITORY=$1
readonly PUSH_IMAGE_TAG=$IMAGE_TAG

function pushImage() {
  local tagname=$1
  local repository=$2

  docker push fekide/volumerize:$tagname
}

pushImage $PUSH_IMAGE_TAG $PUSH_REPOSITORY
