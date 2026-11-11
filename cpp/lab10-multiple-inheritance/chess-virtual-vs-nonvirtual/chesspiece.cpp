// chesspiece.cpp
#include "chesspiece.h"
#include <iostream>

ChessPiece::ChessPiece(const std::string& color, const std::string& position)
    : color(color), position(position) {
    std::cout << "  ChessPiece created: " << color << " at " << position << std::endl;
}

ChessPiece::~ChessPiece() {
    std::cout << "  ChessPiece destroyed: " << color << std::endl;
}

std::string ChessPiece::getColor() const { return color; }
std::string ChessPiece::getPosition() const { return position; }