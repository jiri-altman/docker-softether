#!/bin/bash
docker run -d --net none --name softether-config softether-config
#docker run -d --name $(basename "$PWD") $(basename "$PWD") $1
#docker run -d -v $1 --name $(basename "$PWD") $(basename "$PWD")
