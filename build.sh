#!/bin/bash

declare -a TAGS

NAME=$(basename $(dirname $PWD/Dockerfile))

if [ $REPO_HOST ]
then
  NAME=${REPO_HOST}/${NAME}
fi

TAGS=($(date +%Y%m%d))

docker build -t ${NAME}:latest $@ .

if [ $REPO_HOST ]
then
  docker push ${NAME}:latest
fi

for i in ${TAGS[@]}
do
  docker tag ${NAME}:latest ${NAME}:$i

  if [ $REPO_HOST ]
  then
    docker push ${NAME}:$i
  fi
done
