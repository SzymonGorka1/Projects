//
// Created by szymo on 18.12.2021.
//

#include "Samochod.h"
#include <iostream>
#include <string>



Samochod::Samochod(const char *marka, const char *model, int cena) : Pojazd_Silnikowy(marka, model, cena) {
    copyString(marka, &this->marka);
    copyString(model, &this->model);
    ladownosc();
}

Samochod::Samochod(const char *string, const char *string1, int i, int i1) : Pojazd_Silnikowy(string, string1, i, i1){
    ladownosc();
}

Samochod::Samochod(const std::string &marka, const std::string &model, int cena) : Samochod(marka.c_str(),
                                                                                            model.c_str(),
                                                                                            cena){}

void Samochod::ladownosc(){
    if      (std::string(marka) == "mercedes") ladownosc_pojazdu = mercedes;
    else if (std::string(marka) == "lamborghini") ladownosc_pojazdu = lamborghini;
    else if (std::string(marka) == "izera") ladownosc_pojazdu = izera;
    else if (std::string(marka) == "fiat") ladownosc_pojazdu = fiat;
    else{
        std::cout << "Podano obca marke, podaj pojemnosc bagaznika:" << std::endl;
        int poj{};
        std::cin >> poj;
        ladownosc_pojazdu = poj;
    }
}


Samochod::~Samochod()= default;
Samochod::Samochod() = default;

std::ostream& operator<<(std::ostream& os, const Samochod& dt){
    os << dt.marka << ' ' << dt.model << ' ' << dt.cena <<  ' ' << dt.przebieg << ' ' << dt.zbiornik_l;
    return os;
}

std::istream & operator>>(std::istream & is, Samochod &zt){
    std::cout << "dostepne marki:\nmercedes\nizera\nfiat\nlamborghini" <<std::endl;
    zt.marka = new char;
    zt.model = new char;
    is >> zt.marka >> zt.model >> zt.cena;
    std::cin.clear();

    if (zt.cena < 0){
        throw std::logic_error("cena nie moze byc mniejsza od 0");
    }
    return is;
}







