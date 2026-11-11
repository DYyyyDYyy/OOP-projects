#include <iostream>
#include "MaintenanceLibrary.h"

int main() {
    const char* myInstrument = "Acoustic Guitar (Dreadnought)";

    std::cout << "--- Запуск сервісу для Гітари ---" << std::endl;

    perform_cleaning(myInstrument);
    tune_strings(myInstrument, 6);
    apply_polish(myInstrument);

    std::cout << "Гітара готова до гри рок-н-ролу!" << std::endl;

    return 0;
}