# Docker Elastic.co Topbeat

- ```1.2.0```, ```1.2.1```, ```1.2.2```, ```1.2.3```
- ```1.1.2```, ```1.1.1```, ```1.1.0```
- ```1.0.1```, ```1.0.0```

[![Docker Pulls](https://img.shields.io/docker/pulls/athieriot/topbeat.svg)]() [![](https://badge.imagelayers.io/athieriot/topbeat:1.1.0.svg)](https://imagelayers.io/?images=athieriot/topbeat:1.1.0 'Get your own badge on imagelayers.io')

Docker image for Elastic Topbeat

# Usage


### Logstash

      docker run -d \
        -e PROFILE=logstash \
        --link=logstash:logstash \
        --name=topbeat \
        --pid=host \
        athieriot/topbeat

# More variables

### General

      docker run -d \
        -e HOST=elasticsearch.in.aws.com \
        -e PORT=80 \
        -e CPU_PER_CORE=false \
        -e INDEX=topbeat \
        -e PROCS=.* \
        -e PERIOD=10 \
        -e SHIPPER_NAME=super-app \
        -e SHIPPER_TAGS="qa", "db" \
        --name=topbeat \
        --pid=host \
        athieriot/topbeat

### Elasticsearch template configuration

In the event you are usage a custom configuration or logstash but want to add Topbeat templates to your own Elasticsearch instance:

      docker run -d \
        -e PROFILE=logstash \
        -e EXTERNAL_ELASTIC_HOST=my.elasticsearch.com \
        -e EXTERNAL_ELASTIC_PORT=9200 \
        --link=logstash:logstash \
        --name=topbeat \
        --pid=host \
        athieriot/topbeat

# Troubleshouting

### Elasticsearch host inavailable within a container

Somehow, when Elasticsearch is launched inside a container it is inaccessible from another linked container.
A configuration has to be set for it to work properly. Change IP as needed.

      docker run --name=elasticsearch elasticsearch elasticsearch -Des.network.bind_host=0.0.0.0
