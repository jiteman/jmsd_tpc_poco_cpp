JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_FULL_NAME}-linux-compiler-settings.cmake" )

if ( UNIX )
	# C
	set( ${PROJECT_NAME}_C_FLAGS ${CMAKE_C_FLAGS} )
	##set( ${PROJECT_NAME}_C_FLAGS_DEBUG ${CMAKE_C_FLAGS_DEBUG} )
	##set( ${PROJECT_NAME}_C_FLAGS_RELEASE ${CMAKE_C_FLAGS_RELEASE} )

	## list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-" ) #
	list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-sign-conversion" ) # conversion to '' from '' may change the sign of the result
	list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-conversion" ) # conversion from '' to '' may change value
	list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-cast-qual" ) # cast from type '' to type '' casts away qualifiers

	string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_STR "${${PROJECT_NAME}_C_FLAGS}" )
	##string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_STR_DEBUG  "${${PROJECT_NAME}_C_FLAGS_DEBUG }" )
	##string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_STR_RELEASE "${${PROJECT_NAME}_C_FLAGS_RELEASE}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_C_FLAGS_STR "${${PROJECT_NAME}_C_FLAGS_STR}" ) #

	set( CMAKE_C_FLAGS ${${PROJECT_NAME}_C_FLAGS_STR} )
	##set( CMAKE_C_FLAGS_DEBUG ${${PROJECT_NAME}_C_FLAGS_STR_DEBUG} )
	##set( CMAKE_C_FLAGS_RELEASE ${${PROJECT_NAME}_C_FLAGS_STR_RELEASE} )

	# C++
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )
	##set( ${PROJECT_NAME}_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG} )
	set( ${PROJECT_NAME}_CXX_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-conversion" ) # conversion from '' to '' may change value
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-parameter" ) # unused parameter ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-shadow" ) # declaration of '' shadows a previous local
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-implicit-fallthrough" ) # this statement may fall through
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-cast-qual" ) # cast from type '' {aka ''} to type '' {aka ''} casts away qualifiers

	list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "-Wno-inline" ) # inlining failed in call to '' call is unlikely and code size would grow

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )
	##string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR_DEBUG "${${PROJECT_NAME}_CXX_FLAGS_DEBUG}" )
	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR_RELEASE "${${PROJECT_NAME}_CXX_FLAGS_RELEASE}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
	##set( CMAKE_CXX_FLAGS_DEBUG ${${PROJECT_NAME}_CXX_FLAGS_STR_DEBUG} )
	set( CMAKE_CXX_FLAGS_RELEASE ${${PROJECT_NAME}_CXX_FLAGS_STR_RELEASE} )
else()
	message( SEND_ERROR "[JMSD] ${JMSD_FOREIGN_COMPONENT_FULL_NAME} COMPILER SETTINGS: ${JMSD_FOREIGN_COMPONENT_FULL_NAME}-linux-compiler-settings.cmake is included while not on linux" )

endif()

JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_FULL_NAME}-linux-compiler-settings.cmake" )
