library(dplyr)
library(ggplot2)

#Wczytanie danych z komputera
sanok <- read.delim("C:/Users/szymo/OneDrive/Pulpit/Geoinformatyka/semestr II/Przetwarzanie danych srodowiskowych/zajecia 8/sanok_trepcza_t.txt")

#usuwanie wierszy z niepełnymi danymi  
sanok2=sanok %>% filter(between(I,-50,100),between(II,-50,100),between(III,-50,100),between(VI,-50,100),between(V,-50,100),between(VI,-50,100),between(VII,-50,100),between(VIII,-50,100),between(IX,-50,100),between(X,-50,100),between(XI,-50,100),between(XII,-50,100))

# przygotowanie danych do zad 2
sanok3=sanok2  %>%
  mutate(wiosna=(III+IV+V)/3,lato=(VI+VII+VIII)/3,jesien=(IX+X+XI)/3,zima=(I+II+XII)/3,okr_weg=(V+VI+VII+VIII+IX)/5) %>% 
  select(rok,wiosna,lato,jesien,zima,okr_weg)

#zad 1a
srednia=round(c(mean(sanok2$I),mean(sanok2$II),mean(sanok2$III),mean(sanok2$IV),mean(sanok2$V),mean(sanok2$VI),mean(sanok2$VII),mean(sanok2$VIII),mean(sanok2$IX),mean(sanok2$X),mean(sanok2$XI),mean(sanok2$XII)),digits = 2)
miesiace=c("Styczeń","Luty","Marzec","Kwiecień","Maj","Czerwiec","Lipiec","Sierpień","Wrzesień","Październik","Listopad","Grudzień")
zad1=data.frame(miesiac=miesiace,srednia=srednia)

# przygotowanei wektorów do zad 1b
srednia=round(c(mean(sanok2$I),mean(sanok2$II),mean(sanok2$III),mean(sanok2$IV),mean(sanok2$V),mean(sanok2$VI),mean(sanok2$VII),mean(sanok2$VIII),mean(sanok2$IX),mean(sanok2$X),mean(sanok2$XI),mean(sanok2$XII)),digits = 2)
miesiace=c("Styczeń","Luty","Marzec","Kwiecień","Maj","Czerwiec","Lipiec","Sierpień","Wrzesień","Październik","Listopad","Grudzień")
maximum=round(c(max(sanok2$I),max(sanok2$II),max(sanok2$III),max(sanok2$IV),max(sanok2$V),max(sanok2$VI),max(sanok2$VII),max(sanok2$VIII),max(sanok2$IX),max(sanok2$X),max(sanok2$XI),max(sanok2$XII)),digits = 2)
minimum=round(c(min(sanok2$I),min(sanok2$II),min(sanok2$III),min(sanok2$IV),min(sanok2$V),min(sanok2$VI),min(sanok2$VII),min(sanok2$VIII),min(sanok2$IX),min(sanok2$X),min(sanok2$XI),min(sanok2$XII)),digits = 2)
mediana=round(c(median(sanok2$I),median(sanok2$II),median(sanok2$III),median(sanok2$IV),median(sanok2$V),median(sanok2$VI),median(sanok2$VII),median(sanok2$VIII),median(sanok2$IX),median(sanok2$X),median(sanok2$XI),median(sanok2$XII)),digits = 2)
Od_stan=round(c(sd(sanok2$I),sd(sanok2$II),sd(sanok2$III),sd(sanok2$IV),sd(sanok2$V),sd(sanok2$VI),sd(sanok2$VII),sd(sanok2$VIII),sd(sanok2$IX),sd(sanok2$X),sd(sanok2$XI),sd(sanok2$XII)),digits = 2)
Rozstep_miedzykwartylowy=round(c(IQR(sanok2$I),IQR(sanok2$II),IQR(sanok2$III),IQR(sanok2$IV),IQR(sanok2$V),IQR(sanok2$VI),IQR(sanok2$VII),IQR(sanok2$VIII),IQR(sanok2$IX),IQR(sanok2$X),IQR(sanok2$XI),IQR(sanok2$XII)),digits = 2)

#tabela danych zad 1b
zad2=data.frame(Miesiac=miesiace,Mediana=mediana,Odchylenie_standardowe=Od_stan,Minimum=minimum,Maximum=maximum,Rozstep_miedzykwartylowy=Rozstep_miedzykwartylowy)

