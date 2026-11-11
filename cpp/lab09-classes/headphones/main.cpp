#include <iostream>
#include "Headphones.h"
#include "InEarHeadphones.h"

using namespace std;

int main() {
    cout << "Testing Base Class " << endl;
    {
        Headphones basicPhones("Sony WH-1000XM4");
        cout << basicPhones.getStatus() << endl;

        basicPhones.toggleConnection();
        basicPhones.changeVolume(20);
        cout << basicPhones.getStatus() << endl;
    }
    cout << "\nTesting Derived Class" << endl;
    InEarHeadphones airpods("AirPods Pro", etsMedium);
    Headphones testHeadphones("Baseus m1");

    cout << airpods.getFullStatus() << endl;

    airpods.toggleConnection();
    airpods.changeEarTips(etsSmall);
    airpods.changeVolume(-10);
    cout << airpods.getFullStatus() << endl;

    return 0;
}