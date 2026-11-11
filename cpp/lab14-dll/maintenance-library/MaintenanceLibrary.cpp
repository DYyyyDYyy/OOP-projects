#include <iostream>
#include "MaintenanceLibrary.h"

void perform_cleaning(const char* instrument) {
    std::cout << "[Maintenance] Очищення корпусу та грифа для: " << instrument << "..." << std::endl;
    std::cout << "[Maintenance] Видалення пилу та залишків каніфолі/жиру завершено." << std::endl;
}

void tune_strings(const char* instrument, int string_count) {
    std::cout << "[Maintenance] Налаштування " << string_count << " струн інструмента " << instrument << "..." << std::endl;
    for(int i = 1; i <= string_count; ++i) {
        std::cout << "  - Струна " << i << " налаштована в унісон." << std::endl;
    }
}

void apply_polish(const char* instrument) {
    std::cout << "[Maintenance] Полірування лакового покриття: " << instrument << "." << std::endl;
    std::cout << "[Maintenance] Інструмент виглядає як новий!" << std::endl;
}