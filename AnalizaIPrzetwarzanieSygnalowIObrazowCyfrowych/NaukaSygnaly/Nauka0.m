
%% Sygnał prostokątny
% w zakresie od 0 do 10, amp 3 od 3 do 7, czestotliwosc 100
close all; clear; clc;

Fs = 100; % czestotliowsc
t = 0 : 1/Fs : 10;
tw = 5;
amp = 3;
x = amp * (abs(t-tw)<2);
plot(t, x);

%% Sygnał trójkątny
% w zakresie od 0 do 20, amp 5 od 5 do 13, czestotliwosc 100
close all; clear; clc;

Fs = 100;
t = 0 : 1/Fs : 20;
tw = 9;
amp = 5;
x = amp * (1 - abs(t-tw)/(1/2 * 8)) .* (abs(t-tw)<4);
plot(t, x);

%% Sygnał harmoniczny
% w zakresie od 0 do 10 o amplitudzie zmiennej od 6 do 4,
% czestotliwosci f = 5 i przesunieciu 0.5
close all; clear; clc;

Fs = 100;
t = 0 : 1/Fs : 10;
f = 5;
amp = linspace(1, 4, length(t));
x = amp .* sin(2*pi*t*f + 0.5);
plot(t, x);

%% Sygnał sinc
close all; clear; clc;

Fs = 100;
t = -5 : 1/Fs : 15;
x = sinc(t);
plot(t, x);

%% Sygnał znaku sgn(t) - sign
close all;clear;clc;

Fs = 100;
t = -5 : 1/Fs : 15 ;
x = sign(t);
plot(t,x);

%% Heaviside, sygnał jednostkowy o wzorze x(t) = (H(t+2))(t+2)
close all;clear;clc;

Fs = 100;
t = -5 : 1/Fs : 15 ;
x = (t+2).*(t+2>=0);
plot(t,x)

%% Delta Diraca - podejscie informatyczne
close all;clear;clc;

Fs = 100;
t = -5 : 1/Fs : 15 ;
x= (t==0);
plot(t,x)

%% Syganał sza 
close all;clear;clc;

Fs = 100;
t = -5 : 1/Fs : 15 ;
x= mod(-500:1500,10)==0;
plot(t,x)

%% Syganał sza 2
close all;clear;clc;

Fs = 100;
t = -5 : 1/Fs : 15 ;
x= mod(t,1)==0;
plot(t,x)

%% krzywa Gaussa 
% srednia 2, odychlenie stadardowe 1.5
close all;clear;clc;

Fs = 100;
t = -5 : 1/Fs : 15 ;
sr = 2;
std = 1.5
%x= exp(1)*exp(-(t-2).*(t-2)/(2*1.5^2));
%x = 1/(std*(2*pi)^(1/2))*exp(-(t-sr).*(t-sr)/(2*std^2));
x = 1 * exp(-(t-sr).^2/(2*std^2));

plot(t,x)