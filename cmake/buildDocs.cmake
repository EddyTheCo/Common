
function(build_docs)
	find_package(Doxygen)
	if(DOXYGEN_FOUND)
		if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
			file(DOWNLOAD "https://upload.cppreference.com/mwiki/images/f/f8/cppreference-doxygen-web.tag.xml"
				"${CMAKE_CURRENT_BINARY_DIR}/doxtags/cppreference-doxygen-web.tag.xml")
			file(DOWNLOAD "https://doc.qt.io/qt-6/qtcore.tags"
				"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtcore.tags")
			file(DOWNLOAD "https://doc.qt.io/qt-6/qtnetwork.tags"
				"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtnetwork.tags")
			file(DOWNLOAD "https://doc.qt.io/qt-6/qtwebsockets.tags"
				"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtwebsockets.tags")

			set(DOXYGEN_USE_MDFILE_AS_MAINPAGE "${CMAKE_SOURCE_DIR}/README.md")
			set(DOXYGEN_HTML_EXTRA_STYLESHEET ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../css/doxygen_style.css
				${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../css/doxygen_style.css
				)
			set(DOXYGEN_PROJECT_LOGO ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../img/doxygen_logo.png)
			set(DOXYGEN_HTML_HEADER ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../html/doxygen_head.html)
			set(DOXYGEN_HTML_FOOTER ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../html/doxygen_footer.html)
			set(DOXYGEN_SHOW_FILES NO)
			set(DOXYGEN_EXTRACT_ALL YES)
			set(DOXYGEN_EXTRACT_STATIC YES)
			set(DOXYGEN_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/doc")
			set(DOXYGEN_GENERATE_TAGFILE ${DOXYGEN_OUTPUT_DIRECTORY}/html/${CMAKE_PROJECT_NAME}.tag)
			set(DOXYGEN_FILTER_PATTERNS  "*.qml=doxyqml")
			set(DOXYGEN_FILE_PATTERNS  "*.qml,*.hpp,*.cpp,*.h,*.c,*.hh,*.md")
			set(DOXYGEN_EXTENSION_MAPPING  "qml=C++")
			set(DOXYGEN_EXCLUDE_PATTERNS  "*/doc/*,*/examples/*,*/test*/*,*/*boost*/*")

			set(DOXYGEN_TAGFILES
				"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtcore.tags=http://doc.qt.io/qt-6/"
				"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtnetwork.tags=http://doc.qt.io/qt-6/"
				"${CMAKE_CURRENT_BINARY_DIR}/doxtags/qtwebsockets.tags=http://doc.qt.io/qt-6/"
				"${CMAKE_CURRENT_BINARY_DIR}/doxtags/cppreference-doxygen-web.tag.xml=http://en.cppreference.com/w/"
				)

			doxygen_add_docs(
				doxygen_docs
				${PROJECT_SOURCE_DIR}
				${DOC_SOURCE_DIRS}
				COMMENT "Generate man pages"
				)
		else()
			list(APPEND DOC_SOURCE_DIRS ${PROJECT_SOURCE_DIR})
			list(REMOVE_DUPLICATES DOC_SOURCE_DIRS)
			set(DOC_SOURCE_DIRS ${DOC_SOURCE_DIRS}  CACHE STRING "" FORCE)
			mark_as_advanced(DOC_SOURCE_DIRS)
		endif(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	endif(DOXYGEN_FOUND)
endfunction()
