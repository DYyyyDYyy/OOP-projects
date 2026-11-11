// chesspiece_virtual.cpp
#include "chesspiece_virtual.h"
#include <iostream>

ChessPieceV::ChessPieceV(const std::string& color, const std::string& position)
    : color(color), position(position) {
    std::cout << "  ChessPieceV created: " << color << " at " << position << std::endl;
}

ChessPieceV::~ChessPieceV() {
    std::cout << "  ChessPieceV destroyed: " << color << std::endl;
}

std::string ChessPieceV::getColor() const { return color; }
std::string ChessPieceV::getPosition() const { return position; }