#include <iostream>
#include "Motocykl.h"
#include "Rower.h"
#include "Fabryka.h"
#include "Komis.h"
#include <cstdlib>

int main(int argc, char *argv[]) {
    Fabryka<Samochod> samochod;
    Fabryka<Motocykl> motocykl;
    Fabryka<Rower> rower;
    Komis komis;
    std::cout << "Witamy w fabryce samochodow" << std::endl;
    int choice {};
    int pojazd = 1;
    std::fstream plik;
    char *nazwa;
    nazwa = new char;

    if (argc > 1){
        plik.open( argv[1], std::ios::in | std::ios::out);
        if(!plik.good()) {
            std::cout << "Dostep do pliku zostal zabroniony!" << std::endl;
        }
    }

    do {
        if (plik.good() && argc > 1){
            plik >> nazwa;
            choice = atoi(nazwa);
            nazwa[0] = 0;
            if (1 > choice || choice > 12){
                choice = 999;
            }
        }else {
            choice = {};
            std::cout << "\n---====== MENU =====---\n"
                         "1:  Jazda probna (nr)\n" // pozwala na jazde probna
                         "2:  Sprzedaz pojazdu (nr)\n" // sprzedaje samochod (usuwa z kalsy)
                         "3:  Stworzenie nowego pojazdu\n" // tworzy nowy samochod o wskazanych parametrach
                         "4:  Wypisanie dostepnych pojazdu\n" // pokazuje wszystkei samochody
                         "5:  Zapisywnie wartosci do pliku\n" //zapisuje do pliku
                         "6:  Wczytanie z pliku\n" // wczytuje z pliku do programu
                         "7:  Zakup samochodu z komisu (nr)\n" // usuwa samochod
                         "8:  Odkupienie samochodu po cenie wyliczonej przez komis\n" // tworzy nowy samochod
                                                                                      // o wskazanych parametrach
                         "9:  Wypisanie dostepnych samochodow\n" // pokazuje wszystkei samochody
                         "10: Zamiana rodzaju fabryki\n"
                         "11: Zakoncz proces\n" // zakonczenie produkcji

                         "Wybierz akcje: " << std::endl;
           while (choice>11 || choice < 1) {
               std::cin >> choice;
               if( !std::cin ){
                   std::cin.clear();
                   std::cin.sync();
                   std::cout << "Prosze podac liczbe z zadanego zakresu" << std::endl;
               }}}
        switch (choice) {

            case 1:
                if (pojazd == 1) samochod.jazda_probna();
                else if (pojazd == 2) motocykl.jazda_probna();
                else rower.jazda_probna();
                break;
            case 2:
                if (pojazd == 1) samochod.usun();
                else if (pojazd == 2) motocykl.usun();
                else rower.usun();
                break;
            case 3:
                if (pojazd == 1) samochod.dodaj();
                else if (pojazd == 2) motocykl.dodaj();
                else rower.dodaj();
                break;
            case 4:
                if (pojazd == 1) samochod.wypisanie();
                else if (pojazd == 2) motocykl.wypisanie();
                else rower.wypisanie();
                break;
            case 5:
                if (pojazd == 1) samochod.zapis();
                else if (pojazd == 2) motocykl.zapis();
                else rower.zapis();
                break;
            case 6:
                if (pojazd == 1) samochod.wypis();
                else if (pojazd == 2) motocykl.wypis();
                else rower.wypis();
                break;
            case 7:
                komis.usun();
                break;
            case 8:
                komis.dodaj();
                break;
            case 9:
                komis.wypisanie();
                break;
            case 10:
                pojazd = 0;
                while(pojazd < 1 || pojazd > 3){
                    std::cout << "Wybierz rodzaj fabryki 1:Samochodowa 2:Motocyklowa 3:Rowerowa" << std::endl;
                    std::cin >> pojazd;
                }
                break;
            case 11:
                plik.close();
                return 0;
            default:
                std::cout << "Niepoprawny wybor" << std::endl;
        }
    }while (true);
} //end





