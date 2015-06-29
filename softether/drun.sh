#!/bin/bash
docker run --cap-add=NET_ADMIN -d -v /etc/localtime:/config/etc/localtime:ro --volumes-from softether-config --net host --name softether softether
#docker run --cap-add=NET_ADMIN -it --rm --volumes-from softether-config --net host --name softether softether /bin/bash
#docker run -d --name $(basename "$PWD") $(basename "$PWD") $1
#docker run -d -v $1 --name $(basename "$PWD") $(basename "$PWD")
