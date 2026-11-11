// bishop_virtual.cpp
#include "bishop_virtual.h"
#include <iostream>

BishopV::BishopV(const std::string& color, const std::string& position)
    : ChessPieceV(color, position) {
    std::cout << "  BishopV ready" << std::endl;
}

BishopV::~BishopV() {
    std::cout << "  BishopV destroyed" << std::endl;
}

void BishopV::move(const std::string& newPosition) {
    std::cout << "  BishopV moves diagonally to " << newPosition << std::endl;
    position = newPosition;
}