// bishop.h
#ifndef BISHOP_H
#define BISHOP_H

#include "chesspiece.h"

class Bishop : public ChessPiece {
public:
    Bishop(const std::string& color, const std::string& position);
    ~Bishop() override;
    void move(const std::string& newPosition) override;
};

#endif