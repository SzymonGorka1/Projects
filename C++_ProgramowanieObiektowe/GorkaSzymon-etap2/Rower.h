//
// Created by szymo on 18.12.2021.
//

#ifndef GORKASZYMON_ETAP2_ROWER_H
#define GORKASZYMON_ETAP2_ROWER_H
#include "Pojazd.h"

class Rower final : public Pojazd{
private:
    bool czy_koszyk{};
    enum kosz{ brak_koszyka = 0, max_pojemnosc = 15};
public:
    Rower(const char *marka, const char *model, int cena) ;
    Rower(const std::string &marka, const std::string &model, int cena);
    void jazda() override;
    ~Rower();
    Rower();
    void ladownosc();
    friend std::ostream& operator<<(std::ostream& os, const Rower& dt);
    friend std::istream & operator>>(std::istream & strumien_we, Rower& zt);
};


#endif //GORKASZYMON_ETAP2_ROWER_H
