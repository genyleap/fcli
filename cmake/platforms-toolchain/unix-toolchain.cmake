# Standard settings for Unix-like systems (FreeBSD, OpenBSD, etc.)
set(CMAKE_SYSTEM_NAME UNIX)  # Generic Unix system for FreeBSD, OpenBSD, etc.
set(CMAKE_SYSTEM_VERSION 1)  # Version is generic for all Unix-like systems
set(CMAKE_CROSSCOMPILING FALSE)  # We are not cross-compiling
set (UNIX TRUE)
set(PLATFORM_FOLDER "Unix")

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

# Unix system libraries - Common across most BSD-like systems
set(OS_LIBS
    "-lpthread"        # Pthread library for multithreading (POSIX threads)
    "-lm"              # Math library (for common math functions like sqrt, sin, etc.)
    "-lstdc++"         # Standard C++ library
    "-lc"              # C standard library
    "-ldl"             # Dynamic loading library (for Unix-like systems)
    "-lrt"             # Real-time extensions for Unix-like systems
)

# Optional: Add more libraries depending on the specific BSD system or features you need
# set(OS_LIBS ${OS_LIBS} "-lX11")  # If using X11 for graphical apps
# set(OS_LIBS ${OS_LIBS} "-lssl -lcrypto")  # If using OpenSSL for encryption

# Output information for debugging
message("Build directory: ${dir}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
message("CMAKE_LIBRARY_OUTPUT_DIRECTORY: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
message("Unix-like Libraries: ${OS_LIBS}")
