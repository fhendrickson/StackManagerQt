#
#  FindQuaZip.h
#  StackManagerQt/cmake/modules
#
#  Created by Mohammed Nafees.
#  Copyright (c) 2014 High Fidelity. All rights reserved.
# 

# QUAZIP_FOUND               - QuaZip library was found
# QUAZIP_INCLUDE_DIR         - Path to QuaZip include dir
# QUAZIP_INCLUDE_DIRS        - Path to QuaZip and zlib include dir (combined from QUAZIP_INCLUDE_DIR + ZLIB_INCLUDE_DIR)
# QUAZIP_LIBRARIES           - List of QuaZip libraries
# QUAZIP_ZLIB_INCLUDE_DIR    - The include dir of zlib headers


IF (QUAZIP_INCLUDE_DIRS AND QUAZIP_LIBRARIES)
	SET(QUAZIP_FOUND TRUE)
ELSE (QUAZIP_INCLUDE_DIRS AND QUAZIP_LIBRARIES)
	SET(QUAZIP_SEARCH_DIRS "$ENV{HIFI_LIB_DIR}/QuaZip")
	IF (WIN32)
		FIND_PATH(QUAZIP_INCLUDE_DIRS quazip.h PATH_SUFFIXES include/quazip HINTS ${QUAZIP_SEARCH_DIRS})
		FIND_LIBRARY(QUAZIP_LIBRARIES NAMES quazip PATH_SUFFIXES lib HINTS ${QUAZIP_SEARCH_DIRS})
        ELSEIF(APPLE)
		FIND_PATH(QUAZIP_INCLUDE_DIRS quazip.h PATH_SUFFIXES include/quazip HINTS ${QUAZIP_SEARCH_DIRS})
		FIND_LIBRARY(QUAZIP_LIBRARIES NAMES quazip PATH_SUFFIXES lib HINTS ${QUAZIP_SEARCH_DIRS})
	ELSE ()
		FIND_PATH(QUAZIP_INCLUDE_DIRS quazip.h PATH_SUFFIXES quazip HINTS ${QUAZIP_SEARCH_DIRS})
                FIND_LIBRARY(QUAZIP_LIBRARIES NAMES quazip-qt5 PATH_SUFFIXES lib HINTS ${QUAZIP_SEARCH_DIRS})
	ENDIF ()
	INCLUDE(FindPackageHandleStandardArgs)
	find_package_handle_standard_args(QUAZIP DEFAULT_MSG QUAZIP_INCLUDE_DIRS QUAZIP_LIBRARIES)
ENDIF (QUAZIP_INCLUDE_DIRS AND QUAZIP_LIBRARIES)
