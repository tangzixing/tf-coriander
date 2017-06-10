#!/bin/bash

# assumes running from root of clean, recursively-cloned, repo

set -e
set -x

BASEDIR=${PWD}

cd third_party/coriander
mkdir build
cd build
cmake ..
make -j 16
sudo make install

cd ${BASEDIR}
virtualenv -p python3 env3

source env3/bin/activate
pip install numpy
cat <<EOF | ./configure






EOF

util/build_u1604.sh
util/build_wheel.sh
pip install soft/tensorflowpkg/tensorflow-0.11.0rc0-py3-none-any.whl
py.test -v
git clone https://github.com/hughperkins/Tensorflow-Examples
