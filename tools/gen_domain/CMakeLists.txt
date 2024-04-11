SET(SRC ${CMAKE_SOURCE_DIR}/tools/gen_domain)

include_directories(${netcdf_f_incdir})
add_definitions(-DLINUX)
add_executable(gen_domain ${SRC}/gen_domain.F90)
target_link_libraries(gen_domain ${netcdf_f_libs})

install(TARGETS gen_domain DESTINATION bin)
