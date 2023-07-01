//
// Created by szymo on 18.12.2021.
//

#ifndef GORKASZYMON_ETAP2_SAMOCHOD_H
#define GORKASZYMON_ETAP2_SAMOCHOD_H
#include "Pojazd_Silnikowy.h"
#include "iostream"
#include <fstream>

class Samochod final : public Pojazd_Silnikowy{
private:
    enum poj_bag_marka{mercedes = 150, lamborghini = 0, fiat = 100, izera = 50};
public:
    Samochod(const char *marka, const char *model, int cena) ;
    Samochod(const std::string &marka, const std::string &model, int cena);
    Samochod(const char *string, const char *string1, int i, int i1);
    void ladownosc();
    ~Samochod();
    Samochod();
    friend std::ostream& operator<<(std::ostream& os, const Samochod& dt);
    friend std::istream & operator>>(std::istream & strumien_we, Samochod& zt);


};


#endif //GORKASZYMON_ETAP2_SAMOCHOD_H
