// rook_virtual.h
#ifndef ROOK_VIRTUAL_H
#define ROOK_VIRTUAL_H

#include "chesspiece_virtual.h"

class RookV : virtual public ChessPieceV {
public:
    RookV(const std::string& color, const std::string& position);
    ~RookV() override;
    void move(const std::string& newPosition) override;
};

#endif