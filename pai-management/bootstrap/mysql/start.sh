#!/bin/bash

pushd $(dirname "$0") > /dev/null

chmod u+x node-label.sh

./node-label.sh

kubectl create -f mysql.yaml

popd > /dev/null
