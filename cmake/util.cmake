#===============================================
# Use lib helper function
#===============================================
if (MSVC)
    set(VCPKG_DIR "D:/codes/vcpkg/installed/x64-windows")
    set (BOOST_ROOT ${VCPKG_DIR})
    set (ASSIMP_DIR ${VCPKG_DIR})
endif()
macro(UseLib TARGET LIBS)
  foreach(lib ${LIBS})
    find_package(${lib} REQUIRED)
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