//
// Created by szymo on 18.12.2021.
//

#include "Motocykl.h"
#include <iostream>
#include <string>

Motocykl::Motocykl(const char *marka, const char *model, int cena) : Pojazd_Silnikowy(marka, model, cena) {
    copyString(marka, &this->marka);
    copyString(model, &this->model);
    ladownosc();
}
Motocykl::Motocykl(const std::string &marka, const std::string &model, int cena) : Motocykl(marka.c_str(),
                                                                                            model.c_str(),
                                                                                            cena){}

void Motocykl::ladownosc(){
    if (std::string(marka) == "kawasaki") ladownosc_pojazdu = kawasaki;
    else if (std::string(marka) == "yamacha") ladownosc_pojazdu = yamaha;
    else if (std::string(marka) == "honda") ladownosc_pojazdu = honda;
    else if (std::string(marka) == "romet") ladownosc_pojazdu = romet;
    else{
        std::cout << "Podano obca marke, podaj pojemnosc bagaznika:" << std::endl;
        int poj{};
        std::cin >> poj;
        ladownosc_pojazdu = poj;
    }
}

Motocykl::~Motocykl()= default;
Motocykl::Motocykl() = default;

std::ostream& operator<<(std::ostream& os, const Motocykl& dt){
    os << dt.marka << ' ' << dt.model << ' ' << dt.cena <<  ' ' << dt.przebieg << ' ' << dt.zbiornik_l;
    return os;
}

std::istream & operator>>(std::istream & is, Motocykl &zt){
    std::cout << "dostepne marki:\nkawasaki\nyamaha\nhonda\nromet" <<std::endl;
    zt.marka = new char;
    zt.model = new char;
    is >> zt.marka >> zt.model >> zt.cena >> zt.przebieg;
    std::cin.clear();
    if (zt.cena < 0 || zt.przebieg < 0){
        throw std::logic_error("cena i przbieg nie moga byc mniejsze od 0");
    }
    return is;
}
