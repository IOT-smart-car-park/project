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
include CMakeFiles/alprd.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/alprd.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/alprd.dir/flags.make

CMakeFiles/alprd.dir/daemon.cpp.o: CMakeFiles/alprd.dir/flags.make
CMakeFiles/alprd.dir/daemon.cpp.o: ../daemon.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/alprd.dir/daemon.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/alprd.dir/daemon.cpp.o -c /Users/PingHsiLo/openalpr/src/daemon.cpp

CMakeFiles/alprd.dir/daemon.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/alprd.dir/daemon.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/PingHsiLo/openalpr/src/daemon.cpp > CMakeFiles/alprd.dir/daemon.cpp.i

CMakeFiles/alprd.dir/daemon.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/alprd.dir/daemon.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/PingHsiLo/openalpr/src/daemon.cpp -o CMakeFiles/alprd.dir/daemon.cpp.s

CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.o: CMakeFiles/alprd.dir/flags.make
CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.o: ../daemon/daemonconfig.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.o -c /Users/PingHsiLo/openalpr/src/daemon/daemonconfig.cpp

CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/PingHsiLo/openalpr/src/daemon/daemonconfig.cpp > CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.i

CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/PingHsiLo/openalpr/src/daemon/daemonconfig.cpp -o CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.s

CMakeFiles/alprd.dir/daemon/beanstalk.c.o: CMakeFiles/alprd.dir/flags.make
CMakeFiles/alprd.dir/daemon/beanstalk.c.o: ../daemon/beanstalk.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/alprd.dir/daemon/beanstalk.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/alprd.dir/daemon/beanstalk.c.o -c /Users/PingHsiLo/openalpr/src/daemon/beanstalk.c

CMakeFiles/alprd.dir/daemon/beanstalk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/alprd.dir/daemon/beanstalk.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/PingHsiLo/openalpr/src/daemon/beanstalk.c > CMakeFiles/alprd.dir/daemon/beanstalk.c.i

CMakeFiles/alprd.dir/daemon/beanstalk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/alprd.dir/daemon/beanstalk.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/PingHsiLo/openalpr/src/daemon/beanstalk.c -o CMakeFiles/alprd.dir/daemon/beanstalk.c.s

CMakeFiles/alprd.dir/daemon/beanstalk.cc.o: CMakeFiles/alprd.dir/flags.make
CMakeFiles/alprd.dir/daemon/beanstalk.cc.o: ../daemon/beanstalk.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/alprd.dir/daemon/beanstalk.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/alprd.dir/daemon/beanstalk.cc.o -c /Users/PingHsiLo/openalpr/src/daemon/beanstalk.cc

CMakeFiles/alprd.dir/daemon/beanstalk.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/alprd.dir/daemon/beanstalk.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/PingHsiLo/openalpr/src/daemon/beanstalk.cc > CMakeFiles/alprd.dir/daemon/beanstalk.cc.i

CMakeFiles/alprd.dir/daemon/beanstalk.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/alprd.dir/daemon/beanstalk.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/PingHsiLo/openalpr/src/daemon/beanstalk.cc -o CMakeFiles/alprd.dir/daemon/beanstalk.cc.s

# Object files for target alprd
alprd_OBJECTS = \
"CMakeFiles/alprd.dir/daemon.cpp.o" \
"CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.o" \
"CMakeFiles/alprd.dir/daemon/beanstalk.c.o" \
"CMakeFiles/alprd.dir/daemon/beanstalk.cc.o"

# External object files for target alprd
alprd_EXTERNAL_OBJECTS =

