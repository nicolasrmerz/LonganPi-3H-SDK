#!/bin/bash
docker build -t lpi3h-build .
docker run --rm --privileged --volume ./out:/src/out -it lpi3h-build