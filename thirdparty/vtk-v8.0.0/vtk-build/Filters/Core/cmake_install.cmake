# Install script for directory: /home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so.1")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so.1"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkFiltersCore-8.0.so.1")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so.1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so.1")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so.1"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so.1")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib/libvtkFiltersCore-8.0.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so"
         OLD_RPATH "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-8.0.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-8.0/Modules" TYPE FILE FILES "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/Filters/Core/CMakeFiles/vtkFiltersCore.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-8.0" TYPE FILE FILES
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkAppendArcLength.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkAppendFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkAppendPolyData.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkAppendSelection.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkArrayCalculator.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkAssignAttribute.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkAttributeDataToFieldDataFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkBinCellDataFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkCellDataToPointData.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkCleanPolyData.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkClipPolyData.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkCompositeDataProbeFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkConnectivityFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkContourFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkContourGrid.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkContourHelper.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkDataObjectGenerator.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkDataObjectToDataSetFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkDataSetEdgeSubdivisionCriterion.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkDataSetToDataObjectFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkDecimatePolylineFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkDecimatePro.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkDelaunay2D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkDelaunay3D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkElevationFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkExecutionTimer.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkFeatureEdges.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkFieldDataToAttributeDataFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkFlyingEdges2D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkFlyingEdges3D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkFlyingEdgesPlaneCutter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkGlyph2D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkGlyph3D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkHedgeHog.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkHull.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkIdFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMarchingCubes.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMarchingSquares.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMaskFields.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMaskPoints.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMaskPolyData.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMassProperties.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMergeDataObjectFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMergeFields.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkMergeFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkPlaneCutter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkPointDataToCellData.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkPolyDataConnectivityFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkPolyDataNormals.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkProbeFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkQuadricClustering.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkQuadricDecimation.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkRearrangeFields.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkResampleToImage.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkResampleWithDataSet.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkReverseSense.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkSimpleElevationFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkSmoothPolyDataFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkSphereTreeFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkStripper.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkStructuredGridOutlineFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkSynchronizedTemplates2D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkSynchronizedTemplates3D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkSynchronizedTemplatesCutter3D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkTensorGlyph.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkThreshold.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkThresholdPoints.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkTransposeTable.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkTriangleFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkTriangleMeshPointNormals.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkTubeFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkUnstructuredGridQuadricDecimation.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkVectorDot.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkVectorNorm.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkWindowedSincPolyDataFilter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkCutter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkCompositeCutter.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkGridSynchronizedTemplates3D.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkRectilinearSynchronizedTemplates.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkEdgeSubdivisionCriterion.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkStreamingTessellator.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkImplicitPolyDataDistance.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkStreamerBase.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkCenterOfMass.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkImageAppend.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkStructuredGridAppend.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/Filters/Core/vtkAppendCompositeDataLeaves.h"
    "/home/nufeb_bo/NUFEB-dev-readdump/thirdparty/vtk-v8.0.0/vtk-build/Filters/Core/vtkFiltersCoreModule.h"
    )
endif()

