# OOP-projects

[![ci](https://github.com/DYyyyDYyy/OOP-projects/actions/workflows/ci.yml/badge.svg)](https://github.com/DYyyyDYyy/OOP-projects/actions/workflows/ci.yml)

Labs from the Object-Oriented Programming course (Ivan Franko National University of Lviv, spring 2026). The first half is in **Object Pascal** (Free Pascal / Lazarus, mostly small GUI apps), the second half in **C++20**. Several class hierarchies (headphones, balls and spheres, chess pieces) are written in both languages, so the same idea can be compared side by side.

Comments and UI text are in Ukrainian.

## Object Pascal (Lazarus)

| Lab | Topic | What is in it |
|---|---|---|
| [lab01-signal-generator](pascal/lab01-signal-generator) | first GUI app | square, sawtooth and other periodic signals plotted on a form |
| [lab02-classes-and-inheritance](pascal/lab02-classes-and-inheritance) | classes, inheritance | `TBall` → `TSphere`, `THeadphones` → `TInEarHeadphones` in separate units |
| [lab04-constructor-overloading](pascal/lab04-constructor-overloading) | overloaded constructors | `TRectang`, `TTriangle` created from different argument sets |
| [lab04-abstract-classes](pascal/lab04-abstract-classes) | abstract methods | `TField` → `TStringField` / `TIntegerField`; game entities `TWarrior`, `TMage`, `TArcher` |
| [lab05-aggregation](pascal/lab05-aggregation) | aggregation vs inheritance | a chess match that owns a clock and two players; the same model built by inheritance |
| [lab06-virtual-methods](pascal/lab06-virtual-methods) | virtual methods, polymorphism | game objects and characters called through base-class references |
| [lab07-rtti-is-as](pascal/lab07-rtti-is-as) | RTTI | `is` and `as` on `TFruit`/`TAnimal` hierarchies and on `Sender` in event handlers |

## C++

| Lab | Topic | What is in it |
|---|---|---|
| [lab09-classes](cpp/lab09-classes) | classes, encapsulation | `Sphere`, `Headphones` with header/source split |
| [lab10-inheritance](cpp/lab10-inheritance) | single inheritance | `Ball` → `Sphere` → `MassBall`; headphones hierarchy |
| [lab10-multiple-inheritance](cpp/lab10-multiple-inheritance) | multiple inheritance, virtual functions | `Copier : Scanner, Printer` (the diamond and constructor order); chess pieces with and without `virtual`, to show static vs dynamic dispatch |
| [lab11-composition](cpp/lab11-composition) | composition | a container class that owns three member objects (construction/destruction order); `Guitar` built from `Material` |
| [lab14-dll](cpp/lab14-dll) | dynamic libraries | a math DLL and a maintenance DLL with `__declspec(dllexport)`, used by two apps (Windows only) |

## Build

```bash
./build.sh                       # every portable C++ lab: configure, build, run
lazbuild pascal/lab06-virtual-methods/Game_Virtual/Game_Virtual.lpi   # one Lazarus project
```

CI builds and runs all C++ labs except the Windows DLLs, and builds all 18 Lazarus projects with `lazbuild` on Ubuntu.
