// rook_virtual.cpp
#include "rook_virtual.h"
#include <iostream>

RookV::RookV(const std::string& color, const std::string& position)
    : ChessPieceV(color, position) {
    std::cout << "  RookV ready" << std::endl;
}

RookV::~RookV() {
    std::cout << "  RookV destroyed" << std::endl;
}

void RookV::move(const std::string& newPosition) {
    std::cout << "  RookV moves straight to " << newPosition << std::endl;
    position = newPosition;
}