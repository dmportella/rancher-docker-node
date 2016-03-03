#!/bin/bash

TAG=${TAG:-$(grep version dockerfile | awk '{print $3}')}
IMAGE=tests/expressjs:${TAG}

docker build -t ${IMAGE} .

echo "done building" ${IMAGE}
