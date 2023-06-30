%% Szereg fouriera 1
close all; clear; clc;

N = 100;
Fs = 100;
t = 0 : 1/Fs : 6;

x = 1 + (3*abs(t-3)-2).*(abs(t-3) <= 1); %robimy tak jesli chcemy miec odwrócny trojkat
%x = 3 * (1 - abs(t-3)).*(abs(t-3) <= 1); %tutaj przyklad dla nie
%odwrócenego
XT = 5 * ones(size(t)) / 6;

for n = 1 : 100
    an = -sin(2*n*pi/3) / (n*pi) + 9 * (cos(2*n*pi/3) - cos(n*pi)) / (n * n * pi * pi);
    XT = XT + 2*an*cos(n*pi*t/3);
end

plot(t,x,'.g',t,XT,'r');

%% Szereg fouriera

Fs = 50;
t = - 15 : 1/Fs : 15;

x = (abs(t)-3) .* (abs(t) <= 3);

XT = -3 * ones(size(t))/2;

for n = 1 : 40
    an = (6*(cos(n*pi)-1))/(n*pi*n*pi);
    XT = XT + an*cos(n*pi*t/3);
end

plot(t, x, 'r', t, XT, 'g');


%% Transformata fouriera 1
close all; clear; clc;

%sygnał prostokątny amp 1, szer 2, tw 0 t od -pi  do pi

Fs = 100;
t = -pi : 1/Fs : pi;

x = 1 * (abs(t)<1);

subplot(211); plot(t,x);

XT = fft(x);
XT = fftshift(XT);

WA = abs(XT); %widmo amplitudowe

f = linspace(-Fs/2, Fs/2, length(t));

subplot(212), plot(f, WA, 'g', f, XT, 'r');