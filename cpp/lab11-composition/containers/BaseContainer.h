//
// Created by sviatnobara on 03.05.26.
//

#pragma once
#include <iostream>
#include "Contained1.h"
#include "Contained2.h"

class BaseContainer
{
public:
    BaseContainer()
    {
        std::cout << " BaseContainer ctor\n";
    }
private:
    Contained1 c1;
    Contained2 c2;
};