
#ifndef BALL_H
#define BALL_H

#include "Sphere.h"
#include <string>

class Ball : public Sphere
{
public:
    Ball();
    Ball(double initialRadius, const std::string& initialName);

    void getName(std::string& currentName) const;
    void setName(const std::string& newName);
    void resetBall(double newRadius, const std::string& newName);
    void displayStatistics() const;

private:
    std::string theName;
};

#endif