#===============================================
# Use lib helper function
#===============================================


if(POLICY CMP0072)
  cmake_policy(SET CMP0072 NEW)
endif()

macro(findGLM target)
    find_package(glm REQUIRED)
    target_include_directories(${target} PRIVATE glm::glm)
endmacro(findGLM target)

macro(findGLEW target)
    find_package(GLEW REQUIRED)
    target_link_libraries(${target} PRIVATE GLEW::GLEW)
endmacro(findGLEW target)

macro(findOpenGL target)
    find_package(OpenGL REQUIRED)
    target_link_libraries(${target} PRIVATE OpenGL::OpenGL OpenGL::EGL)
endmacro(findOpenGL target)

macro(findSDL2 target)
    find_package(SDL2 REQUIRED)
    target_include_directories(${target} PRIVATE ${SDL2_INCLUDE_DIRS})
    target_link_libraries(${target} PRIVATE ${SDL2_LIBRARIES})

    find_package(SDL2_image REQUIRED)
    target_link_libraries(${target} PRIVATE SDL2::Image )

endmacro(findSDL2)
