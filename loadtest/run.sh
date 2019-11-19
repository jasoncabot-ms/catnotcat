#!/bin/sh

BASE_PATH=$(pwd -P)
DOCKER_VOLUME_PATH=$(echo $BASE_PATH | sed 's/^\/mnt//')

docker run -e UPLOAD_URL="https://dev.52.155.222.99.nip.io/upload" -v $DOCKER_VOLUME_PATH/loadtest:/var/loadtest -i loadimpact/k6 run -u 10 -d 30s /var/loadtest/upload.js -q --out json=/var/loadtest/results.json

node $BASE_PATH/loadtest/k6ToAzure.js $BASE_PATH/loadtest/results.json "Load Test for ${1}" "${2}" "${3}"