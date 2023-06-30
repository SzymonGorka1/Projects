//
// Created by szymo on 18.12.2021.
//

#include "Pojazd.h"

Pojazd::Pojazd(const char *marka,const char *model, int cena) : marka(const_cast<char *>(marka)), model(
        const_cast<char *>(model)), cena(cena), przebieg(nowy), stan(nowy), ladownosc_pojazdu(nowy), lakier{0, 0, 0} {
}
Pojazd::Pojazd(const char *marka, const char *model, int cena, int przebieg) : marka(const_cast<char *>(marka)), model(
        const_cast<char *>(model)), cena(cena), przebieg(przebieg), stan(nowy), ladownosc_pojazdu(nowy), lakier{0, 0, 0}{
}



void Pojazd::copyString(const char *src, char **dst){
    if (src) {
        delete *dst;
        *dst = new char[strlen(src) + 1] {};
        strcpy(*dst, src);
    }
    else {
        *dst = nullptr;
    }
}

Pojazd & Pojazd::operator=(const Pojazd &poj){
    if(&poj != this){
        marka = new char;
        model = new char;
        copyString(poj.marka, &this->marka);
        copyString(poj.model, &this->model);
        cena = poj.cena;
        przebieg = poj.przebieg;
        stan = poj.stan;
        for (int i = 0; i < 3; i++) lakier[i] = poj.lakier[i];
        ladownosc_pojazdu = poj.ladownosc_pojazdu;
    }
    return *this;
}



Pojazd::Pojazd() = default;
