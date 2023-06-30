//
// Created by szymo on 18.12.2021.
//

#ifndef GORKASZYMON_ETAP2_KOMIS_H
#define GORKASZYMON_ETAP2_KOMIS_H


#include <vector>
#include <iostream>
#include "string"
#include "Samochod.h"
#include "Pojazd_Silnikowy.h"
#include "Lakiernik.h"
class Komis {

    std::vector<Pojazd_Silnikowy> _pojazd;
public:
    void dodaj();
    void usun();
    void wypisanie();
    };


#endif //GORKASZYMON_ETAP2_KOMIS_H