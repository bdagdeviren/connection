# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


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

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = E:\Jetbrains\toolbox\apps\CLion\ch-0\211.7442.42\bin\cmake\win\bin\cmake.exe

# The command to remove a file.
RM = E:\Jetbrains\toolbox\apps\CLion\ch-0\211.7442.42\bin\cmake\win\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Burak\CLionProjects\connection

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Burak\CLionProjects\connection\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles\connection.dir\depend.make

# Include the progress variables for this target.
include CMakeFiles\connection.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\connection.dir\flags.make

CMakeFiles\connection.dir\main.c.obj: CMakeFiles\connection.dir\flags.make
CMakeFiles\connection.dir\main.c.obj: ..\main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Burak\CLionProjects\connection\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/connection.dir/main.c.obj"
	E:\VS2017C\VC\Tools\MSVC\14.16.27023\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoCMakeFiles\connection.dir\main.c.obj /FdCMakeFiles\connection.dir\ /FS -c C:\Users\Burak\CLionProjects\connection\main.c
<<

CMakeFiles\connection.dir\main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/connection.dir/main.c.i"
	E:\VS2017C\VC\Tools\MSVC\14.16.27023\bin\Hostx86\x86\cl.exe > CMakeFiles\connection.dir\main.c.i @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\Burak\CLionProjects\connection\main.c
<<

CMakeFiles\connection.dir\main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/connection.dir/main.c.s"
	E:\VS2017C\VC\Tools\MSVC\14.16.27023\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoNUL /FAs /FaCMakeFiles\connection.dir\main.c.s /c C:\Users\Burak\CLionProjects\connection\main.c
<<

# Object files for target connection
connection_OBJECTS = \
"CMakeFiles\connection.dir\main.c.obj"

# External object files for target connection
connection_EXTERNAL_OBJECTS =

bin\connection.exe: CMakeFiles\connection.dir\main.c.obj
bin\connection.exe: CMakeFiles\connection.dir\build.make
bin\connection.exe: ..\libs\kubernetes\libkubernetes.so
bin\connection.exe: CMakeFiles\connection.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Burak\CLionProjects\connection\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin\connection.exe"
	E:\Jetbrains\toolbox\apps\CLion\ch-0\211.7442.42\bin\cmake\win\bin\cmake.exe -E vs_link_exe --intdir=CMakeFiles\connection.dir --rc="E:\Windows Kits\10\bin\10.0.17763.0\x86\rc.exe" --mt="E:\Windows Kits\10\bin\10.0.17763.0\x86\mt.exe" --manifests -- E:\VS2017C\VC\Tools\MSVC\14.16.27023\bin\Hostx86\x86\link.exe /nologo @CMakeFiles\connection.dir\objects1.rsp @<<
 /out:bin\connection.exe /implib:lib\connection.lib /pdb:C:\Users\Burak\CLionProjects\connection\cmake-build-debug\bin\connection.pdb /version:0.0 /machine:X86   /debug /INCREMENTAL  /subsystem:console   -LIBPATH:C:\Users\Burak\.conan\data\log.c\cci.20200620\_\_\package\4fa84a55b18883f93b7f256181f8433f4080e0cf\lib  -LIBPATH:C:\Users\Burak\.conan\data\libcurl\7.77.0\_\_\package\766ededbc3ace7db8cde4844e595a5f41ed42cd2\lib  -LIBPATH:C:\Users\Burak\.conan\data\openssl\1.1.1k\_\_\package\6cc50b139b9c3d27b3e9042d5f5372d327b3a9f7\lib  -LIBPATH:C:\Users\Burak\.conan\data\zlib\1.2.11\_\_\package\6cc50b139b9c3d27b3e9042d5f5372d327b3a9f7\lib  log.c.lib libcurl.lib libssl.lib libcrypto.lib zlib.lib crypt32.lib ws2_32.lib advapi32.lib user32.lib ..\libs\kubernetes\libkubernetes.so kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<

# Rule to build all files generated by this target.
CMakeFiles\connection.dir\build: bin\connection.exe

.PHONY : CMakeFiles\connection.dir\build

CMakeFiles\connection.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\connection.dir\cmake_clean.cmake
.PHONY : CMakeFiles\connection.dir\clean

CMakeFiles\connection.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Users\Burak\CLionProjects\connection C:\Users\Burak\CLionProjects\connection C:\Users\Burak\CLionProjects\connection\cmake-build-debug C:\Users\Burak\CLionProjects\connection\cmake-build-debug C:\Users\Burak\CLionProjects\connection\cmake-build-debug\CMakeFiles\connection.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\connection.dir\depend

