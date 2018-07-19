#!/bin/bash

DATA_DIR=/data/eos/nodeos-data-volume/nodeos-data-kylin
mkdir -p $DATA_DIR/data
cp -r config $DATA_DIR

docker-compose -f docker-compose-kylin-init.yaml up -d