alprd: CMakeFiles/alprd.dir/daemon.cpp.o
alprd: CMakeFiles/alprd.dir/daemon/daemonconfig.cpp.o
alprd: CMakeFiles/alprd.dir/daemon/beanstalk.c.o
alprd: CMakeFiles/alprd.dir/daemon/beanstalk.cc.o
alprd: CMakeFiles/alprd.dir/build.make
alprd: openalpr/libopenalpr.2.dylib
alprd: openalpr/support/libsupport.a
alprd: video/libvideo.a
alprd: /usr/local/lib/libopencv_gapi.4.5.1.dylib
alprd: /usr/local/lib/libopencv_stitching.4.5.1.dylib
alprd: /usr/local/lib/libopencv_alphamat.4.5.1.dylib
alprd: /usr/local/lib/libopencv_aruco.4.5.1.dylib
alprd: /usr/local/lib/libopencv_bgsegm.4.5.1.dylib
alprd: /usr/local/lib/libopencv_bioinspired.4.5.1.dylib
alprd: /usr/local/lib/libopencv_ccalib.4.5.1.dylib
alprd: /usr/local/lib/libopencv_dnn_objdetect.4.5.1.dylib
alprd: /usr/local/lib/libopencv_dnn_superres.4.5.1.dylib
alprd: /usr/local/lib/libopencv_dpm.4.5.1.dylib
alprd: /usr/local/lib/libopencv_face.4.5.1.dylib
alprd: /usr/local/lib/libopencv_freetype.4.5.1.dylib
alprd: /usr/local/lib/libopencv_fuzzy.4.5.1.dylib
alprd: /usr/local/lib/libopencv_hfs.4.5.1.dylib
alprd: /usr/local/lib/libopencv_img_hash.4.5.1.dylib
alprd: /usr/local/lib/libopencv_intensity_transform.4.5.1.dylib
alprd: /usr/local/lib/libopencv_line_descriptor.4.5.1.dylib
alprd: /usr/local/lib/libopencv_mcc.4.5.1.dylib
alprd: /usr/local/lib/libopencv_quality.4.5.1.dylib
alprd: /usr/local/lib/libopencv_rapid.4.5.1.dylib
alprd: /usr/local/lib/libopencv_reg.4.5.1.dylib
alprd: /usr/local/lib/libopencv_rgbd.4.5.1.dylib
alprd: /usr/local/lib/libopencv_saliency.4.5.1.dylib
alprd: /usr/local/lib/libopencv_sfm.4.5.1.dylib
alprd: /usr/local/lib/libopencv_stereo.4.5.1.dylib
alprd: /usr/local/lib/libopencv_structured_light.4.5.1.dylib
alprd: /usr/local/lib/libopencv_superres.4.5.1.dylib
alprd: /usr/local/lib/libopencv_surface_matching.4.5.1.dylib
alprd: /usr/local/lib/libopencv_tracking.4.5.1.dylib
alprd: /usr/local/lib/libopencv_videostab.4.5.1.dylib
alprd: /usr/local/lib/libopencv_viz.4.5.1.dylib
alprd: /usr/local/lib/libopencv_xfeatures2d.4.5.1.dylib
alprd: /usr/local/lib/libopencv_xobjdetect.4.5.1.dylib
alprd: /usr/local/lib/libopencv_xphoto.4.5.1.dylib
alprd: /usr/local/lib/libtesseract.dylib
alprd: /usr/local/lib/liblept.dylib
alprd: /usr/local/lib/libtesseract.dylib
alprd: /usr/local/lib/liblept.dylib
alprd: /usr/local/lib/liblog4cplus.dylib
alprd: /usr/local/lib/libopencv_phase_unwrapping.4.5.1.dylib
alprd: /usr/local/lib/libopencv_optflow.4.5.1.dylib
alprd: /usr/local/lib/libopencv_highgui.4.5.1.dylib
alprd: /usr/local/lib/libopencv_datasets.4.5.1.dylib
alprd: /usr/local/lib/libopencv_plot.4.5.1.dylib
alprd: /usr/local/lib/libopencv_text.4.5.1.dylib
alprd: /usr/local/lib/libopencv_videoio.4.5.1.dylib
alprd: /usr/local/lib/libopencv_ml.4.5.1.dylib
alprd: /usr/local/lib/libopencv_shape.4.5.1.dylib
alprd: /usr/local/lib/libopencv_ximgproc.4.5.1.dylib
alprd: /usr/local/lib/libopencv_video.4.5.1.dylib
alprd: /usr/local/lib/libopencv_dnn.4.5.1.dylib
alprd: /usr/local/lib/libopencv_imgcodecs.4.5.1.dylib
alprd: /usr/local/lib/libopencv_objdetect.4.5.1.dylib
alprd: /usr/local/lib/libopencv_calib3d.4.5.1.dylib
alprd: /usr/local/lib/libopencv_features2d.4.5.1.dylib
alprd: /usr/local/lib/libopencv_flann.4.5.1.dylib
alprd: /usr/local/lib/libopencv_photo.4.5.1.dylib
alprd: /usr/local/lib/libopencv_imgproc.4.5.1.dylib
alprd: /usr/local/lib/libopencv_core.4.5.1.dylib
alprd: openalpr/support/libsupport.a
alprd: CMakeFiles/alprd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/PingHsiLo/openalpr/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable alprd"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/alprd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/alprd.dir/build: alprd

.PHONY : CMakeFiles/alprd.dir/build

CMakeFiles/alprd.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/alprd.dir/cmake_clean.cmake
.PHONY : CMakeFiles/alprd.dir/clean

CMakeFiles/alprd.dir/depend:
	cd /Users/PingHsiLo/openalpr/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/PingHsiLo/openalpr/src /Users/PingHsiLo/openalpr/src /Users/PingHsiLo/openalpr/src/build /Users/PingHsiLo/openalpr/src/build /Users/PingHsiLo/openalpr/src/build/CMakeFiles/alprd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/alprd.dir/depend

