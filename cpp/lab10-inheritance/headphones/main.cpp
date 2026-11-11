#include <iostream>
#include "Headphones.h"
#include "InEarHeadphones.h"
#include "WirelessHeadphones.h"

using namespace std;

int main() {
    cout << "=== Testing Base Class ===" << endl;
    // {
    //     Headphones basic("Sony WH-1000XM4");
    //     cout << basic.getStatus() << endl;
    //     basic.toggleConnection();
    //     basic.changeVolume(15);
    //     cout << basic.getStatus() << endl;
    // }

    // cout << "\n=== Testing InEarHeadphones (from Lab 9) ===" << endl;
    // InEarHeadphones buds("AirPods Pro", etsMedium);
    // buds.toggleConnection();
    // buds.changeVolume(-5);
    // cout << buds.getFullStatus() << endl;
    //
    // cout << "\n=== Testing WirelessHeadphones (NEW derived class) ===" << endl;
    // WirelessHeadphones wireless("JBL Tune 760NC", 65);
    //
    // wireless.toggleConnection();
    // wireless.changeVolume(30);
    // wireless.charge(20);
    // cout << "After actions: " << wireless.getStatus() << endl;

        Headphones* ptr = new WirelessHeadphones("JBL Tune 760NC", 65);
        cout << "Via Headphones pointer: " << ptr->getStatus() << endl;


    return 0;
}