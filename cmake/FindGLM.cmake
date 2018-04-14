set(PACKAGE_NAME GLM)

if("${CMAKE_GENERATOR}" MATCHES "MSYS Makefiles")
	SET (GLM_ROOT_DIR c:/msys64/mingw64 CACHE PATH "glm directory")
endif()

find_path(GLM_INCLUDE_DIR glm/glm.hpp
    HINTS
    ${GLM_ROOT_DIR}
    $ENV{GLM_ROOT_DIR}
    ${VCPKG_DIR}
    PATHS 
    ${GLM_ROOT_DIR}
    PATH_SUFFIXES include
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GLM REQUIRED_VARS GLM_INCLUDE_DIR)