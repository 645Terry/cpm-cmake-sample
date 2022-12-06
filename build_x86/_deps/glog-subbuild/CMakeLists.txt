# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.16.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(glog-populate NONE)

include(ExternalProject)
ExternalProject_Add(glog-populate
                     "UPDATE_DISCONNECTED" "False" "URL" "http://mirrors.phigent.io/nfs/pkgs/glog_0.5.0/x86_64-ubuntu-linux-gcc9.3.0/glog_0.5.0.tar"
                    SOURCE_DIR          "/home/yuzw/work/yuzw_workspace/cpm-cmake-sample/build_x86/_deps/glog-src"
                    BINARY_DIR          "/home/yuzw/work/yuzw_workspace/cpm-cmake-sample/build_x86/_deps/glog-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)
