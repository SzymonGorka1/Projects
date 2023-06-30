%% Sygnał prostokątny
% t0 = 0, ta = 2, tb = 4, tk = 6, AMP = 3
close all; clear; clc;

Fs = 50;
t = 0 : 1/Fs : 6;
x = 3 * (abs(t-3)<1);
plot(t, x);

mean(x) %srednia sygnalu dyskretnego
sum(x.*x) %srednia sygnalu dyskretnego

%% Sygnał trójkątny 
% t0 = -5, ta = -2, tw = 0, tb = 2, tk = 5, AMP = 3
close all; clear; clc;

Fs = 50;
t = -5 : 1/Fs : 5;
x = 3 * (1 - (abs(t-0))/2) .* (abs(t)<2);
plot(t, x);

mean(x) %srednia sygnalu dyskretnego
sum(abs(x).^2) %srednia sygnalu dyskretnego

%% Sygnał z liczbą zespoloną 1
% x(t) = sin(2t)-icos(2t) dla t >= 0 & t <= PI/2
% x(t) = 0 dla t > PI/2 & t <= 2PI
close all; clear; clc;

Fs = 100;
t = 0 : 1/Fs : 2*pi;
x = (sin(2*t)-1i*cos(2*t)).* (t<=pi/2);
plot(t, real(x), 'r', t, imag(x), 'g');
legend('re', 'im');
mean(x)
sum(abs(x).^2)/Fs

%% Syngał z liczbą zespoloną 2
% x(t) = 1-it dla |t-2| <= 1
% x(t) = 0 dla |t-2| > 1
% t >= 0 & t <= 10, Fs = 50
close all; clear; clc;

Fs = 50;
t = 0 : 1/Fs : 10;
x = (1-1i*t).*(abs(t-2)<=1)
plot(t, real(x), 'r', t, imag(x), 'g');
mean(x)
sum(abs(x).^2)

%% Sygnał z liczbą zespoloną 3
% x(t) = 1 + it dla t >= 0 & t <= 5
close all; clear; clc;

Fs = 20;
t = 0 : 1/Fs : 5;
x = (1+1i*t);
plot(t, real(x), 'r', t, imag(x), 'g')
mean(x)
sum(abs(x).^2)

%% Splot i koleracja 1
close all; clear; clc;

X = [2 0 -1 4];
Y = [1 0 -2];

conv(X, Y)
xcorr(X, Y)

%% Splot i koleracja 2
close all; clear; clc;

X = [1+1i 1 0 2];
Y = [2 1i 1];

conv(X, Y)
xcorr(X, Y)
