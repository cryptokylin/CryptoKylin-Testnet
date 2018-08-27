#!/bin/bash
TAG=v1.1.6
BRANCH=mainnet-1.1.6
nohup docker build -t cryptokylin/eosmainnet:$TAG --build-arg branch=$BRANCH --build-arg symbol=EOS . > build.log &