cmake_minimum_required(VERSION 3.20)
project(Lab_11_1_)

set(CMAKE_CXX_STANDARD 20)

add_executable(Lab_11_1_ main.cpp
        Contained1.cpp
        Contained1.h
        Contained2.cpp
        Contained2.h
        Contained3.cpp
        Contained3.h
        BaseContainer.cpp
        BaseContainer.h
        DerivedContainer.cpp
        DerivedContainer.h)
