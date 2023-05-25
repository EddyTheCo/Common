cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

include(cmake/VersionFromGit.cmake)

add_custom_target(css_doxygen_style SOURCES 
	${CMAKE_CURRENT_SOURCE_DIR}/css/darkmode.css
	${CMAKE_CURRENT_SOURCE_DIR}/css/doxygen_style.css
	)
add_custom_target(css_doxygen_Header SOURCES 
	${CMAKE_CURRENT_SOURCE_DIR}/html/doxygen_head.html
	)
add_custom_target(css_doxygen_Footer SOURCES 
	${CMAKE_CURRENT_SOURCE_DIR}/html/doxygen_footer.html
	)
add_custom_target(cmake_build_docs SOURCES 
	${CMAKE_CURRENT_SOURCE_DIR}/cmake/buildDocs.cmake
	)
