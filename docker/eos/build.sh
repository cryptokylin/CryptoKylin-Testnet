#!/bin/bash
TAG=v1.4.0
BRANCH=v1.4.0
nohup docker build -t cryptokylin/eos:$TAG --build-arg branch=$BRANCH --build-arg symbol=EOS . > build.log &