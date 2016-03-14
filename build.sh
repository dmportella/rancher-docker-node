#!/bin/bash
echo "CI: " $CI "TRAVIS: " $TRAVIS

echo "Setup environment"
./setup.sh

echo "grunt"
grunt

echo "build docker image"
./build-image.sh

if [ -z "$TRAVIS" ]; then
	TAG=${TAG:-$(grep version dockerfile | awk '{print $3}')}
	IMAGE=dmportella/expressjs:${TAG}

	echo "running container image:" ${IMAGE}
	
	docker run -it --rm --name expressjs --publish 8080:8080 ${IMAGE}

	echo "deleting image"
	docker rmi ${IMAGE}
fi

echo "DONE"