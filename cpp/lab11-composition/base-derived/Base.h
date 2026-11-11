//
// Created by sviatnobara on 03.05.26.
//

#pragma once
#include <iostream>

class Base
{
public:
    Base()
    {
        std::cout << "Base()" << std::endl;
    }

    Base(const Base& other)
    {
        std::cout << "Base(Base&)" << std::endl;
    }

    explicit Base(int i) : num(i)
    {
        std::cout << "Base(int)" << std::endl;
    }

    explicit Base(char c) : letter(c)
    {
        std::cout << "Base(char)" << std::endl;
    }

private:
    int num{};
    char letter{};
};