if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	find_package(Doxygen REQUIRED)
	get_target_property(doxygen_style css_doxygen_style SOURCES)		
	get_target_property(doxygen_head css_doxygen_Header SOURCES)		
	get_target_property(doxygen_foot css_doxygen_Footer SOURCES)		
	set(DOXYGEN_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/doc")
	set(DOXYGEN_USE_MDFILE_AS_MAINPAGE "README.md")
	set(DOXYGEN_HTML_EXTRA_STYLESHEET ${doxygen_style})
	set(DOXYGEN_HTML_HEADER ${doxygen_head})
	set(DOXYGEN_HTML_FOOTER ${doxygen_foot})


	doxygen_add_docs(
		doxygen_${PROJECT_NAME}
		${PROJECT_SOURCE_DIR}
		${DOC_SOURCE_DIRS} 
		ALL
		COMMENT "Generate man pages"
		)
else()
	list(APPEND DOC_SOURCE_DIRS ${PROJECT_SOURCE_DIR})
	list(REMOVE_DUPLICATES ${DOC_SOURCE_DIRS})
	set(DOC_SOURCE_DIRS ${DOC_SOURCE_DIRS}  CACHE STRING "" FORCE)
	mark_as_advanced(DOC_SOURCE_DIRS)
endif()

