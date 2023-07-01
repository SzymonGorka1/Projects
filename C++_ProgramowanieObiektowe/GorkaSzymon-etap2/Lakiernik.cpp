//
// Created by szymo on 18.12.2021.
//


#include "Lakiernik.h"

void Lakiernik::malowanie(Pojazd &_pojazd){
    std::cout << "Na jaki kolor pomalowac R,G,B" << std::endl;
    std::cout << "R :" << std::endl;
    std::cin >> _pojazd.lakier[0];
    std::cout << "G :" << std::endl;
    std::cin >> _pojazd.lakier[1];
    std::cout << "B :" << std::endl;
    std::cin >> _pojazd.lakier[2];
}

