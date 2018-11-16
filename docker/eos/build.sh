#!/bin/bash
TAG=v1.4.3
BRANCH=v1.4.3
nohup docker build -t cryptokylin/eos:$TAG --build-arg branch=$BRANCH --build-arg symbol=EOS . > build.log &