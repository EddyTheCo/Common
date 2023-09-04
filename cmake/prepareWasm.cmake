function(prepare_wasm_folder)
	set(single_value_options TAG )
	cmake_parse_arguments(PARSE_ARGV 0 arg "${single_value_options}")
	if(NOT arg_TAG)
		set(arg_TAG main)
	endif()

	include(FetchContent)
	FetchContent_Declare(
		wasm_folder
		GIT_REPOSITORY https://github.com/EddyTheCo/wasm_folder.git
		GIT_TAG ${arg_TAG}
		)
	FetchContent_MakeAvailable(wasm_folder)
endfunction()

