close all;clear;clc;
Fs=100;
t = 0 : 1/Fs : 30;
x= 1 * (abs(t-3)<=2) + ...
   (1-abs(t-9)/3) .* (abs(t-9)<=3) + ...
   (t==13) + ...
   1*exp(- (t-20) .* (t-20)/8);

N=38;
%filtracja medianowa
%dxluzszy czas obliczeniowy

%najpierw sygnal niezaszumiony
%y = medfilt1(x,N);
%plot(t,x,'r',t,y,'g')

xs=x+0.05*randn(size(x));
%sygnal zaszumiony 
y = medfilt1(xs,N);
plot(t,x,'r',t,y,'g')