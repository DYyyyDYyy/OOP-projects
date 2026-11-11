cmake_minimum_required(VERSION 3.20)
project(Lab_10_1)

set(CMAKE_CXX_STANDARD 20)

add_executable(Lab_10_1 main.cpp
        Headphones.cpp
        Headphones.h
        InEarHeadphones.cpp
        InEarHeadphones.h
        WirelessHeadphones.cpp)
