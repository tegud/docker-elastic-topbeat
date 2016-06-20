#!/bin/bash

mkdir -p /topbeat/config && mkdir -p /topbeat/data

export SHIPPER_NAME=$(cat /host-hostname)
cp /topbeat/topbeat.logstash.yml /topbeat/config/topbeat.yml

if [ -z $DRY_RUN ]; then
  topbeat -e -v -c /topbeat/config/topbeat.yml
fi
