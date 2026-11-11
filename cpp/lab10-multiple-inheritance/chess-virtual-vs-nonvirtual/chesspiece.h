// chesspiece.h
#ifndef CHESSPIECE_H
#define CHESSPIECE_H

#include <string>

class ChessPiece {
public:
    ChessPiece(const std::string& color, const std::string& position);
    virtual ~ChessPiece();
    virtual void move(const std::string& newPosition) = 0;

    std::string getColor() const;
    std::string getPosition() const;

protected:
    std::string color;
    std::string position;
};

#endif