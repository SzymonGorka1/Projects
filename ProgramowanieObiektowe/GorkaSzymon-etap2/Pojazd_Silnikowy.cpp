//
// Created by szymo on 18.12.2021.
//

#include "Pojazd_Silnikowy.h"

Pojazd_Silnikowy::Pojazd_Silnikowy(const char *marka, const char *model, int cena) : Pojazd(marka, model, cena),
                                                                                            zbiornik_l(pusty){}


Pojazd_Silnikowy::Pojazd_Silnikowy(const char *marka, const char *model, int cena, int przebieg) : Pojazd(marka, model,
                                                                                                      cena, przebieg),
                                                                                                      zbiornik_l(pusty) {

}


Pojazd_Silnikowy::Pojazd_Silnikowy() = default;

void Pojazd_Silnikowy::jazda (){
    if(!stan) stan = uzywany;
    if (zbiornik_l == 0) tankowanie();
    przebieg = przebieg + 10;
    zbiornik_l = zbiornik_l - 1;
}

void Pojazd_Silnikowy::tankowanie (){
    zbiornik_l = pelny;
}

Pojazd_Silnikowy & Pojazd_Silnikowy::operator=(const Pojazd_Silnikowy &poj){
    if(&poj != this){
    Pojazd::operator=(poj);
    zbiornik_l = poj.zbiornik_l;
    }
    return *this;
}

std::ostream& operator<<(std::ostream& os, const Pojazd_Silnikowy& dt){
    os << dt.marka << ' ' << dt.model << ' ' << dt.cena <<  ' ' << dt.przebieg << ' ' << dt.zbiornik_l;
    return os;
}

int Pojazd_Silnikowy::pokaz_przebieg() {
    return przebieg;
}

char* Pojazd_Silnikowy::jaka_marka() {
    return marka;
}

char* Pojazd_Silnikowy::jaki_model() {
    return model;
}

int Pojazd_Silnikowy::jaka_cena(){
    return cena;
}




