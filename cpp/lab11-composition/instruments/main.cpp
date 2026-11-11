#include <iostream>
#include "Guitar.h"

int main()
{
    std::cout << "===== 1. Default constructor =====" << std::endl;
    Guitar g1;
    g1.display();

    std::cout << "\n===== 2. Parameterized constructor (inherited via using) =====" << std::endl;

    Guitar g2("Fender", 1200.0, "Alder", 0.6);
    g2.display();

    std::cout << "\n===== 3. Copy constructor =====" << std::endl;
    Guitar g3 = g2;
    g3.display();

    std::cout << "\n===== 4. Parameterized constructor with all fields =====" << std::endl;
    Guitar g4("Yamaha", 800.0, "Spruce", 0.45, 12);
    g4.display();

    std::cout << "\n===== 5. Dynamic object and polymorphism =====" << std::endl;
    Instrument* ptr = new Guitar("Gibson", 2500.0, "Mahogany", 0.75, 6);
    ptr->display();
    delete ptr;
#ifdef _WIN32

    system("pause");
#endif
    return 0;
}