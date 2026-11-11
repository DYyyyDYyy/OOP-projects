//
// Created by sviatnobara on 03.05.26.
//

#pragma once
#include "Instrument.h"

class Guitar : public Instrument
{
public:

    using Instrument::Instrument;

    Guitar() : m_strings(6)
    {
        std::cout << "  Guitar() default, strings = " << m_strings << "\n";
    }


    Guitar(const std::string& manufacturer, double price,
           const std::string& matName, double matDensity,
           int strings)
        : Instrument(manufacturer, price, matName, matDensity),
          m_strings(strings)
    {
        std::cout << "  Guitar(params), strings = " << strings << "\n";
    }


    Guitar(const Guitar& other)
        : Instrument(other), m_strings(other.m_strings)
    {
        std::cout << "  Guitar copy, strings = " << m_strings << "\n";
    }

    void display() const override
    {
        std::cout << "  Guitar: " << m_manufacturer
                  << ", " << m_price << " USD, "
                  << m_strings << " strings, material: "
                  << m_material.getName() << std::endl;
    }

private:
    int m_strings = 0;
};