# Standard settings for iOS
set(CMAKE_SYSTEM_NAME iOS)
set(CMAKE_SYSTEM_VERSION 13.0)  # You can adjust this to the minimum iOS version required
set(CMAKE_CROSSCOMPILING TRUE)
set(IOS TRUE)
set(PLATFORM_FOLDER "iOS")

#------ PROJECT DIRECTORIES ------
# Define base build directory for iOS
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

# iOS-specific libraries and frameworks
# You will need to link the appropriate iOS frameworks depending on your application's requirements.
set(OS_LIBS
    "-framework Foundation"  # Core iOS Foundation framework
    "-framework UIKit"       # User interface components
    "-framework CoreGraphics"  # 2D drawing framework
    "-framework CoreMedia"    # Media and video processing
    "-framework AVFoundation"  # Audio and video framework
)

# Output information for debugging
message("Build directory: ${dir}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
message("CMAKE_LIBRARY_OUTPUT_DIRECTORY: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
message("iOS Libraries: ${OS_LIBS}")
