#include <iostream>
#include "Sphere.h"

using namespace std;

int main() {
    Sphere unitSphere;
    Sphere mySphere(5.1);

    unitSphere.displayStatistics();

    mySphere.setRadius(4.2);
    cout << "d=" << mySphere.getDiameter() << endl;

    return 0;
}