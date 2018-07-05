#!/bin/bash

DATA_DIR=/data/eos/nodeos-data-volume/nodeos-data-kylin
mkdir -p $DATA_DIR/data
cp -r config.ini $DATA_DIR
cp -r genesis.json $DATA_DIR

docker-compose -f docker-compose-kylin-init.yml up -d