# Install script for directory: /home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so.1")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so.1"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkCommonTransforms-8.0.so.1")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so.1")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so.1"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so.1")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkCommonTransforms-8.0.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonTransforms-8.0.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-8.0/Modules" TYPE FILE FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/Common/Transforms/CMakeFiles/vtkCommonTransforms.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-8.0" TYPE FILE FILES
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkAbstractTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkCylindricalTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkGeneralTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkHomogeneousTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkIdentityTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkLinearTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkMatrixToHomogeneousTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkMatrixToLinearTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkPerspectiveTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkSphericalTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkThinPlateSplineTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkTransform2D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkTransformCollection.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkWarpTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Common/Transforms/vtkLandmarkTransform.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/Common/Transforms/vtkCommonTransformsModule.h"
    )
endif()

