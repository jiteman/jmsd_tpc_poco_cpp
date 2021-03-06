cmake_minimum_required( VERSION 3.7.1 )

project( tpc_poco_seven_zip C CXX )


JMSD_SHOW_PROJECT_HEADER()


include( ${JMSD_COMPONENT_CMAKE_SETTINGS_PATH}/tpc-poco-seven-zip-set-compiler-settings.cmake )
set( JMSD_THIS_PROJECT_SOURCE_ROOT ${JMSD_COMPONENT_SOURCE_ROOT_PATH}/SevenZip )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${tpc_poco_foundation_DEPENDENCY_DIRS}
	${JMSD_THIS_PROJECT_SOURCE_ROOT}/include )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files
	${JMSD_THIS_PROJECT_SOURCE_ROOT}/include/*.h*
	${JMSD_THIS_PROJECT_SOURCE_ROOT}/include/*.c*
	${JMSD_THIS_PROJECT_SOURCE_ROOT}/src/*.h*
	${JMSD_THIS_PROJECT_SOURCE_ROOT}/src/*.c* )

set( JMSD_POCO_SEVEN_ZIP_FILES_TO_REMOVE
	"BraIA64.c"
	"Delta.c"
	"Delta.h"
	"LzFind.c"
	"LzFind.h"
	"LzFindMt.c"
	"LzFindMt.h"
	"Lzma2Enc.c"
	"Lzma2Enc.h"
	"Lzma86Enc.c"
	"LzmaEnc.c"
	"LzmaEnc.h"
	"LzmaLib.c"
	"LzmaLib.h"
	"MtCoder.c"
	"MtCoder.h"
	"Ppmd7Enc.c"
	"Sha256.c"
	"Sha256.h"
	"Threads.c"
	"Threads.h"
	"Xz.c"
	"XzCrc64.c"
	"XzCrc64.h"
	"XzDec.c"
	"XzEnc.c"
	"XzEnc.h"
	"Xz.h"
	"XzIn.c" )
JMSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JMSD_POCO_SEVEN_ZIP_FILES_TO_REMOVE )

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	${tpc_poco_foundation_LINK_DEFINITIONS}
	-DSevenZip_EXPORTS )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${tpc_poco_foundation_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 0.1.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 0.1 )


## project target section
set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	${tpc_poco_foundation_DEPENDENCY_LIBS}
	tpc_poco_foundation )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
JMSD_SHOW_PROJECT_FOOTER()
