%% Splot i koleracja
close all; clear; clc;

x1 = [1+1i 1-1i -1+1i -1-1i];
y1 = [1 2-1i 2+1i];

conv(x1, y1);
xcorr(x1, y1)



%% 3 Korelacja
% Pobierz i wczytaj sygnał: testowe.dat. W pierwszej kolumnie jest czas [s],
% w drugiej amplituda sygnału. Korzystając z korelacji znajdź początek
% sygnału trójkątnego o parametrach: szerokość 2.5s, wysokość: 1.
% Oblicz częstotliwość próbkowania sygnału.

plik = load('testowe.dat');
t = plik(:, 1)';
x = plik(:, 2)';
subplot(211), plot(t, x);

dt = t(2)-t(1);

tt = 0 : dt : 2.5;

xt = 1 * (1 - abs(tt-1.25)/1.25);

%xc = xcorr(x, xt); % klasycznie
%xc = xcorr(x.^4, xt.^4); % potęgowanie
xc = xcorr(1-x, 1-xt) + xcorr(x, xt); %odwracanie i szukanie w pobliżu max
tc = -10 : dt : 10;
nr = find(xc == max(xc(:)), 1, 'first');
tc(nr)
subplot(212), plot(tc, xc);

%% 5 Filtracja
% Stwórz sygnał będący sumą 3 składowych harmonicznych xi(t) o częstotliwościach (f1 =
% 1, f2 = 3, f3 = 5 [Hz]) i amplitudach równych odwrotności częstotliwości Ai = 1/fi.
% Załóż czas t=<0,50>s i Fs=25 Hz.
% Dla tak powstałego sygnału, nie korzystając z Fdatool i filtrów idealnych, stwórz filtrację
% pasmowozaporową usuwającą środkową częstotliwość.
% Stwórz wykresy zawierające: sygnał przed i po filtracji oraz widmo amplitudowe i przeskalowany filtr.

close all; clear; clc;

Fs = 25;
t = 0 : 1/Fs : 50;

x = 1/1 * sin(2*pi*t*1) + ...
    1/3 * sin(2*pi*t*3) + ...
    1/5 * sin(2*pi*t*5);

XT = fftshift(fft(x));
f = linspace(-Fs/2, Fs/2, length(x));
WA = abs(XT);

LB = 1.0 ./ (1+((f*2)./(f.^2-3.^2)).^(2*5));
XTn = XT .* LB;
xn = real(ifft(ifftshift(XTn)));

subplot(211), plot(t, x, 'r', t, xn, 'g');
subplot(212), plot(f, WA, 'r', f, LB * Fs, 'g');


%% %3.8
close all; clear; clc;
Fs=500;
a=load('dem_201.txt');
x = a(:, 1);
xs = a(:, 2);

t = 0 : 1/Fs : 5-1/Fs;
plot(t, x, 'r', t, xs, 'g');

ocena = @(x, xod)sqrt(1/2500 * sum((x(:)-xod(:)).^2));

N = 55;
tab = zeros(N, 4);

for k = 1 : N
    n = 2*k + 1;
    
    LP = ones(1,n)/n;
    xa = conv(xs, LP, 'same');
    tab(k, 1) = ocena(x, xa);
    
    LP = exp(-(-k:k).^2/(k/8));
    LP = LP/sum(LP);
    xg = conv(xs, LP, 'same');
    tab(k, 2) = ocena(x, xg);
    
    xm = medfilt1(xs, n);
    tab(k, 3) = ocena(x, xm);
    
    xw = wiener2(xs, [n 1]);
    tab(k, 4) = ocena(x, xw);
end
min(tab(:, 1))
min(tab(:, 2))
min(tab(:, 3))
min(tab(:, 4))

proba = find(tab == min(tab(:, 3)), 1, 'first') - 2 * N

xm = medfilt1(xs, (2*proba + 1));

plot(t, x, '.r', t, xs, 'g', t, xm, 'b');
