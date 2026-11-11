//
// Created by sviatnobara on 03.05.26.
//

#pragma once
#include "Base.h"

class Derived : private Base
{
public:
    using Base::Base;
private:
    int newMember{ 0 };
};