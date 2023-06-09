if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	file(DOWNLOAD "https://upload.cppreference.com/mwiki/images/f/f8/cppreference-doxygen-web.tag.xml"
		"${CMAKE_CURRENT_BINARY_DIR}/doxtags/cppreference-doxygen-web.tag.xml")
	file(DOWNLOAD "https://doc.qt.io/qt-6/qtcore.tags"
		"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtcore.tags")
	file(DOWNLOAD "https://doc.qt.io/qt-6/qtnetwork.tags"
		"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtnetwork.tags")

	find_package(Doxygen REQUIRED)
	get_target_property(doxygen_style css_doxygen_style SOURCES)
	get_target_property(doxygen_head css_doxygen_Header SOURCES)
	get_target_property(doxygen_foot css_doxygen_Footer SOURCES)
	set(DOXYGEN_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/doc")
	set(DOXYGEN_USE_MDFILE_AS_MAINPAGE "README.md")
	set(DOXYGEN_HTML_EXTRA_STYLESHEET ${doxygen_style})
	set(DOXYGEN_HTML_HEADER ${doxygen_head})
	set(DOXYGEN_HTML_FOOTER ${doxygen_foot})
	set(DOXYGEN_SHOW_FILES NO)
	set(DOXYGEN_EXTRACT_ALL YES)
	set(DOXYGEN_EXTRACT_STATIC YES)
	set(DOXYGEN_GENERATE_TAGFILE ${CMAKE_SOURCE_DIR}/doc/html/${CMAKE_PROJECT_NAME}.tag)

	set(DOXYGEN_TAGFILES
		"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtcore.tags=http://doc.qt.io/qt-6/"
		"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtnetwork.tags=http://doc.qt.io/qt-6/"
		"${CMAKE_CURRENT_BINARY_DIR}/doxtags/cppreference-doxygen-web.tag.xml=http://en.cppreference.com/w/"
		)

	doxygen_add_docs(
		doxygen_docs
		${PROJECT_SOURCE_DIR}/README.md
		${PROJECT_SOURCE_DIR}/include
		${DOC_SOURCE_DIRS}
		COMMENT "Generate man pages"
		)
else()
	list(APPEND DOC_SOURCE_DIRS ${PROJECT_SOURCE_DIR}/include)
	list(REMOVE_DUPLICATES DOC_SOURCE_DIRS)
	set(DOC_SOURCE_DIRS ${DOC_SOURCE_DIRS}  CACHE STRING "" FORCE)
	mark_as_advanced(DOC_SOURCE_DIRS)
endif()

