#!/bin/bash
TAG=v1.2.3
BRANCH=v1.2.3
nohup docker build -t cryptokylin/eos:$TAG --build-arg branch=$BRANCH --build-arg symbol=EOS . > build.log &