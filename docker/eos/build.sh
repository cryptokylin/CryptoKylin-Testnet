#!/bin/bash
TAG=v1.4.1
BRANCH=v1.4.1
nohup docker build -t cryptokylin/eos:$TAG --build-arg branch=$BRANCH --build-arg symbol=EOS . > build.log &