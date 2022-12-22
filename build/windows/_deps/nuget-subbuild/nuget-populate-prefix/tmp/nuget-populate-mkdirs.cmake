# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/FlutterInSchool/DoAn/quiz_app/build/windows/_deps/nuget-src"
  "D:/FlutterInSchool/DoAn/quiz_app/build/windows/_deps/nuget-build"
  "D:/FlutterInSchool/DoAn/quiz_app/build/windows/_deps/nuget-subbuild/nuget-populate-prefix"
  "D:/FlutterInSchool/DoAn/quiz_app/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/tmp"
  "D:/FlutterInSchool/DoAn/quiz_app/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp"
  "D:/FlutterInSchool/DoAn/quiz_app/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/src"
  "D:/FlutterInSchool/DoAn/quiz_app/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/FlutterInSchool/DoAn/quiz_app/build/windows/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp/${subDir}")
endforeach()
