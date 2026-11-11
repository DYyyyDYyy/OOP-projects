// queen_virtual.h
#ifndef QUEEN_VIRTUAL_H
#define QUEEN_VIRTUAL_H

#include "rook_virtual.h"
#include "bishop_virtual.h"

class QueenV : public RookV, public BishopV {
public:
    QueenV(const std::string& color, const std::string& position);
    ~QueenV() override;
    void move(const std::string& newPosition) override;
};

#endif