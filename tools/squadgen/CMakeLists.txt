find_package(PNG REQUIRED)
message(STATUS "PNG_INCLUDE_DIR=${PNG_INCLUDE_DIR}")
message(STATUS "PNG_LIBRARIES=${PNG_LIBRARIES}")

SET(SRC ${CMAKE_SOURCE_DIR}/submodules/squadgen/src)
set(SQUADGEN_SRC ${SRC}/SQuadGen.cpp
                 ${SRC}/GridElements.cpp
                 ${SRC}/CSRefinementMap.cpp
                 ${SRC}/CubedSphereGrid.cpp
                 ${SRC}/IcosahedralFlagGrid.cpp
                 ${SRC}/RefineGrid.cpp
                 ${SRC}/RefinementTemplateCUBIT.cpp
                 ${SRC}/RefinementTemplateLOWCONN.cpp
                 ${SRC}/RefinementTemplateLOWCONNOLD.cpp
                 ${SRC}/SpringDynamics.cpp
                 ${SRC}/MeshUtilities.cpp
                 ${SRC}/Tessellate.cpp
                 ${SRC}/lodepng.cpp
                 ${SRC}/netcdf.cpp
                 ${SRC}/ncvalues.cpp)

include_directories(${PNG_INCLUDE_DIR})
include_directories(${netcdf_c_incdir})

include_directories(${SRC})
add_executable(squadgen ${SQUADGEN_SRC})
target_link_libraries(squadgen ${netcdf_c_libs} ${PNG_LIBRARIES})

install(TARGETS squadgen DESTINATION bin)
