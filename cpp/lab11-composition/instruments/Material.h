//
// Created by sviatnobara on 03.05.26.
//

#pragma once
#include <iostream>
#include <string>

class Material
{
public:

    Material() : m_name("Wood"), m_density(0.8)
    {
        std::cout << "  Material() default -> " << m_name << "\n";
    }


    Material(const std::string& name, double density)
        : m_name(name), m_density(density)
    {
        std::cout << "  Material(\"" << m_name << "\", " << m_density << ")\n";
    }


    Material(const Material& other)
        : m_name(other.m_name), m_density(other.m_density)
    {
        std::cout << "  Material copy -> \"" << m_name << "\"\n";
    }

    const std::string& getName() const { return m_name; }

private:
    std::string m_name;
    double m_density;
};