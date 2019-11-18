#!/bin/bash

pushd $(dirname $0)
docker build -t centos:my7 .
popd
