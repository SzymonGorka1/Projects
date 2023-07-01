close all;clear;clc;
% t=<0,30>s;
% Fs=100;
% x:suma skaldowych
% -prostokatny, sr=3,szer=4,amp=1;
% -trojkatny, wierzch=9s, szer = 6s, amp=1
% -delta diraca: t=13
% -syganl gaussa, sr=20, odch=2,amp=1

Fs=100;
t = 0 : 1/Fs : 30;
% pros = 1 * (abs(t-3)<=2);
% troj = 1-abs((t-9))/3 .* (abs(t-9)<=3);
% diraca= (t==13);
% t = 0 : 1/Fs : 30;
%gauss = 1/(2*sqrt(2*pi())) * exp((-(t - 20).^2)/8);
% gauss= 1*exp(- (t-20) .* (t-20)/8);
x= 1 * (abs(t-3)<=2) + ...
   (1-abs(t-9)/3) .* (abs(t-9)<=3) + ...
   (t==13) + ...
   1*exp(- (t-20) .* (t-20)/8);

N=60;
%filtracja usredniajaca
%filtr jednorodny
%LP = ones(1,N)/N; %filtr poziomy, jak sygnal pionowy to na odwrot


%%%%%filtr gaussowski
%%%STERUJEMY ODCHYLENIEM i N
N2=floor(N/2);
odch=N2/2;
LP=exp((-N2:N2).^2/(2*odch*odch));
LP=LP/sum(LP(:));

%czesto sie mylimy niewiele zaszumianie
xs=x+0.05*randn(size(x));
y = conv(xs, LP, 'same');
plot(t,x,'r',t,y,'g');

%wybrac okno ktore najmniej degenuraja sygnal, i najmniej zaszumione

