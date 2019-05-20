#!/usr/bin/env bash

docker build -t r-library-extractor .
CONTAINER=$(docker run -d r-library-extractor false)
docker cp ${CONTAINER}:/library.tar.gz library.tar.gz