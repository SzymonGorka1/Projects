%%%%brudnopis
%%
%1a
%prostokątnego (amplituda = 2 w przedziale <3, 6>s )
close all;clear;clc;
Fs=50;
t = 0 : 1/Fs : 10;
x= 2 .* (t>=3 & t<=6);
plot(t,x)
%%
%1b
%trójkątnego (wierzchołek w 5 s, amplituda = 2, szerokość = 8 s)
close all;clear;clc;
Fs=50;
t = 0 : 1/Fs : 10;
x= 2 * (1-abs(t-5)/4) .* (abs(t-5)<=4);
plot(t,x)
%%
%1c
%x(t) = 3 − i;
close all;clear;clc;
Fs=50;
t = 0 : 1/Fs : 10;
x= 3-1i;
plot(t,real(x),'r',t,imag(x),'g');
%%
%1d
% x(t) = Heaviside(t − 5) · sin(2πt), fs=50,t<0,10>
close all;clear;clc;
Fs=50;
t = 0 : 1/Fs : 10;
x =  (t-5>=0) .* sin(2*pi*t); %pamietac nawias!
plot(t,x)
%%
%1e
%Gaussa o średniej 4s, odchyleniu 0.5s i amplitudzie 2.0
close all;clear;clc;
Fs=50;
t = 0 : 1/Fs : 10;
x = 2 * exp((-(t-4).^2)/0.5);
plot(t,x)
%%
%1f
%(tylko ciągły, dla t ∈< 0, π/4 >): x(t) = sin(2t) + i · cos(2t)
close all;clear;clc;
Fs=50;
t = 0 : 1/Fs : 10;
x = (sin(2*t) + 1i * cos(2*t)) .* (t>=0 & t<=pi/4);
plot(t,real(x),'red',t,imag(x),'green')
%%
%1g
%x(t) = 2t − 1
close all;clear;clc;
Fs=50;
t = 0 : 1/Fs : 10;
x = 2*t - 1;
plot(t,x)
%%
%1f
%x(t) = Heaviside(5 − t) · (3 − 4i)
close all;clear;clc;
Fs=50;
t = 0 : 1/Fs : 10;
x = (5-t>=0) .* (3-4i);
plot(t,real(x),'g',t,imag(x),'r')