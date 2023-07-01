daily_ice_edge <- read.csv("C:/semestr_4/modelowanie/Projekt_zaliczeniowy/daily_ice_edge.csv")
ilosc_dni_w_gif = 1000
daily_ice_edge_skrocony = daily_ice_edge[c(seq(1, nrow(daily_ice_edge), length = ilosc_dni_w_gif)),]

install.packages('ggplot2')
install.packages('dplyr')
install.packages('gapminder')
install.packages('gganimate')
install.packages('transformr')
install.packages('zoo')
library('ggplot2')
library('dplyr')
library('gapminder')
library('gganimate')
library('transformr')
library("zoo")
Sys.setlocale(locale = "English") #zmiana na angielsie daty


#-----------------------------------------------------------------------------
#wyznaczanie najmniejjszych wartosci dla wszystkich szerokosci geograficznych
war_min = 0
for (i in 2:ncol(daily_ice_edge)){
  war_min[i-1] = min(daily_ice_edge[,i])
  
}

#Generowanie obrazu dla minimalnych wartoœci szerokoœæi geograficznej
foo <- tibble(theta=war_min, r=unlist(seq(0,360,by=1)))
zmienna <- ggplot(foo,aes(y=theta,x=r))+
  geom_line()+
  coord_polar()+
  scale_y_continuous(limits=c(-90,-60),breaks=0)+
  scale_x_continuous(limits=c(0,360),breaks=seq(0,330,by=30))+
  geom_line(size = 1)+
  labs(title = 'Map of Antarctica',
       x = "",
       y = "")+
  
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(colour="red"))

#generoanie obrazu
zmienna

#------------------------------------------------------------------------------
#ile dni bedziemy urzywac w naszych gifach (przydatne w czasie pracy)
n = nrow(daily_ice_edge)


#zapis dnia jako liczby
first_day = as.Date(daily_ice_edge[ 1,1 ], format = "%d-%b-%Y")
dni_na_liczby= NULL
#tworzenie vektora dni jako liczby zaczynaj¹c od pierwszego dnia jako '0'
  dni_na_liczby = as.numeric((as.Date(daily_ice_edge[ ,1 ], format = "%d-%b-%Y"))
                          - first_day)

dni_na_liczby_skrocone = as.numeric((as.Date(daily_ice_edge_skrocony[ ,1 ], format = "%d-%b-%Y"))
                                    - first_day)

#------------------------------------------------------------------------------
#przygotowanie danych do animacji
#----------------------------------------------------------------------------



#tworzenie tabeli "baza_glowna" w której bêd¹ przetrzymywane dane do wykresu
baza_glowna = NULL
#tworzenie sekwensu dla wartosci kontowych
seq = seq(0,360,by=1)
#przypisanie pierwszemu wierszowi abeli warrtoœci kontowych <0,360>
baza = seq
#przypisanie drugiemu wierszowi tabeli wartoœci z pierwszego dnia badan
baza = rbind(baza, daily_ice_edge_skrocony[1,-1])
#przypisanie trzeciemu wierszowi tabeli dni z danego roku
baza[3,1:361] = dni_na_liczby_skrocone[1]
#nadpisanie tabeli 'baza_glowna', utworzon¹ tabel¹ 'baza'
baza_glowna = baza


#pêtla tworz¹ca tabelê dla pomiarów z n dni, schemat postêpowania podobny jak powy¿ej 
for (i in 2:nrow(daily_ice_edge_skrocony)){
    baza[2,] = daily_ice_edge_skrocony[i,-1]
    baza[3,1:361] = dni_na_liczby_skrocone[i]
    baza_glowna = cbind(baza_glowna,baza)
  }


#dopisanie do czwartego wiersza tabeli numeru jeden który umo¿liwi stworzenie dwóch wykesów w jednym miejscu
baza_glowna[4,] = 1


#-----------------------------------------------------------------------------

#
# liczenie aproksymacji
#

#tworzenie tabeli wartoœci zaproksymowanych w celu dalszej obróbki 
vector_dni = as.numeric(dni_na_liczby_skrocone)

for (i in 2:ncol(daily_ice_edge)){
  #dodanie dancych dla kolejnych szerokosci geograficznych
  long = daily_ice_edge[,i]
  SST <- data.frame(long, as.numeric(dni_na_liczby))
  #wyznaczanie  stopnia z zasiegu lodu wzgledem czasu (metoda nakmniejszych kwadratow)
  nls.mod <-nls(long ~ a + b*sin(2*pi*c*as.numeric(dni_na_liczby)), start=list(a = -60, b = -6, c=1/365))
  #obliczanie wartosci na podtawie aproksymacji
  temp = coef(nls.mod)
  vector_dni =cbind(vector_dni, temp[1] + temp[2] * sin(2*pi*temp[3]* as.numeric(dni_na_liczby_skrocone))) 
}
  



#Schemat postêpowania taki sam jak powy¿ej 
baza_glowna_apr = NULL
baza_apr = seq
baza_apr = rbind(baza_apr, vector_dni[1,-1])
baza_apr = rbind(baza_apr, vector_dni[1,1])
baza_glowna_apr = baza_apr


