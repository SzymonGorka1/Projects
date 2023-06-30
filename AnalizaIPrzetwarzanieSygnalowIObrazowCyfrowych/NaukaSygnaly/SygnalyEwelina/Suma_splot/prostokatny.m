close all;clear;clc;
Fs = 50;
t = 0 : 1/Fs : 6;
x = 3 * (t>=2 & t<=4);
plot(t,x);
ylim([-0.5,3.5]);
[mean(x) 303/301]
[sum(x.^2)/Fs x*x'/Fs]
%%
close all; clear;clc;
Fs=50;
t = -5 : 1/50 : 5;
x = 3 * (1-abs(t)/2) .* (abs(t)<=2);
%sygnał trojkaty zmierza do nieskonczonosci i musi być od -2 do 2 * synał prostokątnu
plot(t,x)
x*x'/Fs
%% sygnal harmoniczny
close all;clear;clc;
Fs = 100;
t = -5 : 1/Fs : 15 ;
amp = linspace(6,4,length(t));
x = sin(2*pi*3*t) .* (5.5-t/10);
x= amp .* sin(2*pi*3*t);
plot(t,x)
%% sygnal sinc
close all;clear;clc;
Fs = 100;
t = -5 : 1/Fs : 15 ;
x= sinc(2*t);

plot(t,x)
%% singn
close all;clear;clc;
Fs = 100;
t = -5 : 1/Fs : 15 ;
x = sign(t);
plot(t,x)

%% Heaviside
close all;clear;clc;
Fs = 100;
t = -5 : 1/Fs : 15 ;
x = t>=0;
plot(t,x)
%% podejscie informatyczne
close all;clear;clc;
Fs = 100;
t = -5 : 1/Fs : 15 ;
x= (t==0);
plot(t,x)
%% sza 
close all;clear;clc;
Fs = 100;
t = -5 : 1/Fs : 15 ;
dt = 0.1;
% x=(mod(t,dt)==0);
x= mod(-500:1500,10)==0;
plot(t,x)

%% krzywa Gaussa
close all;clear;clc;
Fs = 100;
t = -5 : 1/Fs : 15 ;
amp = exp(1);
x= amp .* exp((-(t-2).^2) / 2*(1.5^2));
x= exp(1)*exp(-(t-2).*(t-2)/(2*1.5^2));

plot(t,x)