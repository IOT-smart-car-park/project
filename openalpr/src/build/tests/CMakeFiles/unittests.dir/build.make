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
include tests/CMakeFiles/unittests.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/unittests.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/unittests.dir/flags.make

tests/CMakeFiles/unittests.dir/test_api.cpp.o: tests/CMakeFiles/unittests.dir/flags.make
tests/CMakeFiles/unittests.dir/test_api.cpp.o: ../tests/test_api.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/unittests.dir/test_api.cpp.o"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unittests.dir/test_api.cpp.o -c /Users/PingHsiLo/openalpr/src/tests/test_api.cpp

tests/CMakeFiles/unittests.dir/test_api.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittests.dir/test_api.cpp.i"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/PingHsiLo/openalpr/src/tests/test_api.cpp > CMakeFiles/unittests.dir/test_api.cpp.i

tests/CMakeFiles/unittests.dir/test_api.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittests.dir/test_api.cpp.s"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/PingHsiLo/openalpr/src/tests/test_api.cpp -o CMakeFiles/unittests.dir/test_api.cpp.s

tests/CMakeFiles/unittests.dir/test_utility.cpp.o: tests/CMakeFiles/unittests.dir/flags.make
tests/CMakeFiles/unittests.dir/test_utility.cpp.o: ../tests/test_utility.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tests/CMakeFiles/unittests.dir/test_utility.cpp.o"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unittests.dir/test_utility.cpp.o -c /Users/PingHsiLo/openalpr/src/tests/test_utility.cpp

tests/CMakeFiles/unittests.dir/test_utility.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittests.dir/test_utility.cpp.i"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/PingHsiLo/openalpr/src/tests/test_utility.cpp > CMakeFiles/unittests.dir/test_utility.cpp.i

tests/CMakeFiles/unittests.dir/test_utility.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittests.dir/test_utility.cpp.s"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/PingHsiLo/openalpr/src/tests/test_utility.cpp -o CMakeFiles/unittests.dir/test_utility.cpp.s

tests/CMakeFiles/unittests.dir/test_config.cpp.o: tests/CMakeFiles/unittests.dir/flags.make
tests/CMakeFiles/unittests.dir/test_config.cpp.o: ../tests/test_config.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object tests/CMakeFiles/unittests.dir/test_config.cpp.o"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unittests.dir/test_config.cpp.o -c /Users/PingHsiLo/openalpr/src/tests/test_config.cpp

tests/CMakeFiles/unittests.dir/test_config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittests.dir/test_config.cpp.i"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/PingHsiLo/openalpr/src/tests/test_config.cpp > CMakeFiles/unittests.dir/test_config.cpp.i

tests/CMakeFiles/unittests.dir/test_config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittests.dir/test_config.cpp.s"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/PingHsiLo/openalpr/src/tests/test_config.cpp -o CMakeFiles/unittests.dir/test_config.cpp.s

tests/CMakeFiles/unittests.dir/test_regex.cpp.o: tests/CMakeFiles/unittests.dir/flags.make
tests/CMakeFiles/unittests.dir/test_regex.cpp.o: ../tests/test_regex.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object tests/CMakeFiles/unittests.dir/test_regex.cpp.o"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unittests.dir/test_regex.cpp.o -c /Users/PingHsiLo/openalpr/src/tests/test_regex.cpp

tests/CMakeFiles/unittests.dir/test_regex.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittests.dir/test_regex.cpp.i"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/PingHsiLo/openalpr/src/tests/test_regex.cpp > CMakeFiles/unittests.dir/test_regex.cpp.i

tests/CMakeFiles/unittests.dir/test_regex.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittests.dir/test_regex.cpp.s"
	cd /Users/PingHsiLo/openalpr/src/build/tests && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/PingHsiLo/openalpr/src/tests/test_regex.cpp -o CMakeFiles/unittests.dir/test_regex.cpp.s

# Object files for target unittests
unittests_OBJECTS = \
"CMakeFiles/unittests.dir/test_api.cpp.o" \
"CMakeFiles/unittests.dir/test_utility.cpp.o" \
"CMakeFiles/unittests.dir/test_config.cpp.o" \
"CMakeFiles/unittests.dir/test_regex.cpp.o"

# External object files for target unittests
unittests_EXTERNAL_OBJECTS =

tests/unittests: tests/CMakeFiles/unittests.dir/test_api.cpp.o
tests/unittests: tests/CMakeFiles/unittests.dir/test_utility.cpp.o
tests/unittests: tests/CMakeFiles/unittests.dir/test_config.cpp.o
tests/unittests: tests/CMakeFiles/unittests.dir/test_regex.cpp.o
tests/unittests: tests/CMakeFiles/unittests.dir/build.make
tests/unittests: openalpr/libopenalpr.2.dylib
tests/unittests: openalpr/support/libsupport.a
tests/unittests: /usr/local/lib/libopencv_gapi.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_stitching.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_alphamat.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_aruco.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_bgsegm.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_bioinspired.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_ccalib.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_dnn_objdetect.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_dnn_superres.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_dpm.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_face.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_freetype.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_fuzzy.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_hfs.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_img_hash.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_intensity_transform.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_line_descriptor.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_mcc.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_quality.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_rapid.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_reg.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_rgbd.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_saliency.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_sfm.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_stereo.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_structured_light.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_phase_unwrapping.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_superres.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_optflow.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_surface_matching.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_tracking.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_highgui.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_datasets.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_plot.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_text.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_videostab.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_videoio.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_viz.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_xfeatures2d.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_ml.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_shape.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_ximgproc.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_video.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_dnn.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_xobjdetect.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_imgcodecs.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_objdetect.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_calib3d.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_features2d.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_flann.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_xphoto.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_photo.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_imgproc.4.5.1.dylib
tests/unittests: /usr/local/lib/libopencv_core.4.5.1.dylib
tests/unittests: /usr/local/lib/libtesseract.dylib
tests/unittests: /usr/local/lib/liblept.dylib
tests/unittests: /usr/local/lib/libtesseract.dylib
tests/unittests: /usr/local/lib/liblept.dylib
tests/unittests: tests/CMakeFiles/unittests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable unittests"
	cd /Users/PingHsiLo/openalpr/src/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unittests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/unittests.dir/build: tests/unittests

.PHONY : tests/CMakeFiles/unittests.dir/build

tests/CMakeFiles/unittests.dir/clean:
	cd /Users/PingHsiLo/openalpr/src/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/unittests.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/unittests.dir/clean

tests/CMakeFiles/unittests.dir/depend:
	cd /Users/PingHsiLo/openalpr/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/PingHsiLo/openalpr/src /Users/PingHsiLo/openalpr/src/tests /Users/PingHsiLo/openalpr/src/build /Users/PingHsiLo/openalpr/src/build/tests /Users/PingHsiLo/openalpr/src/build/tests/CMakeFiles/unittests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/unittests.dir/depend

