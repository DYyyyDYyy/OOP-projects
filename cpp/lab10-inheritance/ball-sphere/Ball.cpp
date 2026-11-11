
#include "Ball.h"
#include <iostream>

Ball::Ball() : Sphere()
{
    setName("FootBall");
}

Ball::Ball(double initialRadius, const std::string& initialName)
    : Sphere(initialRadius)
{
    setName(initialName);
}

void Ball::getName(std::string& currentName) const
{
    currentName = theName;
}

void Ball::setName(const std::string& newName)
{
    theName = newName;
}

void Ball::resetBall(double newRadius, const std::string& newName)
{
    setRadius(newRadius);
    setName(newName);
}

void Ball::displayStatistics() const
{
    std::cout << "Object Name = " << theName << ":";
    Sphere::displayStatistics();
}