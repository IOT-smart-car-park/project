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

# Utility rule file for check.

# Include the progress variables for this target.
include tests/CMakeFiles/check.dir/progress.make

tests/CMakeFiles/check:
	cd /Users/PingHsiLo/openalpr/src/build/tests && /usr/local/Cellar/cmake/3.19.6/bin/ctest

check: tests/CMakeFiles/check
check: tests/CMakeFiles/check.dir/build.make

.PHONY : check

# Rule to build all files generated by this target.
tests/CMakeFiles/check.dir/build: check

.PHONY : tests/CMakeFiles/check.dir/build

tests/CMakeFiles/check.dir/clean:
	cd /Users/PingHsiLo/openalpr/src/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/check.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/check.dir/clean

tests/CMakeFiles/check.dir/depend:
	cd /Users/PingHsiLo/openalpr/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/PingHsiLo/openalpr/src /Users/PingHsiLo/openalpr/src/tests /Users/PingHsiLo/openalpr/src/build /Users/PingHsiLo/openalpr/src/build/tests /Users/PingHsiLo/openalpr/src/build/tests/CMakeFiles/check.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/check.dir/depend

