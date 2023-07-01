//
// Created by szymo on 18.12.2021.
//

#include "Rower.h"
#include "iostream"


    Rower::Rower(const char *marka, const char *model, int cena) : Pojazd(marka, model, cena) {
        copyString(marka, &this->marka);
        copyString(model, &this->model);
        ladownosc();
    }

    Rower::Rower(const std::string &marka, const std::string &model, int cena) : Rower(marka.c_str(),
                                                                                                model.c_str(),
                                                                                                cena){}


void Rower::jazda() {
    std::cout << "w sumie nic się nie dzieje, nogi rosna" << std::endl;
    if(!stan) stan = uzywany;
    przebieg += 13;
}

    Rower::~Rower()= default;
    Rower::Rower() = default;

    std::ostream& operator<<(std::ostream& os, const Rower& dt){
        os << dt.marka << ' ' << dt.model << ' ' << dt.cena <<  ' ' << dt.przebieg;
        return os;
    }

    std::istream & operator>>(std::istream & is, Rower &zt){
        zt.marka = new char;
        zt.model = new char;
        is >> zt.marka >> zt.model >> zt.cena >> zt.przebieg;
        std::cin.clear();
        if (zt.cena < 0 || zt.przebieg < 0){
            throw std::logic_error("cena i przbieg nie moga byc mniejsze od 0");
        }
        return is;
    }

void Rower::ladownosc() {
    std::cout << "czy rower posiada koszyk 0:1?" << std::endl;
    bool zm;
    std::cin >> zm;
    if(zm)
    {
        czy_koszyk = zm;
        ladownosc_pojazdu = max_pojemnosc;
    } else{
        ladownosc_pojazdu = brak_koszyka;
    }
}


