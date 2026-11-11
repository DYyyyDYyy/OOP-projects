cmake_minimum_required(VERSION 3.20)
project(Lab_14)

set(CMAKE_CXX_STANDARD 20)

add_executable(Lab_14 main.cpp
        MathLibrary.cpp
        MathLibrary.h
        pch.cpp
        pch.h)
