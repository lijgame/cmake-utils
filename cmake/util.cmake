#===============================================
# Use lib helper function
#===============================================


if(POLICY CMP0072)
  cmake_policy(SET CMP0072 NEW)
endif()

macro(findGLM target)
    find_package(glm REQUIRED)
    target_include_directories(${target} SYSTEM  PRIVATE glm::glm)
endmacro(findGLM target)

macro(findGLEW target)
    find_package(GLEW REQUIRED)
    target_link_libraries(${target} PRIVATE GLEW::GLEW)
endmacro(findGLEW target)

macro(findOpenGL target)
    find_package(OpenGL REQUIRED)
    if(WIN32)
        target_link_libraries(${target} PRIVATE OpenGL::GL)
    else()
        target_link_libraries(${target} PRIVATE OpenGL::OpenGL OpenGL::EGL)
    endif()
endmacro(findOpenGL target)

macro(findSDL2 target)
    find_package(SDL2 REQUIRED)
    if(WIN32)
        target_link_libraries(${target} PRIVATE SDL2::SDL2 SDL2::SDL2main)
    else()
        target_include_directories(${target} SYSTEM PRIVATE ${SDL2_INCLUDE_DIRS})
        target_link_libraries(${target} PRIVATE ${SDL2_LIBRARIES})
    endif()

    find_package(SDL2_image REQUIRED)
    target_link_libraries(${target} PRIVATE SDL2::SDL2_image )

endmacro(findSDL2)

macro(findEigen3 target)
    find_package(Eigen3 REQUIRED)
    target_link_libraries(${target} PRIVATE Eigen3::Eigen)
endmacro(findEigen3 target)
