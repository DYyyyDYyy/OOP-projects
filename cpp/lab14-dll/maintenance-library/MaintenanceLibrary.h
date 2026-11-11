#pragma once

#if defined(_WIN32)
    #ifdef MAINTENANCE_EXPORTS
        #define MAINTENANCE_API __declspec(dllexport)
    #else
        #define MAINTENANCE_API __declspec(dllimport)
    #endif
#else
    #define MAINTENANCE_API __attribute__((visibility("default")))
#endif

extern "C" {
    MAINTENANCE_API void perform_cleaning(const char* instrument);
    MAINTENANCE_API void tune_strings(const char* instrument, int string_count);
    MAINTENANCE_API void apply_polish(const char* instrument);
}