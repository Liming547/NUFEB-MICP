# Install script for directory: /home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so.1")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so.1"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkIOCore-8.0.so.1")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so.1")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so.1"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so.1")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkIOCore-8.0.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-8.0.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-8.0/Modules" TYPE FILE FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/IO/Core/CMakeFiles/vtkIOCore.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-8.0" TYPE FILE FILES
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkAbstractParticleWriter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkArrayReader.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkArrayWriter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkASCIITextCodec.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkBase64InputStream.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkBase64OutputStream.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkBase64Utilities.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkDataCompressor.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkDelimitedTextWriter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkGlobFileNames.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkInputStream.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkJavaScriptDataWriter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkLZ4DataCompressor.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkOutputStream.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkSortFileNames.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkTextCodec.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkTextCodecFactory.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkUTF16TextCodec.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkUTF8TextCodec.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkAbstractPolyDataReader.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkWriter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkZLibDataCompressor.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkArrayDataReader.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/IO/Core/vtkArrayDataWriter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/IO/Core/vtkIOCoreModule.h"
    )
endif()

