//
// Created by sviatnobara on 18.04.26.
//

#include "InEarHeadphones.h"
#include <iostream>

using namespace std;


InEarHeadphones::InEarHeadphones(string modelName, EarTipSize size)
    : Headphones(modelName), tipSize(size) {

}

void InEarHeadphones::changeEarTips(EarTipSize newSize) {
    tipSize = newSize;
}

string InEarHeadphones::getTipSizeStr() const {
    switch (tipSize) {
        case etsSmall: return "Small";
        case etsMedium: return "Medium";
        case etsLarge: return "Large";
        default: return "Unknown";
    }
}

string InEarHeadphones::getFullStatus() const {

    return getStatus() + " | EarTips: " + getTipSizeStr();
}