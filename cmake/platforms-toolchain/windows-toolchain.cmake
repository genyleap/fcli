# Standard settings for Windows
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_VERSION 10)  # Set the system version (you can adjust if needed)
set(CMAKE_CROSSCOMPILING TRUE)
set(WINDOWS TRUE)
set(PLATFORM_FOLDER "Windows")

#------ PROJECT DIRECTORIES ------
# Define base build directory for Windows
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

# Windows specific libraries and settings
# For simplicity, here are some commonly used libraries on Windows.
# You may need to modify this list based on your project's requirements.
set(OS_LIBS
    "user32.lib"  # Basic Windows user interface library
    "gdi32.lib"   # Windows graphics device interface library
    "kernel32.lib"  # Kernel-level services
)

# Output information for debugging
message("Build directory: ${dir}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
message("CMAKE_LIBRARY_OUTPUT_DIRECTORY: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
message("Windows Libraries: ${OS_LIBS}")
