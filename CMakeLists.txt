cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

include(cmake/VersionFromGit.cmake)

add_custom_target(css_basic_style SOURCES css/basic_style.css)
