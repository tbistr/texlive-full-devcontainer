#!/bin/bash
set -eux

# usage: $ cd .devcontainer && ./docker.release.sh v0.0

if [ $# = 0 ]; then
    echo "please set version arg"
    exit 1
fi

docker buildx create --name mybuilder
docker buildx use mybuilder
docker buildx inspect --bootstrap

docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/tbistr/texlive-full:"$1" --push .

docker buildx rm mybuilder
