# Standard settings for Wasm systems
set(CMAKE_SYSTEM_NAME WASM)  # Generic Wasm system for Web.
set(CMAKE_SYSTEM_VERSION 1)  # Version is generic for all wasm systems
set(CMAKE_CROSSCOMPILING FALSE)  # We are not cross-compiling
set (WASM TRUE)
set(PLATFORM_FOLDER "Wasm")

#------ PROJECT DIRECTORIES ------
# Define base build directory
set(dir ${CMAKE_CURRENT_SOURCE_DIR}/build/${PLATFORM_FOLDER})

# Set output directories for executables, libraries, and other build files
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${dir})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${dir}/lib)
set(CMAKE_BUILD_FILES_DIRECTORY ${dir})
set(CMAKE_BINARY_DIR ${dir})
set(CMAKE_CACHEFILE_DIR ${dir})

# Ensure all output paths are unified
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
set(LIBRARY_OUTPUT_PATH ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

# Output information for debugging
message("Build directory: ${dir}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
message("CMAKE_LIBRARY_OUTPUT_DIRECTORY: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
message("Unix-like Libraries: ${OS_LIBS}")
