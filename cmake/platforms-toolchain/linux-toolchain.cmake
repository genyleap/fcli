# Standard settings for Linux systems
set(CMAKE_SYSTEM_NAME Linux)  # Set system to Linux
set(CMAKE_SYSTEM_VERSION 1)   # Version is generic for all Linux distributions
set(CMAKE_CROSSCOMPILING FALSE)  # Not cross-compiling
set (LINUX TRUE)
set(PLATFORM_FOLDER "Linux")

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

# Linux system libraries - Common across most Linux distributions
set(OS_LIBS
    "-lpthread"        # Pthread library for multithreading (POSIX threads)
    "-lm"              # Math library (for common math functions like sqrt, sin, etc.)
    "-lstdc++"         # Standard C++ library
    "-lc"              # C standard library
    "-ldl"             # Dynamic loading library
    "-lrt"             # Real-time extensions for Linux systems
    "-lX11"            # X11 library for graphical applications (if needed)
    "-lssl -lcrypto"   # OpenSSL for encryption (if needed)
)

# Optional: Add other libraries depending on the specific Linux distribution or features you need
# For example, for network-related features or GUI, you can add:
# set(OS_LIBS ${OS_LIBS} "-lgtk-3")  # If using GTK+ for GUI applications
# set(OS_LIBS ${OS_LIBS} "-lboost_system -lboost_filesystem")  # If using Boost

# Output information for debugging
message("Build directory: ${dir}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
message("CMAKE_LIBRARY_OUTPUT_DIRECTORY: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
message("Linux Libraries: ${OS_LIBS}")
