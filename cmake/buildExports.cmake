
function(build_exports)

	install(EXPORT ${PROJECT_NAME}-config
		DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
		NAMESPACE Esterv::
		COMPONENT ${PROJECT_NAME}-dev
		)
	install(FILES ${CMAKE_SOURCE_DIR}/LICENSE
		DESTINATION ${CMAKE_INSTALL_DATADIR}/Esterv/${PROJECT_NAME}
		COMPONENT ${PROJECT_NAME}
		)
	include(CMakePackageConfigHelpers)
	configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
		"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
		INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
		)
	write_basic_package_version_file(
		"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
		VERSION ${VERSION}
		COMPATIBILITY SameMajorVersion
		)
	install(FILES
		${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
		${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
		DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
		COMPONENT ${PROJECT_NAME}-dev
		)
	export(EXPORT ${PROJECT_NAME}-config
		NAMESPACE Esterv:: 
		FILE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake"
		)
endfunction()
