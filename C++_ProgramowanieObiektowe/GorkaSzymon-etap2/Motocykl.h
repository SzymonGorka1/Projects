//
// Created by szymo on 18.12.2021.
//

#ifndef GORKASZYMON_ETAP2_MOTOCYKL_H
#define GORKASZYMON_ETAP2_MOTOCYKL_H
#include "Pojazd_Silnikowy.h"

class Motocykl final : public Pojazd_Silnikowy{
private:
    enum poj_bag_marka{kawasaki = 150, yamaha = 0, honda = 100, romet = 50};
public:
    Motocykl(const char *marka, const char *model, int cena) ;
    Motocykl(const std::string &marka, const std::string &model, int cena);
    void ladownosc();
    ~Motocykl();
    Motocykl();
    friend std::ostream& operator<<(std::ostream& os, const Motocykl& dt);
    friend std::istream & operator>>(std::istream & strumien_we, Motocykl& zt);
};


#endif //GORKASZYMON_ETAP2_MOTOCYKL_H
