#!/bin/bash

NAME=$(basename $(dirname $PWD/Dockerfile))

docker build -t ${NAME}:latest -t ${NAME}:$(date +%Y%m%d) .
