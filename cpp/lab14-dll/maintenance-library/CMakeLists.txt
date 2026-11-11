cmake_minimum_required(VERSION 3.20)
project(MaintenanceLibrary)

set(CMAKE_CXX_STANDARD 20)

add_library(MaintenanceLibrary STATIC MaintenanceLibrary.cpp
        MaintenanceLibrary.h)
