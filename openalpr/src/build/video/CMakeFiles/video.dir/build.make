# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.19.6/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.19.6/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/PingHsiLo/openalpr/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/PingHsiLo/openalpr/src/build

# Include any dependencies generated for this target.
include video/CMakeFiles/video.dir/depend.make

# Include the progress variables for this target.
include video/CMakeFiles/video.dir/progress.make

# Include the compile flags for this target's objects.
include video/CMakeFiles/video.dir/flags.make

video/CMakeFiles/video.dir/videobuffer.cpp.o: video/CMakeFiles/video.dir/flags.make
video/CMakeFiles/video.dir/videobuffer.cpp.o: ../video/videobuffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object video/CMakeFiles/video.dir/videobuffer.cpp.o"
	cd /Users/PingHsiLo/openalpr/src/build/video && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/video.dir/videobuffer.cpp.o -c /Users/PingHsiLo/openalpr/src/video/videobuffer.cpp

video/CMakeFiles/video.dir/videobuffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/video.dir/videobuffer.cpp.i"
	cd /Users/PingHsiLo/openalpr/src/build/video && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/PingHsiLo/openalpr/src/video/videobuffer.cpp > CMakeFiles/video.dir/videobuffer.cpp.i

video/CMakeFiles/video.dir/videobuffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/video.dir/videobuffer.cpp.s"
	cd /Users/PingHsiLo/openalpr/src/build/video && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/PingHsiLo/openalpr/src/video/videobuffer.cpp -o CMakeFiles/video.dir/videobuffer.cpp.s

# Object files for target video
video_OBJECTS = \
"CMakeFiles/video.dir/videobuffer.cpp.o"

# External object files for target video
video_EXTERNAL_OBJECTS =

video/libvideo.a: video/CMakeFiles/video.dir/videobuffer.cpp.o
video/libvideo.a: video/CMakeFiles/video.dir/build.make
video/libvideo.a: video/CMakeFiles/video.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libvideo.a"
	cd /Users/PingHsiLo/openalpr/src/build/video && $(CMAKE_COMMAND) -P CMakeFiles/video.dir/cmake_clean_target.cmake
	cd /Users/PingHsiLo/openalpr/src/build/video && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/video.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
video/CMakeFiles/video.dir/build: video/libvideo.a

.PHONY : video/CMakeFiles/video.dir/build

video/CMakeFiles/video.dir/clean:
	cd /Users/PingHsiLo/openalpr/src/build/video && $(CMAKE_COMMAND) -P CMakeFiles/video.dir/cmake_clean.cmake
.PHONY : video/CMakeFiles/video.dir/clean

video/CMakeFiles/video.dir/depend:
	cd /Users/PingHsiLo/openalpr/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/PingHsiLo/openalpr/src /Users/PingHsiLo/openalpr/src/video /Users/PingHsiLo/openalpr/src/build /Users/PingHsiLo/openalpr/src/build/video /Users/PingHsiLo/openalpr/src/build/video/CMakeFiles/video.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : video/CMakeFiles/video.dir/depend

