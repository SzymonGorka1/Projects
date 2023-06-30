library(dplyr)
library(ggplot2)

#Wczytanie danych z komputera
sanok <- read.delim("C:/Users/szymo/OneDrive/Pulpit/Geoinformatyka/semestr II/Przetwarzanie danych srodowiskowych/zajecia 8/sanok_trepcza_t.txt")

#usuwanie wierszy z niepelnymi danymi  
sanok2=sanok %>% filter(between(I,-50,100),between(II,-50,100),between(III,-50,100),between(VI,-50,100),between(V,-50,100),between(VI,-50,100),between(VII,-50,100),between(VIII,-50,100),between(IX,-50,100),between(X,-50,100),between(XI,-50,100),between(XII,-50,100))

# przygotowanie danych do zad2-3
sanok2=sanok2  %>%
  mutate(wiosna=(III+IV+V)/3,lato=(VI+VII+VIII)/3,jesien=(IX+X+XI)/3,zima=(I+II+XII)/3,okr_weg=(V+VI+VII+VIII+IX)/5) 
 

miesiace=order(c("Styczen","Luty","Marzec","Kwiecien","Maj","Czerwiec","Lipiec","Sierpien","Wrzesien","Pazdziernik","Listopad","Grudzien"))


# przygotowanie wektorow do zad 1a
srednia2=round(c(mean(sanok2$I),mean(sanok2$II),mean(sanok2$III),mean(sanok2$IV),mean(sanok2$V),mean(sanok2$VI),mean(sanok2$VII),mean(sanok2$VIII),mean(sanok2$IX),mean(sanok2$X),mean(sanok2$XI),mean(sanok2$XII)),digits = 2)
maximum2=round(c(max(sanok2$I),max(sanok2$II),max(sanok2$III),max(sanok2$IV),max(sanok2$V),max(sanok2$VI),max(sanok2$VII),max(sanok2$VIII),max(sanok2$IX),max(sanok2$X),max(sanok2$XI),max(sanok2$XII)),digits = 2)
minimum2=round(c(min(sanok2$I),min(sanok2$II),min(sanok2$III),min(sanok2$IV),min(sanok2$V),min(sanok2$VI),min(sanok2$VII),min(sanok2$VIII),min(sanok2$IX),min(sanok2$X),min(sanok2$XI),min(sanok2$XII)),digits = 2)
mediana2=round(c(median(sanok2$I),median(sanok2$II),median(sanok2$III),median(sanok2$IV),median(sanok2$V),median(sanok2$VI),median(sanok2$VII),median(sanok2$VIII),median(sanok2$IX),median(sanok2$X),median(sanok2$XI),median(sanok2$XII)),digits = 2)
Od_stan2=round(c(sd(sanok2$I),sd(sanok2$II),sd(sanok2$III),sd(sanok2$IV),sd(sanok2$V),sd(sanok2$VI),sd(sanok2$VII),sd(sanok2$VIII),sd(sanok2$IX),sd(sanok2$X),sd(sanok2$XI),sd(sanok2$XII)),digits = 2)
Rozstep_miedzykwartylowy2=round(c(IQR(sanok2$I),IQR(sanok2$II),IQR(sanok2$III),IQR(sanok2$IV),IQR(sanok2$V),IQR(sanok2$VI),IQR(sanok2$VII),IQR(sanok2$VIII),IQR(sanok2$IX),IQR(sanok2$X),IQR(sanok2$XI),IQR(sanok2$XII)),digits = 2)

#tabela danych zad 1b
zad2=data.frame(Miesiac=miesiace,Srednia=srednia2,Mediana=mediana2,Odchylenie_standardowe=Od_stan2,Minimum=minimum2,Maximum=maximum2,Rozstep_miedzykwartylowy=Rozstep_miedzykwartylowy2)

#zapis zad2 do pliku
write.csv2(zad2,"zad2.txt")

#wzor histogram zad 1a
ggplot(sanok, aes(I)) + geom_histogram(binwidth = 1, fill="blue",color="black")+ labs(title="Styczen", x="Temperatura", y="ilosc wystapien")+ theme_bw()+ theme(text=element_text(size=14))

