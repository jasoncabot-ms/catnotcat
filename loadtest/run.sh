#!/bin/sh

docker run -e UPLOAD_URL="https://dev.52.155.222.99.nip.io/upload" -v $(pwd -P | sed 's/^\/mnt//')/loadtest:/var/loadtest -i loadimpact/k6 run -u 10 -d 30s /var/loadtest/upload.js
