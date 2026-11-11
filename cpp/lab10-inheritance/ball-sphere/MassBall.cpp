
#include "MassBall.h"
#include <iostream>

MassBall::MassBall() : Ball(), mass(1.0)
{
}

MassBall::MassBall(double initialRadius, const std::string& initialName, double initialMass)
    : Ball(initialRadius, initialName), mass(initialMass > 0 ? initialMass : 1.0)
{
}

void MassBall::setMass(double newMass)
{
    if (newMass > 0)
        mass = newMass;
}

double MassBall::getMass() const
{
    return mass;
}

double MassBall::getWeight() const
{
    return mass * g;
}

void MassBall::displayStatistics() const
{

    std::string name;
    getName(name);
    std::cout << "Object Name = " << name << " (MassBall)\n";
    std::cout << "Mass = " << mass << " kg\n";
    std::cout << "Weight = " << getWeight() << " N\n";

    std::cout << "Radius = " << getRadius() << "\n";
    std::cout << "Diameter = " << getDiameter() << "\n";
    std::cout << "Area = " << getArea() << "\n";
    std::cout << "Volume = " << getVolume() << std::endl;
}