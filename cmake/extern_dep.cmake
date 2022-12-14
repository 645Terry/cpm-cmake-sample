include(cmake/CPM.cmake)

# import from url
CPMAddPackage(
        NAME gflags
        URL https://codeload.github.com/gflags/gflags/zip/refs/heads/master
)
include_directories(${gflags_SOURCE_DIR}/include)
link_directories(${gflags_SOURCE_DIR}/lib)
install(DIRECTORY ${gflags_SOURCE_DIR}/lib
        DESTINATION third_party
        FILES_MATCHING PATTERN "*.so*"
        )

# import from github repo
CPMAddPackage(
  NAME googletest   # 添加依赖库：googletest
  GITHUB_REPOSITORY google/googletest # GitHub仓库是：google/googletest，CPM会在GitHub网站找到该仓库，并得到对应的仓库链接：https://github.com/google/googletest
  GIT_TAG release-1.12.1 # Git标签是release-1.8.1
  VERSION 1.12.1 # 版本号是1.8.1
  OPTIONS  # 可选参数包括：INSTALL_GTEST：关，gtest_force_shared_crt，开
      "INSTALL_GTEST OFF"
      "gtest_force_shared_crt ON"
)
include_directories(${googletest_SOURCE_DIR}/include)
link_directories(${googletest_SOURCE_DIR}/lib)
install(DIRECTORY ${googletest_SOURCE_DIR}/lib
        DESTINATION third_party
        FILES_MATCHING PATTERN "*.so*"
        )

# import from self lib
# CPMAddPackage(
#         NAME glog
#         URL https://github.com/645Terry/cpm-lib/raw/master/pkgs/glog_0.5.0/x86_64-ubuntu-linux-gcc9.3.0/glog_0.5.0.tar
# )
# include_directories(${glog_SOURCE_DIR}/include)
# link_directories(${glog_SOURCE_DIR}/lib)
# install(DIRECTORY ${glog_SOURCE_DIR}/lib
#         DESTINATION third_party
#         FILES_MATCHING PATTERN "*.so*"
#         )