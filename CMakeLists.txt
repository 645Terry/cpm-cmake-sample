cmake_minimum_required(VERSION 3.14)

# include(cmake/option_utils.cmake)
project(test)

if (NOT (DEFINED ARCH_PLAT_VENDOR))
    # default for linux
    set(ARCH_PLAT_VENDOR x86_64-ubuntu-linux-gcc9.3.0)
endif ()

if (NOT (DEFINED AUTOMSG_VERSION))
    set(AUTOMSG_VERSION v1.3.3)
endif ()

add_definitions(-DAUTOMSG_VERSION="${AUTOMSG_VERSION}")
message(STATUS "*** AutoMsg: ${AUTOMSG_VERSION} ***")

# default use cxx14
# set(CXX_STD "14" CACHE STRING "C++ standard")
set(CXX_STD "14")
set(CPLUSPLUS_VER "c++1y")

set(CMAKE_CXX_STANDARD ${CXX_STD})

set(CMAKE_CXX_FLAGS_DEBUG "-fPIC -O0 -g -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "-fPIC -O2 -Wall")
set(CMAKE_POSITION_INDEPENDENT_CODE true)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=${CPLUSPLUS_VER} -fPIC -fno-omit-frame-pointer")
set(CMAKE_THREAD_LIBS_INIT "-lpthread")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
set(CMAKE_HAVE_THREADS_LIBRARY 1)
set(CMAKE_USE_WIN32_THREADS_INIT 0)
set(CMAKE_USE_PTHREADS_INIT 1)
set(THREADS_PREFER_PTHREAD_FLAG ON)

if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
    message(STATUS "CMAKE_BUILD_TYPE Debug")
    set(CMAKE_BUILD_TYPE Debug)
endif ()

# if(NOT CMAKE_BUILD_TYPE)
#   set(CMAKE_BUILD_TYPE RelWithDebInfo)
# endif()
# set(CMAKE_CXX_FLAGS "-std=c++1y -g -fPIC")
# set(CMAKE_CXX_STANDARD 14)
# set(CUDA_USE_STATIC_CUDA_RUNTIME OFF)
# message("==== CMAKE_INSTALL_PREFIX = ${CMAKE_INSTALL_PREFIX} ==== ")

#include
include(cmake/option_utils.cmake)
include(cmake/extern_dep.cmake)
include_directories(
  src
  include
)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_BINARY_DIR}
        ${PROTOBUF_INCLUDE_DIRS}
        ${PROJECT_SOURCE_DIR}
        ${CMAKE_INSTALL_PREFIX}
)

# find_package(Protobuf REQUIRED)
find_package(Boost COMPONENTS regex filesystem thread program_options REQUIRED)
# include_directories(BEFORE SYSTEM ${PROTOBUF_INCLUDE_DIRS})
# include_directories(BEFORE ${CMAKE_CURRENT_BINARY_DIR})
# include_directories(BEFORE .)

include_directories("./")
# list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

set(PG_PROTO_DIR ${CMAKE_CURRENT_SOURCE_DIR} ${PG_PROTO_DIR})
set(PG_GENERATED_DIR ${CMAKE_CURRENT_BINARY_DIR} ${PG_GENERATED_DIR})

ADD_SUBDIRECTORY(src)


