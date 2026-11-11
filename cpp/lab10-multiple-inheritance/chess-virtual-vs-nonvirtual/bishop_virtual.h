// bishop_virtual.h
#ifndef BISHOP_VIRTUAL_H
#define BISHOP_VIRTUAL_H

#include "chesspiece_virtual.h"

class BishopV : virtual public ChessPieceV {
public:
    BishopV(const std::string& color, const std::string& position);
    ~BishopV() override;
    void move(const std::string& newPosition) override;
};

#endif