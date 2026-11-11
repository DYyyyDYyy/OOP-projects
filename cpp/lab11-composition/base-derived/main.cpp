#include <iostream>
#include "Derived.h"

int main()
{
    std::cout << "Derived d1(5) calls: ";
    Derived d1(5);

    std::cout << "Derived d2('c') calls: ";
    Derived d2('c');

    std::cout << "Derived d3 = d2 calls: ";
    Derived d3 = d2;

    std::cout << "Derived d4 calls: ";
    Derived d4;
#ifdef _WIN32

    system("pause");
#endif
    return 0;
}