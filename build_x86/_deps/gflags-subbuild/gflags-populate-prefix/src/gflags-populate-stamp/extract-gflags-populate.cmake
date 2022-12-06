# Make file names absolute:
#
get_filename_component(filename "/home/yuzw/work/yuzw_workspace/cpm-cmake-sample/build_x86/_deps/gflags-subbuild/gflags-populate-prefix/src/archive.tar" ABSOLUTE)
get_filename_component(directory "/home/yuzw/work/yuzw_workspace/cpm-cmake-sample/build_x86/_deps/gflags-src" ABSOLUTE)

message(STATUS "extracting...
     src='${filename}'
     dst='${directory}'")

if(NOT EXISTS "${filename}")
  message(FATAL_ERROR "error: file to extract does not exist: '${filename}'")
endif()

# Prepare a space for extracting:
#
set(i 1234)
while(EXISTS "${directory}/../ex-gflags-populate${i}")
  math(EXPR i "${i} + 1")
endwhile()
set(ut_dir "${directory}/../ex-gflags-populate${i}")
file(MAKE_DIRECTORY "${ut_dir}")

# Extract it:
#
message(STATUS "extracting... [tar xf]")
execute_process(COMMAND ${CMAKE_COMMAND} -E tar xf ${filename}
  WORKING_DIRECTORY ${ut_dir}
  RESULT_VARIABLE rv)

if(NOT rv EQUAL 0)
  message(STATUS "extracting... [error clean up]")
  file(REMOVE_RECURSE "${ut_dir}")
  message(FATAL_ERROR "error: extract of '${filename}' failed")
endif()

# Analyze what came out of the tar file:
#
message(STATUS "extracting... [analysis]")
file(GLOB contents "${ut_dir}/*")
list(REMOVE_ITEM contents "${ut_dir}/.DS_Store")
list(LENGTH contents n)
if(NOT n EQUAL 1 OR NOT IS_DIRECTORY "${contents}")
  set(contents "${ut_dir}")
endif()

# Move "the one" directory to the final directory:
#
message(STATUS "extracting... [rename]")
file(REMOVE_RECURSE ${directory})
get_filename_component(contents ${contents} ABSOLUTE)
file(RENAME ${contents} ${directory})

# Clean up:
#
message(STATUS "extracting... [clean up]")
file(REMOVE_RECURSE "${ut_dir}")

message(STATUS "extracting... done")
