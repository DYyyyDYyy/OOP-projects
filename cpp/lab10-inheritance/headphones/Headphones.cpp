//
// Created by sviatnobara on 18.04.26.
//

#include "Headphones.h"
#include <iostream>

using namespace std;

Headphones::Headphones(string modelName) : model(modelName), volume(50), isConnected(false) {

    cout << modelName << "Base" << endl;
}

void Headphones::toggleConnection() {
    isConnected = !isConnected;
}

void Headphones::changeVolume(int delta) {
    if (isConnected) {
        volume += delta;
        if (volume > 100) volume = 100;
        if (volume < 0) volume = 0;
    }
}

string Headphones::getStatus() const {
    string stateStr = isConnected ? "Connected" : "Disconnected";
    return "Model: " + model + " | Status: " + stateStr + " | Volume: " + to_string(volume) + "%";
}
Headphones::~Headphones()
{
    std::cout << "Destroying " << model << std::endl;
}