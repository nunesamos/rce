# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/Documents/rasp_crowding_estimative/rce/Code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Documents/rasp_crowding_estimative/rce/Code/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/mtcnn.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/mtcnn.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/mtcnn.dir/flags.make

lib/CMakeFiles/mtcnn.dir/src/detector.cc.o: lib/CMakeFiles/mtcnn.dir/flags.make
lib/CMakeFiles/mtcnn.dir/src/detector.cc.o: ../lib/src/detector.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/rasp_crowding_estimative/rce/Code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/CMakeFiles/mtcnn.dir/src/detector.cc.o"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mtcnn.dir/src/detector.cc.o -c /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/detector.cc

lib/CMakeFiles/mtcnn.dir/src/detector.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mtcnn.dir/src/detector.cc.i"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/detector.cc > CMakeFiles/mtcnn.dir/src/detector.cc.i

lib/CMakeFiles/mtcnn.dir/src/detector.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mtcnn.dir/src/detector.cc.s"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/detector.cc -o CMakeFiles/mtcnn.dir/src/detector.cc.s

lib/CMakeFiles/mtcnn.dir/src/onet.cc.o: lib/CMakeFiles/mtcnn.dir/flags.make
lib/CMakeFiles/mtcnn.dir/src/onet.cc.o: ../lib/src/onet.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/rasp_crowding_estimative/rce/Code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lib/CMakeFiles/mtcnn.dir/src/onet.cc.o"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mtcnn.dir/src/onet.cc.o -c /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/onet.cc

lib/CMakeFiles/mtcnn.dir/src/onet.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mtcnn.dir/src/onet.cc.i"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/onet.cc > CMakeFiles/mtcnn.dir/src/onet.cc.i

lib/CMakeFiles/mtcnn.dir/src/onet.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mtcnn.dir/src/onet.cc.s"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/onet.cc -o CMakeFiles/mtcnn.dir/src/onet.cc.s

lib/CMakeFiles/mtcnn.dir/src/pnet.cc.o: lib/CMakeFiles/mtcnn.dir/flags.make
lib/CMakeFiles/mtcnn.dir/src/pnet.cc.o: ../lib/src/pnet.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/rasp_crowding_estimative/rce/Code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lib/CMakeFiles/mtcnn.dir/src/pnet.cc.o"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mtcnn.dir/src/pnet.cc.o -c /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/pnet.cc

lib/CMakeFiles/mtcnn.dir/src/pnet.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mtcnn.dir/src/pnet.cc.i"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/pnet.cc > CMakeFiles/mtcnn.dir/src/pnet.cc.i

lib/CMakeFiles/mtcnn.dir/src/pnet.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mtcnn.dir/src/pnet.cc.s"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/pnet.cc -o CMakeFiles/mtcnn.dir/src/pnet.cc.s

lib/CMakeFiles/mtcnn.dir/src/rnet.cc.o: lib/CMakeFiles/mtcnn.dir/flags.make
lib/CMakeFiles/mtcnn.dir/src/rnet.cc.o: ../lib/src/rnet.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Documents/rasp_crowding_estimative/rce/Code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object lib/CMakeFiles/mtcnn.dir/src/rnet.cc.o"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mtcnn.dir/src/rnet.cc.o -c /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/rnet.cc

lib/CMakeFiles/mtcnn.dir/src/rnet.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mtcnn.dir/src/rnet.cc.i"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/rnet.cc > CMakeFiles/mtcnn.dir/src/rnet.cc.i

lib/CMakeFiles/mtcnn.dir/src/rnet.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mtcnn.dir/src/rnet.cc.s"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib/src/rnet.cc -o CMakeFiles/mtcnn.dir/src/rnet.cc.s

# Object files for target mtcnn
mtcnn_OBJECTS = \
"CMakeFiles/mtcnn.dir/src/detector.cc.o" \
"CMakeFiles/mtcnn.dir/src/onet.cc.o" \
"CMakeFiles/mtcnn.dir/src/pnet.cc.o" \
"CMakeFiles/mtcnn.dir/src/rnet.cc.o"

# External object files for target mtcnn
mtcnn_EXTERNAL_OBJECTS =

lib/libmtcnn.a: lib/CMakeFiles/mtcnn.dir/src/detector.cc.o
lib/libmtcnn.a: lib/CMakeFiles/mtcnn.dir/src/onet.cc.o
lib/libmtcnn.a: lib/CMakeFiles/mtcnn.dir/src/pnet.cc.o
lib/libmtcnn.a: lib/CMakeFiles/mtcnn.dir/src/rnet.cc.o
lib/libmtcnn.a: lib/CMakeFiles/mtcnn.dir/build.make
lib/libmtcnn.a: lib/CMakeFiles/mtcnn.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Documents/rasp_crowding_estimative/rce/Code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libmtcnn.a"
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/mtcnn.dir/cmake_clean_target.cmake
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mtcnn.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/mtcnn.dir/build: lib/libmtcnn.a

.PHONY : lib/CMakeFiles/mtcnn.dir/build

lib/CMakeFiles/mtcnn.dir/clean:
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/mtcnn.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/mtcnn.dir/clean

lib/CMakeFiles/mtcnn.dir/depend:
	cd /home/pi/Documents/rasp_crowding_estimative/rce/Code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Documents/rasp_crowding_estimative/rce/Code /home/pi/Documents/rasp_crowding_estimative/rce/Code/lib /home/pi/Documents/rasp_crowding_estimative/rce/Code/build /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib /home/pi/Documents/rasp_crowding_estimative/rce/Code/build/lib/CMakeFiles/mtcnn.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/mtcnn.dir/depend

