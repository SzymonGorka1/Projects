//
// Created by szymo on 18.12.2021.
//
//
//#include "Fabryka.h"
//
//
//template<typename T>
//void Fabryka<T>::put(const T &_auto) {
//    pojazd.push_back(_auto);
//}
//
//template<typename T>
//void Fabryka<T>::dodaj() {
//    try{
//        T sam;
//        std::cout << "Podaj marke model cene i przebieg\n";
//        std::cin >> sam;
//        sam.ladownosc();
//        Fabryka::put(sam);
//    }
//    catch(std::logic_error &e){
//        std::cerr << "Error:" << e.what() << std::endl;
//    }
//}
//
//template<typename T>
//Fabryka<T>::~Fabryka() = default;
//
//template<typename T>
//void Fabryka<T>::usun() {
//    std::cout << "ktore auto chcesz kupic" << std::endl;
//    int nr;
//    std::cin >> nr;
//    try {
//        if (pojazd.size() < nr || nr < 0 ) throw  std::out_of_range("wyjscie poza zakres");
//        typename std::vector<T>::iterator it_sam;
//        it_sam = pojazd.begin();
//        pojazd.erase(it_sam + nr);
//    }catch (std::out_of_range &e){
//        std::cerr << "Error :" << e.what() << std::endl;
//    }
//}
//
//template<typename T>
//void Fabryka<T>::wypisanie() {
//    std::cout << "nr,marka,model,cena,przebieg,ilosc paliwa" << std::endl;
//    int it{};
//    for (const auto &i: pojazd) {
//        std::cout << it++ << ":" << i << std::endl;
//    }
//}
//
//template<typename T>
//void Fabryka<T>::jazda_probna() {
//    std::cout << "ktory samochod chcesz wyprobowac" << std::endl;
//    int nr{};
//    try {
//        if (pojazd.size() < nr || nr < 0 ) throw  std::out_of_range("wyjscie poza zakres");
//        std::cin >> nr;
//        pojazd[nr].T::jazda();
//    }catch (std::out_of_range &e){
//        std::cerr << "Error :" << e.what() << std::endl;
//    }
//
//}
//
//template<typename T>
//void Fabryka<T>::zapis() {
//    std::fstream plik;
//    plik.open("nazwa_pliku.txt", std::ios::in | std::ios::out | std::ios::trunc);
//    if (!plik.good()) {
//        std::cout << "Dostep do pliku zostal zabroniony!" << std::endl;
//    } else {
//        for (const auto &i: pojazd) plik << i << std::endl;
//        plik.close();
//    }
//}
//
//template<typename T>
//void Fabryka<T>::wypis() {
//    std::fstream plik;
//    plik.open("nazwa_pliku.txt", std::ios::in | std::ios::out);
//    if (!plik.good()) {
//        std::cout << "Dostep do pliku zostal zabroniony!" << std::endl;
//    } else {
//        T sam;
//        char *wiersz = new char;
//        do
//        {
//            plik >> sam;
//            Fabryka::put(sam);
//        }while(plik.getline(wiersz,100));
//        typename std::vector<T>::iterator it_sam;
//        it_sam = pojazd.end();
//        pojazd.erase(it_sam);
//        plik.close();
//    }
//}