#!/usr/bin/env bash
CURDIR=$(pwd)
SUBDIRNAME="build_x86"
auto_msg_v="v1.3.3"
DIRNAME=${CURDIR}/${SUBDIRNAME}
if [ ! -d ${DIRNAME} ]; then
  mkdir ${DIRNAME}
else
  echo "${DIRNAME} exists"
fi
cd ${DIRNAME} || exit
fullpath=$(pwd)
cmake \
  -DARCH_PLAT_VENDOR=x86_64-ubuntu-linux-gcc9.3.0 \
  -DCMAKE_INSTALL_PREFIX="${fullpath}/output" \
  -DCMAKE_BUILD_TYPE=Debug \
  -DAUTOMSG_VERSION="$auto_msg_v" \
  ..
make -j8 && make install
