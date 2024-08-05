#!/bin/sh

echo "$(date +[%Y-%m-%d\ %H:%M:%S]) Service started"
while true; do
	sleep 21600
    docker restart docker-tdm
    echo "$(date +[%Y-%m-%d\ %H:%M:%S]) Restart complete"
done
