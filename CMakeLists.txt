cmake_minimum_required(VERSION 3.18)
project(
   e3sm-tools
   VERSION "3.0.0"
   LANGUAGES C CXX Fortran)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
   include("${CMAKE_SOURCE_DIR}/cmake_macros/gnu.cmake")
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
   include("${CMAKE_SOURCE_DIR}/cmake_macros/intel.cmake")
endif()

find_package(NETCDF REQUIRED)

message(STATUS "netcdf_f_incdir=${netcdf_f_incdir}")
message(STATUS "netcdf_f_libs=${netcdf_f_libs}")

add_subdirectory(${CMAKE_SOURCE_DIR}/tools/gen_domain gen_domain)
add_subdirectory(${CMAKE_SOURCE_DIR}/tools/interpinic interpinic)