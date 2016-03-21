#!/bin/bash
echo "CI: " $CI "TRAVIS: " $TRAVIS

echo "Setup environment"
./setup.sh

echo "grunt"
grunt

echo "building docker image"
VERSION="$1"
if [ -z "$1" ]
  then
    VERSION=0.0.0
fi
echo "version: " ${VERSION}
./build-image.sh "${VERSION}"

if [ -z "$TRAVIS" ]; then
	TAG="${VERSION}"
	IMAGE=dmportella/expressjs:${TAG}

	echo "running container image:" ${IMAGE}
	
	docker run -it --rm --name expressjs --publish 8080:8080 ${IMAGE}

	echo "deleting image"
	docker rmi ${IMAGE}
fi

echo "DONE"