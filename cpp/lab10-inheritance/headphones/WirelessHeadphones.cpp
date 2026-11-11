#include "WirelessHeadphones.h"
#include <iostream>

WirelessHeadphones::WirelessHeadphones(std::string modelName, int initialBattery)
    : Headphones(modelName), batteryLevel(initialBattery)
{

    if (batteryLevel < 0) batteryLevel = 0;
    if (batteryLevel > 100) batteryLevel = 100;
    std::cout << "Not Base" << std::endl;
}

void WirelessHeadphones::charge(int amount) {
    if (amount > 0) {
        batteryLevel += amount;
        if (batteryLevel > 100) batteryLevel = 100;
    }
}

int WirelessHeadphones::getBatteryLevel() const {
    return batteryLevel;
}


std::string WirelessHeadphones::getStatus() const {

    std::string baseStatus = Headphones::getStatus();
    return baseStatus + " | Battery: " + std::to_string(batteryLevel) + "%";
}
WirelessHeadphones:: ~WirelessHeadphones()
{
    std::cout << "~WirelessHeadphones()" << std::endl;
}
