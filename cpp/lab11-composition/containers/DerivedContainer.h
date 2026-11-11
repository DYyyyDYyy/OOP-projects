//
// Created by sviatnobara on 03.05.26.
//

#pragma once
#include <iostream>
#include "BaseContainer.h"
#include "Contained3.h"

class DerivedContainer : public BaseContainer
{
public:
    DerivedContainer() : BaseContainer()
    {
        std::cout << " DerivedContainer ctor\n";
    }
private:
    Contained3 c3;
};