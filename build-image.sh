#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Missing version'
    exit 1
fi

REPO=dmportella/expressjs
TAG="$1"
IMAGE=${REPO}:${TAG}

echo "docker build -t ${IMAGE} ."
docker build --build-arg CONT_IMG_VER=${TAG} -t ${IMAGE} .

echo "Tagging latest" IMAGE 

echo "docker tag ${IMAGE} ${REPO}:latest"
docker tag ${IMAGE} ${REPO}:latest

echo "done building" ${IMAGE}
