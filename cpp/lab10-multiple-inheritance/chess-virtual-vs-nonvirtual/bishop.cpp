// bishop.cpp
#include "bishop.h"
#include <iostream>

Bishop::Bishop(const std::string& color, const std::string& position)
    : ChessPiece(color, position) {
    std::cout << "  Bishop ready" << std::endl;
}

Bishop::~Bishop() {
    std::cout << "  Bishop destroyed" << std::endl;
}

void Bishop::move(const std::string& newPosition) {
    std::cout << "  Bishop moves diagonally to " << newPosition << std::endl;
    position = newPosition;
}