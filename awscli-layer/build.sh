#!/usr/bin/env bash
rm -rf build/*

mkdir build/
docker build -t awscli-layer .
CONTAINER=$(docker run -d awscli-layer false)
docker cp ${CONTAINER}:/layer.zip build/layer.zip