#wzor wykres punktowy/liniowy zad 1a
ggplot(sanok2, aes(x=rok,y=I)) + geom_point(col="blue") + geom_smooth(method = "lm",formula = y~x) + labs(y="Temperatura", x="Rok")+ theme_bw()+ theme(text=element_text(size=14))

#wykres ramka wasy
boxplot(sanok2[,2:13], border="blue", main="Rozklad temperatur", xlab="miesiace",ylab="tmp. [st. C]")



#zadanie 2  
srednia3=round(c(mean(sanok2$wiosna),mean(sanok2$lato),mean(sanok2$jesien),mean(sanok2$zima),mean(sanok2$okr_weg)),digits = 2)
okres=c("Wiosna","Lato","Jesien","Zima","Okr_weg")
maximum3=round(c(max(sanok2$wiosna),max(sanok2$lato),max(sanok2$jesien),max(sanok2$zima),max(sanok2$okr_weg)),digits = 2)
minimum3=round(c(min(sanok2$wiosna),min(sanok2$lato),min(sanok2$jesien),min(sanok2$zima),min(sanok2$okr_weg)),digits = 2)
Zakres_wartosci3=round(c(range(sanok2$wiosna),range(sanok2$lato),range(sanok2$jesien),range(sanok2$zima),range(sanok2$okr_weg)),digits = 2)
mediana3=round(c(median(sanok2$wiosna),median(sanok2$lato),median(sanok2$jesien),median(sanok2$zima),median(sanok2$okr_weg)),digits = 2)
Od_stan3=round(c(sd(sanok2$wiosna),sd(sanok2$lato),sd(sanok2$jesien),sd(sanok2$zima),sd(sanok2$okr_weg)),digits = 2)
Rozstep_miedzykwartylowy3=round(c(IQR(sanok2$wiosna),IQR(sanok2$lato),IQR(sanok2$jesien),IQR(sanok2$zima),IQR(sanok2$okr_weg)),digits = 2)

#tabela danych zad 2
zad3=data.frame(Okres=okres,Srednia=srednia3,Mediana=mediana3,Odchylenie_standardowe=Od_stan3,Minimum=minimum3,Maximum=maximum3,Rozstep_miedzykwartylowy=Rozstep_miedzykwartylowy3)

#zapis zad2 do pliku
write.csv2(zad3,"zad3.txt")

#wzor histogram zad 2
ggplot(sanok2, aes(wiosna)) + geom_histogram(binwidth = 0.25, fill="blue",color="black")+ labs(title="Wiosna", x="Temperatura", y="ilosc wystapien")+ theme_bw()+ theme(text=element_text(size=14))

#wzor trend liniowy zad 2
ggplot(sanok2, aes(rok,wiosna)) + geom_point(col="blue") + geom_smooth(method = "lm",formula = y~x) + labs(y="Temperatura", x="Rok")+ theme_bw()+ theme(text=element_text(size=14))

#zad3

#tworzenie tablicy wyjsciowej
tabela=data.frame()
for (i in 0:4) {
  dekada=sanok2%>% filter(rok>(1960+i*10) & rok<=(1970+i*10))
  tabela=rbind(tabela,data.frame(nr=i+1,I=mean(dekada$I),II=mean(dekada$II),III=mean(dekada$III),IV=mean(dekada$IV),V=mean(dekada$V),VI=mean(dekada$VI),VII=mean(dekada$VII),VIII=mean(dekada$VIII),IX=mean(dekada$IX),X=mean(dekada$X),XI=mean(dekada$XI),XII=mean(dekada$XII),Wiosna=mean(dekada$wiosna),Lato=mean(dekada$lato),Jesien=mean(dekada$jesien),Zima=mean(dekada$zima),Okr_weg=mean(dekada$okr_weg)))
}
tabela=round(tabela,digits = 2)

#zapis zad2 do pliku
write.csv2(tabela,"tabela.txt")

#wzor trend liniowy zad 3
ggplot(tabela, aes(nr,Wiosna)) + geom_point(col="blue") + geom_smooth(method = "lm",formula = y~x) + labs(y="Temperatura", x="Dekada")+ theme_bw()+ theme(text=element_text(size=14))