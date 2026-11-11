// rook.h
#ifndef ROOK_H
#define ROOK_H

#include "chesspiece.h"

class Rook : public ChessPiece {
public:
    Rook(const std::string& color, const std::string& position);
    ~Rook() override;
    void move(const std::string& newPosition) override;
};

#endif