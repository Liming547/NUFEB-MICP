# Install script for directory: /home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/vtk-8.0")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-8.0/vtkhdf5" TYPE FILE FILES
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/H5DOpublic.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/H5DSpublic.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/H5IMpublic.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/H5LTparse.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/H5LTpublic.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/H5PTpublic.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/H5TBpublic.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/hdf5_hl.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/hdf5/vtkhdf5/hl/src/vtk_libhdf5_hl_mangle.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so.1")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so.1"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkhdf5_hl-8.0.so.1")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so.1")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so.1"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so.1")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkhdf5_hl-8.0.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-8.0.so")
    endif()
  endif()
endif()

