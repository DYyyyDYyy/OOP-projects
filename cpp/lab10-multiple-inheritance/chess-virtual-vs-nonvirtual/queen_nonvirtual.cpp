// queen_nonvirtual.cpp
#include "queen_nonvirtual.h"
#include <iostream>

QueenNonVirtual::QueenNonVirtual(const std::string& color, const std::string& position)
    : Rook(color, position), Bishop(color, position) {
    std::cout << "  Queen (non-virtual) ready" << std::endl;
}

QueenNonVirtual::~QueenNonVirtual() {
    std::cout << "  Queen (non-virtual) destroyed" << std::endl;
}

void QueenNonVirtual::move(const std::string& newPosition) {
    std::cout << "  Queen moves like Rook + Bishop to " << newPosition << std::endl;
    // Щоб уникнути неоднозначності, явно вказуємо шлях
    Rook::position = newPosition;
}