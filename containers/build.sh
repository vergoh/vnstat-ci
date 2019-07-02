#!/bin/bash

if [ "$#" -eq "1" ]; then
	docker build --pull -t vnstat/$1 $1 || exit 1
else
	for IMAGE in $(find * -maxdepth 1 -type d)
	do
		docker build --pull -t vnstat/${IMAGE} ${IMAGE} || exit 1
		echo
	done
fi

docker image prune -f
