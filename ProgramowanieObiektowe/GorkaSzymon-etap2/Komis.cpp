//
// Created by szymo on 18.12.2021.
//

#include "Komis.h"
#include "fstream"

void Komis::dodaj(){
    try{
        Samochod sam_pier;
        std::cout << "Podaj marke model cene i przebieg\n";
        int przebieg;
        std::cin >> sam_pier >> przebieg;
        Samochod sam(sam_pier.jaka_marka(), sam_pier.jaki_model(), sam_pier.jaka_cena(), przebieg);
        sam.ladownosc();

        bool lo;
        double cena;
        if          (std::string (sam.jaka_marka()) == "mercedes") {
            cena = 150000.0 / sam.pokaz_przebieg() * 3;
        }
        else if     (std::string (sam.jaka_marka()) == "izera")
        {
            cena = 1000000.0 / sam.pokaz_przebieg() * 3;
            Samochod sam_new(sam.jaka_marka(),sam.jaki_model(),sam.jaka_cena(), sam.pokaz_przebieg()/2 );
            sam = sam_new;
        }
        else if     (std::string (sam.jaka_marka()) == "lamborghini") {
            cena = 1500000.0 / sam.pokaz_przebieg() * 3;
        }
        else if     (std::string (sam.jaka_marka()) == "fiat") cena = 10000.0 / sam.pokaz_przebieg() * 3;
        else        cena = 100.0 / sam.pokaz_przebieg() * 3;


        std::cout << "obliczylismy ze mozemy odkupic samochod za: " << cena <<
                  "czy chcesz sprzedac pojazd? 1 - TAK , 2 - NIE" << std::endl;
        std::cin >> lo;
        if(lo){
            _pojazd.push_back(sam);
            std::cout << "Sprzedales samochod za:" << cena << std::endl;
        }else std::cout << "Tranzakcja odrzucona" << std::endl;

    }catch(std::logic_error &e) {
        std::cerr << "Error:" << e.what() << std::endl;
    }

}



void Komis::usun() {
    std::cout << "ktore auto chcesz kupic" << std::endl;
    int nr;
    std::cin >> nr;
    try {
        if (_pojazd.size() < nr || nr < 0 ) throw  std::out_of_range("wyjscie poza zakres");
        std::vector<Pojazd_Silnikowy>::iterator it_sam;
        it_sam = _pojazd.begin();
        _pojazd.erase(it_sam + nr);
    }catch (std::out_of_range &e){
        std::cerr << "Error :" << e.what() << std::endl;
    }
}

void Komis::wypisanie() {
    int it{};
    std::cout << "nr, marka, model, cena, przebieg, paliwo w zbiorniku" << std::endl;
    for ( const Pojazd_Silnikowy &i: _pojazd) {
       std::cout << it++ << " :"<<  i << std::endl;
    }
}





