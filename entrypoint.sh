#!/bin/bash

while true; do
  /usr/src/app/resque_queues.rb "$@"
  sleep 30
done
