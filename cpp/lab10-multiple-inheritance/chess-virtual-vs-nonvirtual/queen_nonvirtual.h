// queen_nonvirtual.h
#ifndef QUEEN_NONVIRTUAL_H
#define QUEEN_NONVIRTUAL_H

#include "rook.h"
#include "bishop.h"

class QueenNonVirtual : public Rook, public Bishop {
public:
    QueenNonVirtual(const std::string& color, const std::string& position);
    ~QueenNonVirtual();
    void move(const std::string& newPosition) override;
};

#endif