for (i in 2:nrow(vector_dni)){
  baza_apr[2,] = vector_dni[i,-1]
  baza_apr[3,1:361] = vector_dni[i,1]
  baza_glowna_apr = cbind(baza_glowna_apr,baza_apr)
}

#dopisanie skalara 2 w celu umorzliwienia rysowania wykresu
baza_glowna_apr = rbind(baza_glowna_apr, 2) 
#do³¹czenie baz
baza_glowna = cbind(baza_glowna,baza_glowna_apr)
#ustawienei daty rzeczywistej
baza_glowna[3,] = baza_glowna[3,] + as.numeric(first_day)
#transopnowanie bazy w celu umo¿liwnia funkcji ggplot
baza_glowna = t(baza_glowna)
#zmiana typu bazy glownaj
baza_glowna = as.data.frame(baza_glowna)

map_of_Antarctica = ggplot(baza_glowna,aes(y=baza_glowna[,2],
                                           x=baza_glowna[,1],
                                           color = as.factor(baza_glowna[,4])))+
  geom_line() +
  coord_polar() +
  scale_y_continuous(limits=c(-90,-50),
                     breaks=seq(-90,-60, by=10)) +
  scale_x_continuous(limits=c(0,360),
                     breaks=seq(0,330,by=30)) +
  scale_color_manual(labels = c("Real", "Apr"),
                     values=c("blue", "green")) +
  labs(colour="Whose") +
  geom_line(size = 1) +
  labs(x = "",
       y = "") +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(colour="white"))



map = map_of_Antarctica +   ggtitle('Antarctica, now showing {closest_state}') +
  transition_states(as.Date(baza_glowna[ ,3]),
                    transition_length = 1,
                    state_length = 0,
                    wrap = TRUE)

animate(map, nframes = ilosc_dni_w_gif, fps = 10)

#zapisywanie gif'a na dysk
anim_save('plot_of_antarctica.gif', width = 800, height = 800)


#-------------------------------------------------------------------------------

#
#------------------ZAD-3--------------------------------------------------------
#


#elipsa rownaie biegunowe r = p/(1 + e cos??)
# e mimoœród <0,1>
# p 
e = 0.4
p = 3
r = p/(1+(e*cos(seq*pi/180))) - 90

#sta³a do obrotu
fi = 20
#jaka dlugosc
n=200
#co ile dni
ile_dni = 15


#ostatni dzien modelu realnego
ostatni_dzien = as.numeric(as.Date(daily_ice_edge[ nrow(daily_ice_edge),1 ], format = "%d-%b-%Y"))
#vektor dni dla modelu, z pocz¹tkiem w ostatnim dniu danych oraz koñcem n lat póŸniej
dni_model = seq(ostatni_dzien,by = ile_dni, length =n )


#tworzenie tabeli "mode" w której bêd¹ przetrzymywane dane do wykresu
model = NULL
#przypisanie pierwszemu wierszowi abeli warrtoœci kontowych <0,360>
baza = seq
#przypisanie drugiemu wierszowi tabeli wartoœci najmniejszego oddalenia lodu od bieguna ( jak w zadaniu 1)
baza = rbind(baza, war_min)
##przypisanie trzeciemu wierszowi tabeli dni z danego roku
baza = rbind(baza,seq(dni_model[1], length = 361, by = 0))
#nadpisanie tabeli 'mode', utworzon¹ tabel¹ 'baza'
model = baza


for (i in 2:n){
    #tworzenie vectora z losowymi liczbami oraz zapewniaj¹cego stabilnosc operaacji
    temp = runif(1, 59,61)
    tabela_losowa =  runif(1, temp + mean(baza[2,]), temp + 4 + mean(baza[2,]))
    #schemat procedury podobny jak powy¿ej 
    baza[2,] = (baza[2,] - r) - tabela_losowa - 93
    baza[3,1:361] = dni_model[i]
    model = cbind(model,baza)
    #przesuniêcie danych wektora r o fi pozycji w prawo
    temp=r[1:fi]
    r[1:(361-fi)] = r[(fi+1):361]
    r[(361-fi+1):361] = temp
}

#transponowanie tabeli by móc j¹ wykorzystaæ w ggplot
model = t(model)

#wstawienie tabeli w foramt dataframe
model = as.data.frame(model)

#wizualizacja modelu lodu antarktydy dla ustalonych lat
model_of_Antarctica = ggplot(model,aes(y=model[,2],
                                           x=model[,1]))+
  #typ wykresu - liniowy
  geom_line() +
  #odzwierciedlenie - biegunowe 
  coord_polar() +
  scale_y_continuous(limits=c(-90,-50),
                     breaks=seq(-90,-60, by=10)) +
  scale_x_continuous(limits=c(0,360),
                     breaks=seq(0,330,by=30)) +
  geom_line(size = 1) +
  labs(x = "",
       y = "") +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(colour="white"))

#tworzenie animacji z funkcji ggplot
map_model = model_of_Antarctica +   ggtitle('Now showing {closest_state}') +
  transition_states(as.Date(model[ ,3]),
                    transition_length = 1,
                    state_length = 0,
                    wrap = TRUE)

animate(map_model, nframes = n, fps = 10)

#zapisanie animacji do katalogu roboczego
anim_save('model_of_Antarctica.gif', width = 800, height = 800)


#-----------------------------------------------------------------------
