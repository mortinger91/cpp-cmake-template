add_library(
	${LIB_TARGET}
	utility.cpp
	utility.h
)

target_compile_definitions(
	${LIB_TARGET}
	PRIVATE
		$<$<CONFIG:Debug>:DEBUG>
		$<$<CONFIG:Release>:RELEASE>
)

target_compile_options(
	${LIB_TARGET}
	PRIVATE
		${DEFAULT_COMPILER_OPTIONS}
)

target_link_options(
	${LIB_TARGET}
	PRIVATE
		${DEFAULT_LINKER_OPTIONS}
)
