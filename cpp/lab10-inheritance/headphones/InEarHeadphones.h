//
// Created by sviatnobara on 18.04.26.
//

#pragma once
#include "Headphones.h"
#include <string>


enum EarTipSize { etsSmall, etsMedium, etsLarge };


class InEarHeadphones : public Headphones {
private:
    EarTipSize tipSize;

public:
    InEarHeadphones(std::string modelName, EarTipSize size);

    void changeEarTips(EarTipSize newSize);
    std::string getTipSizeStr() const;
    std::string getFullStatus() const;
};