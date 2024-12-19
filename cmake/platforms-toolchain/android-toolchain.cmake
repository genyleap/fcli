# Standard settings for Android
set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_SYSTEM_VERSION 21)  # Android API level (can be changed to your target version)
set(CMAKE_CROSSCOMPILING TRUE)
set(ANDROID TRUE)
set(PLATFORM_FOLDER "Android")

#------ PROJECT DIRECTORIES ------
# Define base build directory for Android
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

# Set NDK path (if it's not set globally, you can also set the NDK path here)
# set(ANDROID_NDK "/path/to/your/ndk")  # Uncomment if needed

if(ANDROID_SDK_ROOT)
include(${ANDROID_SDK_ROOT}/android_openssl/CMakeLists.txt)
endif()

if(ANDROID_SDK)
include(${ANDROID_SDK}/android_openssl/CMakeLists.txt)
endif()

# Specify the Android ABIs (Architectures) to target
set(ANDROID_ABI "arm64-v8a" CACHE STRING "Android ABI" FORCE)  # You can use "armeabi-v7a", "x86", "x86_64", "arm64-v8a"
set(ANDROID_NATIVE_API_LEVEL 21)  # Android API level, the minimum required by your app

# Set Android toolchain file (you need to provide the correct path to the Android toolchain file)
set(CMAKE_TOOLCHAIN_FILE ${ANDROID_NDK}/build/cmake/android.toolchain.cmake)

# Android-specific libraries (Android system libraries)
# You can add more libraries depending on your requirements (e.g., OpenGL, Vulkan, JNI, etc.)
set(OS_LIBS
    "-landroid"               # Basic Android library
    "-lEGL"                   # OpenGL ES library
    "-lGLESv2"                # OpenGL ES 2.0
    "-ljnigraphics"           # JNI Graphics interface (useful for drawing)
    "-llog"                   # Android log library (for logging in C++ code)
)

# Output information for debugging
message("Build directory: ${dir}")
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
message("CMAKE_LIBRARY_OUTPUT_DIRECTORY: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
message("Android NDK path: ${ANDROID_NDK}")
message("Android ABI: ${ANDROID_ABI}")
message("Android API Level: ${ANDROID_NATIVE_API_LEVEL}")
message("Android Libraries: ${OS_LIBS}")