#wzór histogram zad 1b
ggplot(sanok, aes(I)) + geom_histogram(binwidth = 1, fill="blue",color="black")+ labs(title="Styczeń", x="Temperatura", y="ilość wystąpień")+ theme_bw()+ theme(text=element_text(size=14))

#wzór wykres punktowy/liniowy zad 1b
ggplot(sanok2, aes(rok,I)) + geom_point(col="blue") + geom_smooth(method = "lm") + labs(y="Temperatura", x="Rok")

#wykres ramka wąsy
boxplot(sanok2[,2:13], border="blue", main="Rozkład temperatur", xlab="miesiące",ylab="tmp. [st. C]")



#zadanie 2  
srednia=round(c(mean(sanok3$wiosna),mean(sanok3$lato),mean(sanok3$jesien),mean(sanok3$zima),mean(sanok3$okr_weg)),digits = 2)
okres=c("Wiosna","Lato","Jesien","Zima","Okr_weg")
maximum=round(c(max(sanok3$wiosna),max(sanok3$lato),max(sanok3$jesien),max(sanok3$zima),max(sanok3$okr_weg)),digits = 2)
minimum=round(c(min(sanok3$wiosna),min(sanok3$lato),min(sanok3$jesien),min(sanok3$zima),min(sanok3$okr_weg)),digits = 2)
Zakres_wartosci=round(c(range(sanok3$wiosna),range(sanok3$lato),range(sanok3$jesien),range(sanok3$zima),range(sanok3$okr_weg)),digits = 2)
mediana=round(c(median(sanok3$wiosna),median(sanok3$lato),median(sanok3$jesien),median(sanok3$zima),median(sanok3$okr_weg)),digits = 2)
Od_stan=round(c(sd(sanok3$wiosna),sd(sanok3$lato),sd(sanok3$jesien),sd(sanok3$zima),sd(sanok3$okr_weg)),digits = 2)
Rozstep_miedzykwartylowy=round(c(IQR(sanok3$wiosna),IQR(sanok3$lato),IQR(sanok3$jesien),IQR(sanok3$zima),IQR(sanok3$okr_weg)),digits = 2)

#tabela danych zad 2
zad3=data.frame(Okres=okres,Mediana=mediana,Odchylenie_standardowe=Od_stan,Minimum=minimum,Maximum=maximum,Rozstep_miedzykwartylowy=Rozstep_miedzykwartylowy)

#wzór histogram zad 2
ggplot(sanok3, aes(wiosna)) + geom_histogram(binwidth = 0.25, fill="blue",color="black")+ labs(title="Wiosna", x="Temperatura", y="ilość wystąpień")+ theme_bw()+ theme(text=element_text(size=14))

#wzór trend liniowy zad 2
ggplot(sanok3, aes(rok,wiosna)) + geom_point(col="blue") + geom_smooth(method = "lm") + labs(y="Temperatura", x="Rok")

#zad3
#tworzenie tablicy roboczej dla zad 3
sanok4=sanok2  %>%
  mutate(wiosna=(III+IV+V)/3,lato=(VI+VII+VIII)/3,jesien=(IX+X+XI)/3,zima=(I+II+XII)/3,okr_weg=(V+VI+VII+VIII+IX)/5)

#tworzenie tablicy wyjsciowej
tabela=data.frame()
 for (i in 0:4) {
  dekada=sanok4%>% filter(rok>(1960+i*10) & rok<=(1970+i*10))
  tabela=rbind(tabela,data.frame(nr=i+1,I=mean(dekada$I),II=mean(dekada$II),III=mean(dekada$III),IV=mean(dekada$IV),V=mean(dekada$V),VI=mean(dekada$VI),VII=mean(dekada$VII),VIII=mean(dekada$VIII),IX=mean(dekada$IX),X=mean(dekada$X),XI=mean(dekada$XI),XII=mean(dekada$XII),Wiosna=mean(dekada$wiosna),Lato=mean(dekada$lato),Jesien=mean(dekada$jesien),Zima=mean(dekada$zima),Okr_weg=mean(dekada$okr_weg)))
  }

#wzór trend liniowy zad 3
ggplot(tabela, aes(nr,Wiosna)) + geom_point(col="blue") + geom_smooth(method = "lm") + labs(y="Temperatura", x="Rok")


