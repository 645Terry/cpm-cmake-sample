include("/home/yuzw/work/yuzw_workspace/cpm-cmake-sample/cmake/CPM.cmake")
CPMAddPackage(NAME;googletest;GITHUB_REPOSITORY;google/googletest;GIT_TAG;release-1.8.1;VERSION;1.8.1;OPTIONS;INSTALL_GTEST OFF;gtest_force_shared_crt ON)
set(googletest_FOUND TRUE)