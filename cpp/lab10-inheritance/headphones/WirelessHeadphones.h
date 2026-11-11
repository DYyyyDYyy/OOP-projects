#pragma once
#include "Headphones.h"
#include <string>

class WirelessHeadphones : public Headphones {
private:
    int batteryLevel;

public:

    explicit WirelessHeadphones(std::string modelName, int initialBattery = 100);

    ~WirelessHeadphones();
    void charge(int amount);


    int getBatteryLevel() const;



    std::string getStatus() const;
};