#!/usr/bin/env bash


docker build -t vsts:$1 .
docker run --rm -it vsts:$1 sh
