close all;clear;clc;
a = load( "corr_02.txt");
t= a(:,1);
x=a(:,2);
%szukamy określonej sygnatury
%szukamy prostokata o amp = 0.7 i czas trwania/szerokość = 14s - wynikiem
%powinna byc 37 sekunda
dt = t(2) - t(1);
tp = 0 : dt : 14;
pros = 0.7 * ones(size(tp)); %stały sygnal, ciag 0.7 
%liczymy korelacje calego sygnalu ze wzorcem
xc = xcorr(x,pros);
%odczytujemy czas i musi być - do + tyle samo
tc = -200 : dt : 200;
%szukamy maximum korelacji
nr = find(xc == max(xc(:)),3,"first");
tc(nr)
subplot(311)
plot(t,x,'r', tp+37, pros,'g')
subplot(312);
plot(tc,xc);
subplot(313)
plot(tp,pros)


%%
%szukamy troj szer=10, amp = 1

close all;clear;clc;
a = load( "corr_02.txt");
t= a(:,1);
x=a(:,2);
%sygnatura
dt = t(2) - t(1);
tp = 0 : dt : 10;
troj = (1 - abs(tp-5)/5);
subplot(313)
plot(tp,troj)

%a)potegowanie sygnalu
%plot(t,x,'r', tp+1, troj,'g')
%xc = xcorr(x.^4,troj.^4);
%trojkat z trojkatem osiaga wartosci wieksze jedynie ponad prostokatem
% tc = -200 : dt : 200;
%szukamy maximum korelacji
% nr = find(xc == max(xc(:)),3,"first");
% tc(nr)
% subplot(211)
% plot(t,x.^4,'r', tp+1, troj.^4,'g')
% subplot(212);
% plot(tc,xc);

%b) odwracanie sygnalu i szukanie  w pobliżu wartości maksymanej, zeby
%sygnatura byla dominujaca
xc = xcorr(1-x,1-troj) +  xcorr(x,troj);
%trojkat z trojkatem osiaga wartosci wieksze jedynie ponad prostokatem
tc = -200 : dt : 200;
%szukamy maximum korelacji bardzo blisko, 
nr = find(xc > 0.99999* max(xc(:)),3,"first");
tc(nr)
subplot(311)
plot(t,x,'r', tp+1, troj,'g')
subplot(312);
plot(tc,xc);
%ZADANIE - POSZUKAĆ GAUSSA I INNE SYGNALY 
