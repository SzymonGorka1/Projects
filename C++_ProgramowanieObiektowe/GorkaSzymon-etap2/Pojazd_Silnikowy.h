//
// Created by szymo on 18.12.2021.
//

#ifndef GORKASZYMON_ETAP2_POJAZD_SILNIKOWY_H
#define GORKASZYMON_ETAP2_POJAZD_SILNIKOWY_H
#include "iostream"
#include "Pojazd.h"

class Pojazd_Silnikowy : protected Pojazd{
protected:
    int zbiornik_l{};
    enum zbiornik{pusty = 0, pelny = 30};
public:
    Pojazd_Silnikowy(const char *marka, const char *model, int cena);
    Pojazd_Silnikowy(const char *marka, const char *model, int cena, int przebieg);
    Pojazd_Silnikowy();
    void jazda() override;
    void tankowanie();
    Pojazd_Silnikowy & operator=(const Pojazd_Silnikowy& poj) ;
    friend std::ostream& operator<<(std::ostream& os, const Pojazd_Silnikowy& dt);
    int pokaz_przebieg ();
    char* jaka_marka();


    char *jaki_model();

    int jaka_cena();
};


#endif //GORKASZYMON_ETAP2_POJAZD_SILNIKOWY_H
