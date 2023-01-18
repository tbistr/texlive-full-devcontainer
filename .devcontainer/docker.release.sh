#!/bin/bash
set -eux

# usage: $ cd .devcontainer && ./docker.release.sh v0.0

if [ $# = 0 ]; then
    echo "please set version arg"
    exit 1
fi

docker build -t ghcr.io/tbistr/texlive-full:"$1" .
docker push     ghcr.io/tbistr/texlive-full:"$1"
