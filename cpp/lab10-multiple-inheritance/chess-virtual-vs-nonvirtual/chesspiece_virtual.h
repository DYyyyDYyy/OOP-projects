// chesspiece_virtual.h
#ifndef CHESSPIECE_VIRTUAL_H
#define CHESSPIECE_VIRTUAL_H

#include <string>

class ChessPieceV {
public:
    ChessPieceV(const std::string& color, const std::string& position);
    virtual ~ChessPieceV();
    virtual void move(const std::string& newPosition) = 0;

    std::string getColor() const;
    std::string getPosition() const;

protected:
    std::string color;
    std::string position;
};

#endif