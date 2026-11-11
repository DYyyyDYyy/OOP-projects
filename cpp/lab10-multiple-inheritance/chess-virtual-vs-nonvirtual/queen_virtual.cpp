// queen_virtual.cpp
#include "queen_virtual.h"
#include <iostream>

QueenV::QueenV(const std::string& color, const std::string& position)
    : ChessPieceV(color, position),   // явний виклик конструктора віртуальної бази
      RookV(color, position),
      BishopV(color, position) {
    std::cout << "  QueenV ready" << std::endl;
}

QueenV::~QueenV() {
    std::cout << "  QueenV destroyed" << std::endl;
}

void QueenV::move(const std::string& newPosition) {
    std::cout << "  QueenV moves like Rook + Bishop to " << newPosition << std::endl;
    position = newPosition; // однозначний доступ, єдиний підоб'єкт ChessPieceV
}