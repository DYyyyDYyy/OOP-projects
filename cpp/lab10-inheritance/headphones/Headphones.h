//
// Created by sviatnobara on 18.04.26.
//
#pragma once
#include <string>

class Headphones {
protected:
    std::string model;
    int volume;
    bool isConnected;

public:
    Headphones(std::string modelName);

    void toggleConnection();
    void changeVolume(int delta);
    std::string getStatus() const;
    ~Headphones();
};