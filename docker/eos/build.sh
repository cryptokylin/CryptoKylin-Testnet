#!/bin/bash
TAG=v1.3.2
BRANCH=v1.3.2
nohup docker build -t cryptokylin/eos:$TAG --build-arg branch=$BRANCH --build-arg symbol=EOS . > build.log &