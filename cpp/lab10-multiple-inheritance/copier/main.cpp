

#include <iostream>
using namespace std;



class PoweredDevice
{
public:
    PoweredDevice(int power)
    {
        cout << "  PoweredDevice(" << power << ")" << endl;
    }
    ~PoweredDevice()
    {
        cout << "  ~PoweredDevice()" << endl;
    }
    void printBase() const
    {
        cout << "  PoweredDevice::printBase()" << endl;
    }
};

class Scanner : public PoweredDevice
{
public:
    Scanner(int scanner, int power)
        : PoweredDevice(power)
    {
        cout << "  Scanner(" << scanner << ")" << endl;
    }
    ~Scanner()
    {
        cout << "  ~Scanner()" << endl;
    }
    void print() const
    {
        cout << "  Scanner::print()" << endl;
    }
};

class Printer : public PoweredDevice
{
public:
    Printer(int printer, int power)
        : PoweredDevice(power)
    {
        cout << "  Printer(" << printer << ")" << endl;
    }
    ~Printer()
    {
        cout << "  ~Printer()" << endl;
    }
    void print() const
    {
        cout << "  Printer::print()" << endl;
    }
};

class Copier : public Scanner, public Printer
{
public:
    Copier(int scanner, int printer, int power)
        : Scanner(scanner, power), Printer(printer, power)
    {
        cout << "  Copier()" << endl;
    }
    ~Copier()
    {
        cout << "  ~Copier()" << endl;
    }
};

void testMultipleInheritanceProblem()
{
    cout << "=== Створення об'єкта Copier (звичайне успадкування) ===" << endl;
    Copier copier(1, 2, 100);
    cout << "=== Знищення об'єкта Copier ===" << endl;

    cout << endl;
}



class PoweredDeviceVirtual
{
public:
    PoweredDeviceVirtual(int power)
    {
        cout << "  PoweredDeviceVirtual(" << power << ")" << endl;
    }
    virtual ~PoweredDeviceVirtual()
    {
        cout << "  ~PoweredDeviceVirtual()" << endl;
    }
    void printBase() const
    {
        cout << "  PoweredDeviceVirtual::printBase()" << endl;
    }
};

class ScannerVirtual : virtual public PoweredDeviceVirtual
{
public:
    ScannerVirtual(int scanner, int power)
        : PoweredDeviceVirtual(power)
    {
        cout << "  ScannerVirtual(" << scanner << ")" << endl;
    }
    ~ScannerVirtual()
    {
        cout << "  ~ScannerVirtual()" << endl;
    }
    void print() const
    {
        cout << "  ScannerVirtual::print()" << endl;
    }
};

class PrinterVirtual : virtual public PoweredDeviceVirtual
{
public:
    PrinterVirtual(int printer, int power)
        : PoweredDeviceVirtual(power)
    {
        cout << "  PrinterVirtual(" << printer << ")" << endl;
    }
    ~PrinterVirtual()
    {
        cout << "  ~PrinterVirtual()" << endl;
    }
    void print() const
    {
        cout << "  PrinterVirtual::print()" << endl;
    }
};

class CopierVirtual : public ScannerVirtual, public PrinterVirtual
{
public:

    CopierVirtual(int scanner, int printer, int power)
        : PoweredDeviceVirtual(power),
          ScannerVirtual(scanner, power),
          PrinterVirtual(printer, power)
    {
        cout << "  CopierVirtual()" << endl;
    }
    ~CopierVirtual()
    {
        cout << "  ~CopierVirtual()" << endl;
    }


    void callPrintBase() const
    {
        printBase();
    }
};

void testVirtualInheritanceSolution()
{
    cout << "=== Створення об'єкта CopierVirtual (віртуальне успадкування) ===" << endl;
    CopierVirtual copier(1, 2, 100);
    cout << "=== Виклик методів ===" << endl;
    copier.ScannerVirtual::print();
    copier.PrinterVirtual::print();
    copier.callPrintBase();
    cout << "=== Знищення об'єкта CopierVirtual ===" << endl;
    cout << endl;
}


class Device
{
public:
    Device(int id) : id(id) {}
    virtual ~Device() {}
    virtual void operate() const = 0;
    int getId() const { return id; }
protected:
    int id;
};

class ScannerDevice : virtual public Device
{
public:
    ScannerDevice(int id) : Device(id) {}
    void operate() const override
    {
        cout << "  ScannerDevice (id=" << id << ") scanning..." << endl;
    }
};

class PrinterDevice : virtual public Device
{
public:
    PrinterDevice(int id) : Device(id) {}
    void operate() const override
    {
        cout << "  PrinterDevice (id=" << id << ") printing..." << endl;
    }
};

class MultifunctionDevice : public ScannerDevice, public PrinterDevice
{
public:
    MultifunctionDevice(int scanId, int printId)
        : Device(0),
          ScannerDevice(scanId),
          PrinterDevice(printId) 
    {

    }
    void operate() const override
    {
        cout << "  MultifunctionDevice operating:" << endl;
        ScannerDevice::operate();
        PrinterDevice::operate();
    }
};

void testVirtualMethods()
{
    cout << "=== Поліморфізм з віртуальним успадкуванням ===" << endl;
    MultifunctionDevice mfd(10, 20);
    Device& dev = mfd;
    dev.operate();
    cout << endl;
}


int main()
{

    testMultipleInheritanceProblem();


    testVirtualInheritanceSolution();


    testVirtualMethods();

    return 0;
}