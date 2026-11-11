//
// Created by sviatnobara on 03.05.26.
//

#pragma once
#include <iostream>
#include <string>
#include "Material.h"

class Instrument
{
public:

    Instrument() : m_manufacturer("Unknown"), m_price(0.0)
    {
        std::cout << "  Instrument() default\n";
    }


    Instrument(const std::string& manufacturer, double price,
               const std::string& matName, double matDensity)
        : m_material(matName, matDensity),
          m_manufacturer(manufacturer),
          m_price(price)
    {
        std::cout << "  Instrument(" << manufacturer << ", " << price << ")\n";
    }


    Instrument(const Instrument& other)
        : m_material(other.m_material),
          m_manufacturer(other.m_manufacturer),
          m_price(other.m_price)
    {
        std::cout << "  Instrument copy\n";
    }

    virtual ~Instrument() { }

    virtual void display() const
    {
        std::cout << "  Instrument: " << m_manufacturer
                  << ", " << m_price << " USD, material: "
                  << m_material.getName() << std::endl;
    }

protected:
    Material m_material;
    std::string m_manufacturer;
    double m_price;
};