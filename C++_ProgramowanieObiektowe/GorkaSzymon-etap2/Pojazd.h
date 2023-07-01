//
// Created by szymo on 18.12.2021.
//

#ifndef GORKASZYMON_ETAP2_POJAZD_H
#define GORKASZYMON_ETAP2_POJAZD_H
#include "string"
#include <cstring>
class Pojazd {
protected:
    int cena{};
    char *marka{nullptr};
    char *model{nullptr};
    int przebieg{};
    int ladownosc_pojazdu{};
    bool stan{};
    enum czy_uzywany{uzywany = 1, nowy = 0};
public:
    static void copyString(const char *src, char **dst);
    virtual void jazda() = 0;
    Pojazd(const char *marka, const char *model, int cena);
    Pojazd(const char *marka, const char *model, int cena, int przebieg);
    Pojazd();
    Pojazd & operator=(const Pojazd& poj) ;


    int lakier[3]{};
};


#endif //GORKASZYMON_ETAP2_POJAZD_H
