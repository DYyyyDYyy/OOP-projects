// main.cpp
#include <iostream>
#include "queen_nonvirtual.h"
#include "queen_virtual.h"

using namespace std;

void demonstrateDiamondProblem() {
    cout << "=== Спроба створити QueenNonVirtual (без virtual) ===" << endl;
    QueenNonVirtual queen("white", "d1");
    cout << "  Спроба звернутися до queen.getColor() без уточнення неможлива." << endl;
    cout << "  Доводиться уточнювати: " << queen.Rook::getColor() << endl;
    cout << "  Конструктор ChessPiece викликався двічі (два підоб'єкти ChessPiece)." << endl;
    cout << "=== Знищення QueenNonVirtual ===" << endl;
}

void demonstrateVirtualSolution() {
    cout << "\n=== Створення QueenV (з virtual) ===" << endl;
    QueenV queen("black", "d8");
    cout << "  getColor(): " << queen.getColor() << endl;
    queen.move("h4");

    cout << "\n=== Поліморфізм: вказівник на ChessPieceV ===" << endl;
    ChessPieceV* pPiece = new QueenV("white", "d1");
    pPiece->move("a4");
    cout << "  Колір через базовий вказівник: " << pPiece->getColor() << endl;

    cout << "\n=== Коректне знищення через вказівник на базу ===" << endl;
    delete pPiece;
    cout << "\n=== Знищення локального QueenV (кінець функції) ===" << endl;
}

int main() {
    demonstrateDiamondProblem();
    demonstrateVirtualSolution();
    return 0;
}