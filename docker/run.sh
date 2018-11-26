#!/bin/bash
test -e "../.env" || ( echo "../.env отсутствует в корне проекта, создайте его" && exit 1 )
export USER_ID=`id -u`
export GROUP_ID=`id -g`
export USER=$USER
if [ "$1" == "build" ];
  then
    docker-compose build 
fi
docker-compose up 
