#===============================================
# Use lib helper function
#===============================================

if(APPLE)
    set (VCPKG_DIR "/usr/local")
elseif(WIN32)
    set(VCPKG_DIR "D:/codes/vcpkg/installed/x64-windows")
elseif(MSYS)
    set( VCPKG_DIR "c:/msys64/mingw64")
else()
    set (VCPKG_DIR "/usr")
endif()

set (BOOST_ROOT ${VCPKG_DIR})
set (ASSIMP_DIR ${VCPKG_DIR})

macro(UseLib TARGET LIBS)
  foreach(lib ${LIBS})
    if(${lib}_COMPS)
        # set (${lib}_COMPS "COMPONENTS ${${lib}_COMPS}")
        find_package(${lib} REQUIRED COMPONENTS ${${lib}_COMPS})
    else()
        find_package(${lib} REQUIRED)

    endif()
    message("UseLib: processing find_package: ${lib} REQUIRED ${${lib}_COMPS}")

    string(TOUPPER "${lib}_INCLUDE_DIRS" inc_dirs)
    # Just in case    
    string(TOUPPER "${lib}_INCLUDE_DIR" inc_dir)
    if(${inc_dirs})
        target_include_directories (${TARGET} PUBLIC ${${inc_dirs}})
    message("UseLib: install ${inc_dirs} = ${${inc_dirs}} to ${TARGET}")
    elseif(${inc_dir})
    target_include_directories (${TARGET} PUBLIC ${${inc_dir}})
    message("UseLib: install ${inc_dir} = ${${inc_dir}} to ${TARGET}")
    endif()

    string(TOUPPER "${lib}_LIBRARIES" lib_libs)
    if(${lib_libs})
        target_link_libraries(${TARGET} LINK_PUBLIC  ${${lib_libs}})
    message("UseLib: install ${lib_libs} = ${${lib_libs}} to ${TARGET}")
    endif()
  endforeach(lib)
endmacro(UseLib)