# Install script for directory: /home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so.1")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so.1"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkfreetype-8.0.so.1")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so.1")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so.1"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so.1")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkfreetype-8.0.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkfreetype-8.0.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-8.0/vtkfreetype/include" TYPE FILE FILES
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/ft2build.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/vtk_freetype_mangle.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/vtk_ftmodule.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/ThirdParty/freetype/vtkfreetype/include/vtkFreeTypeConfig.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-8.0/vtkfreetype/include/freetype" TYPE FILE FILES
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/freetype.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftadvanc.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftbbox.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftbdf.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftbitmap.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftbzip2.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftcache.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftchapters.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftcid.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/fterrdef.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/fterrors.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftgasp.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftglyph.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftgxval.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftgzip.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftimage.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftincrem.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftlcdfil.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftlist.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftlzw.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftmac.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftmm.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftmodapi.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftmoderr.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftotval.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftoutln.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftpfr.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftrender.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftsizes.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftsnames.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftstroke.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftsynth.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftsystem.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/fttrigon.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/fttypes.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftwinfnt.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ftxf86.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/t1tables.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ttnameid.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/tttables.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/tttags.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/ttunpat.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-8.0/vtkfreetype/include/freetype/config" TYPE FILE FILES
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftheader.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftmodule.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftoption.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftstdlib.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/ThirdParty/freetype/vtkfreetype/include/freetype/config/ftconfig.h"
    )
endif()

