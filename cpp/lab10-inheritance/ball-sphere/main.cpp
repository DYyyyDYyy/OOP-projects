// main.cpp
#include <iostream>
#include "Sphere.h"
#include "Ball.h"

int main()
{

    Sphere unitSphere;
    unitSphere.displayStatistics();

    Sphere mySphere(5.1);
    std::cout << "d = " << mySphere.getDiameter() << std::endl;
    std::cout << "************" << std::endl;
    mySphere.displayStatistics();

    std::cout << "=============" << std::endl;
    mySphere.setRadius(4.2);
    std::cout << "d = " << mySphere.getDiameter() << std::endl;
    mySphere.displayStatistics();
    std::cout << "----------" << std::endl;


    Ball myBall;
    myBall.resetBall(30.5, "My_Football");
    myBall.displayStatistics();

    std::cout << "1111111111111111111" << std::endl;


    Sphere* spherePtr1 = &mySphere;
    spherePtr1->displayStatistics();

    std::cout << "222222222222" << std::endl;

    Sphere* spherePtr2 = &myBall;
    spherePtr2->displayStatistics();
#ifdef _WIN32


    system("pause");
#endif
    return 0;
}