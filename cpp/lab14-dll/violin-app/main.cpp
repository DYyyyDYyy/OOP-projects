#include <iostream>
#include <MaintenanceLibrary.h>

int main() {
    const char* myInstrument = "Violin (Stradivarius Model)";

    std::cout << "--- Запуск сервісу для Скрипки ---" << std::endl;

    perform_cleaning(myInstrument);
    tune_strings(myInstrument, 4);
    apply_polish(myInstrument);

    std::cout << "Скрипка готова до виступу в оркестрі!" << std::endl;

    return 0;
}