close all;clear;clc;
Fs=100;
t = 0 : 1/Fs : 30;
x= 1 * (abs(t-3)<=2) + ...
   (1-abs(t-9)/3) .* (abs(t-9)<=3) + ...
   (t==13) + ...
   1*exp(- (t-20) .* (t-20)/8);

N=23;
%filtracja Wienera
%im wieksze N tym wariancja wieksza i znika dirac
%nie ma gladkich przejsc po w kazdym punkcie inna
%przepisuje sygnal z szumem na krawedziach tam gdzie szybko zmienny sygnal
%tam gdzie jest gladko ladnie czyści 
%najpierw sygnal niezaszumiony
%y= wiener2(x,[1,N]);

xs=x+0.05*randn(size(x));
%sygnal zaszumiony 
y= wiener2(xs,[1,N]);
plot(t,x,'r',t,y,'g')