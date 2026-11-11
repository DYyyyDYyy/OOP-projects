
#ifndef MASSBALL_H
#define MASSBALL_H

#include "Ball.h"

class MassBall : public Ball
{
public:
    MassBall();
    MassBall(double initialRadius, const std::string& initialName, double initialMass);

    void setMass(double newMass);
    double getMass() const;
    double getWeight() const;

    void displayStatistics() const;

private:
    double mass;
    static constexpr double g = 9.81;
};

#endif