// rook.cpp
#include "rook.h"
#include <iostream>

Rook::Rook(const std::string& color, const std::string& position)
    : ChessPiece(color, position) {
    std::cout << "  Rook ready" << std::endl;
}

Rook::~Rook() {
    std::cout << "  Rook destroyed" << std::endl;
}

void Rook::move(const std::string& newPosition) {
    std::cout << "  Rook moves straight to " << newPosition << std::endl;
    position = newPosition;
}