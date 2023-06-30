%% 2.3. Policz (w programie MatLAB) splot funkcji gaussowskiej f(t) o parametrach
%   (sr=0.0, std=0.2) z funkcją Sza g(t) = X(t) (dla n ∈ N ) dla t ∈< −5, 10 >
%   spróbkowanych z FS = 50Hz. Ćwiczenie powtórz dla różnych wartości odchylenia
%   standardowego funkcji f(t).
close all; clear; clc;

Fs = 50;
t = -5 : 1/Fs : 10;
%gauss
sr = 0;
std = 0.2;
x1 = 1/(std*sqrt(2*pi)) * exp(-(t-sr).^2/(2*std^2));

%sza (grzebieniowa)
x2 = mod((-250:500), 10) == 0;

%splot
splot = conv(x1, x2, 'same');

%plot(t, x1, 'r', t2, x2, 'g');
subplot(311), plot(t, x1);
title('Gauss');
subplot(312), plot(t, x2);
xlim([-5 10]);
title('Sza');
subplot(313), plot(t, splot);
title('Splot');

%% 2.4. Policz (w programie MatLAB) splot sygnału harmonicznego f(t) o amplitudzie
%   A1 = 1.0, okresie ω1 = 0.5s i czasie trwania T1 = 10s z sygnałem prostokątnym g(t)
%   o czasie trwania T2 = 0.2s i amplitudzie A2 = 1/(T2 ·FS). Oba sygnały spróbkowane
%   są z częstotliwością FS = 100Hz. Stwórz wykresy sygnałów oraz ich splotu
close all; clear; clc;

Fs = 100;
t1 = 0 : 1/Fs : 10;
% sygnał harmoniczny
amp1 = 1;
%czestotliwosc to odwrotnosc okresu f = 1/okres
f = 1/0.5;
x1 = amp1 * sin(2*pi*f.*t1);

% sygnał prostokątny
t2 = 0 : 1/Fs : 0.2;
amp2 = 1/(0.2*Fs);
x2 = amp2 * (abs(t2-0.1) < 0.1);

%splot
splot = conv(x1, x2, 'same');

subplot(311), plot(t1, x1);
title('sygnal harmoniczny');
subplot(312), plot(t2, x2);
xlim([0 10]);
title('sygnal prostokatny')
subplot(313), plot(t1, splot);
title('splot');

%% Usuwanie szumu splotem
close all; clear, clc;

Fs = 100;
t = 0 : 1/Fs : 10;
x = 1.5*(abs(t-5)<2)+0.1*randn(size(t)); %dodanie szumu (to po plusie)
N = 31; %20-40 nieparzyste
y = ones(1,N)/N;
xy = conv(x, y, 'same');
subplot(211), plot(t, x, 'r');
subplot(212), plot(t, xy, 'b');
%splot usuwa szum

%% Zrobić sygał składający się z:
%   x1 suma dwóch sygnałów:
%       trojkatny: amp = 1, szer = 6, wierz = 4
%       gaussa: amp = 0.5, sr = 7, odch = 0.5
%   x2 trojkatny: t = 0 - 6; Fs = 100, tw = 3
%   A następnie obliczyć i wystwietlić korelacje

Fs = 100;
t1 = 0 : 1/Fs : 10;
t2 = 0 : 1/Fs : 6;

amp11 = 1;
sz11 = 6;
tw11 = 4;

amp12 = 0.5;
sr12 = 7;
od12  = 0.5;

amp2 = 1;
sz2 = 6;
tw2 = 3;

x1 = amp11 * (1 - abs(t1 - tw11)/3) .* (abs(t1-tw11) < 3) + ...
    amp12 * exp(-(t1-sr12).^2/(2*od12^2));
x2 = amp2 * (1 - abs(t2 - tw2)/3) .* (abs(t2 - tw2) < 3);

xc = xcorr(x1, x2);
tc = -10 : 1/Fs : 10;

subplot(211); plot(t1, x1, 'r', t2, x2, 'g');
subplot(212); plot(tc, xc);

nr = find(xc == max(xc(:)), 3, 'first');
tc(nr)

%% Szukanie sygnału prostokątnego
close all; clear; clc;
% wczytanie danych
a = load('corr_02.txt');
t = a(:, 1)'; %wczytanie wszystkich elementów pierwszej kolumny, a następnie
%               odwrócenie wetktora
dt = t(2) - t(1); %wyznacznie kroku pomiedzy próbkami
x = a(:, 2)'; %wczytanie wszyskich elementów drugiej kolumny, a następnie
%               odwrócenie wektora
subplot(211); plot(t, x);

% szukamy teraz sygnału prostokątnego o amp = 0.8 i szerokości 10
%   w tym celu najpierw tworzymy taki sygnał, a potem robimy koleracje

tp = 0 : dt : 10;
amp = 0.8;
xp = amp * ones(size(tp));

xc = xcorr(x, xp);
tc = -200 : dt : 200;
subplot(212); plot(tc, xc);

nr = find(xc == max(xc(:)), 3, 'first');
tc(nr)

%% Szukanie sygnału trójątnego (potęgowanie sygnału)
close all; clear; clc;
% wczytanie danych
a = load('corr_02.txt');
t = a(:, 1)'; %wczytanie wszystkich elementów pierwszej kolumny, a następnie
%               odwrócenie wetktora
dt = t(2) - t(1); %wyznacznie kroku pomiedzy próbkami
x = a(:, 2)'; %wczytanie wszyskich elementów drugiej kolumny, a następnie
%               odwrócenie wektora
subplot(211); plot(t, x);

% szukamy teraz sygnału trójkątnego amp = 1, szerkość 10

tt = 0 : dt : 10;
xt = 1 * (1 - abs(tt-5)/5);

xc = xcorr(x.^4, xt.^4); %potęgujemy, żeby się nam wynik zgodził
tc = -200 : dt : 200;
nr = find(xc == max(xc(:)), 1, 'first');
tc(nr)
subplot(212); plot(tc, xc);

%% Szuakanie sygnału trójkątnego (odwarcanie i szukanie w pobliżu wartości max)
close all; clear; clc;

a = load('corr_02.txt');
t = a(:, 1)';
dt = t(2) - t(1);
x = a(:, 2)';
subplot(211); plot(t, x);

% szukamy teraz sygnału trójkątnego amp = 1, szerkość 10

tt = 0 : dt : 10;
xt = 1 * (1 - abs(tt - 5)/5);

% odwracanie sygnału i szukanie w pobliżu wartości maksymalnej, żeby
%   sygnatura była dominująca

xc = xcorr(1-x, 1-xt) + xcorr(x, xt);
tc = -200 : dt : 200;

nr = find(xc == max(xc(:)), 3, 'first');
tc(nr)
subplot(212); plot(tc, xc);

%% Fitracja splotem
close all; clear; clc;
%t=<0, 20>, Fs = 50Hz
%x: suma sygnałow:
% -trojka, tw = 4, szer = 4s, amp = 1
% -prost 7-10s, amp = 1;
% -gusse sr = 14, odch = 1, amp = 1.1
% -delta Diraca(t-19)
Fs = 50;
t = 0 : 1/Fs : 20;
x = 1 * (1 - abs(t - 4)/2) .* (abs(t - 4) <= 2) + ...
    1.0 * (abs(t - 8.5) <= 1.5) + ...
    1.1 * exp(-(t-14).^2/(2*1^2)) + ...
    (t==19);
plot(t, x);
xs = x + 0.05*randn(size(x)); %dodajemy szum
%filtracja koleracja 
N = 30; % najlepsze jest pomiedzy 20 a 40
LP = ones(1, N)/N;
xx = conv(xs, LP, 'same');
plot(t, x, 'r', t, xs, 'b', t, xx, '.g');

%% Fitracja maską gaussa
close all; clear; clc;
%t=<0, 20>, Fs = 50Hz
%x: suma sygnałow:
% -trojka, tw = 4, szer = 4s, amp = 1
% -prost 7-10s, amp = 1;
% -gusse sr = 14, odch = 1, amp = 1.1
% -delta Diraca(t-19)
Fs = 50;
t = 0 : 1/Fs : 20;
x = 1 * (1 - abs(t - 4)/2) .* (abs(t - 4) <= 2) + ...
    1.0 * (abs(t - 8.5) <= 1.5) + ...
    1.1 * exp(-(t-14).^2/(2*1^2)) + ...
    (t==19);
plot(t, x);
xs = x + 0.05*randn(size(x)); %dodajemy szum
%filtracja maską gaussa
N = 41; %długość okna
N2 = floor(N/2);
odch = N2/5; %nie powinno się dzielić przez więcej niż 5
LP = exp(-(-N2:N2).^2/(2*odch^2));
LP = LP/sum(LP(:));
xx = conv(xs, LP, 'same');
plot(t, x, 'r', t, xs, 'b', t, xx, '.g');

%% Fitr medianowy
close all; clear; clc;
%t=<0, 20>, Fs = 50Hz
%x: suma sygnałow:
% -trojka, tw = 4, szer = 4s, amp = 1
% -prost 7-10s, amp = 1;
% -gusse sr = 14, odch = 1, amp = 1.1
% -delta Diraca(t-19)
Fs = 50;
t = 0 : 1/Fs : 20;
x = 1 * (1 - abs(t - 4)/2) .* (abs(t - 4) <= 2) + ...
    1.0 * (abs(t - 8.5) <= 1.5) + ...
    1.1 * exp(-(t-14).^2/(2*1^2)) + ...
    (t==19);
plot(t, x);
xs = x + 0.05*randn(size(x)); %dodajemy szum
%filtr medianowy
N = 38;
xx = medfilt1(xs, N);
plot(t, x, 'r', t, xs, 'b', t, xx, '.g');

%% Fitr Wienera
close all; clear; clc;
%t=<0, 20>, Fs = 50Hz
%x: suma sygnałow:
% -trojka, tw = 4, szer = 4s, amp = 1
% -prost 7-10s, amp = 1;
% -gusse sr = 14, odch = 1, amp = 1.1
% -delta Diraca(t-19)
Fs = 50;
t = 0 : 1/Fs : 20;
x = 1 * (1 - abs(t - 4)/2) .* (abs(t - 4) <= 2) + ...
    1.0 * (abs(t - 8.5) <= 1.5) + ...
    1.1 * exp(-(t-14).^2/(2*1^2)) + ...
    (t==19);
plot(t, x);
xs = x + 0.05*randn(size(x)); %dodajemy szum
%filtr Wienera
N = 23;
xx = wiener2(xs,[1 N]);
plot(t, x, 'r', t, xs, 'b', t, xx, '.g');

%% Parę filtórw na raz - nie czaje
close all; clear; clc;

a = load("2022_szum_2.txt");
t = a(:, 1)';
x = a(:, 2)'-70; %obniżamy sygnał o 70 w doł i zeszliśmy w dół
xs = a(:, 3)-70;
plot(t, xs, 'g', t, x, 'k')

% odszumienia i ocenianie w sposób liczbowy jak bardzo odbiega zaszumiony
% od niezaszumionego (norma L2)
ocena = @(x, xod)sqrt(sum((x(:)-xod(:)).^2));
ocena(x, xs);

N = 41;
tab = zeros(N, 4);

for k = 1:N
    %fitr splote
    n = 2*k + 1;
    LP = ones(1,n)/n;
    xod = conv(xs,LP,'same');
    tab(k,1)=ocena(x,xod);
    %filtr gaussa
    LP = exp(-(-k:k).^2/(k/8));
    LP = LP/sum(LP(:));
    xod = conv(xs, LP, 'same');
    tab(k,2) = ocena(x, xod);
    %fitr medianowy
    xod = medfilt1(xs, n);
    tab(k, 3) = ocena(x, xod);
    %filtr wienera
    xod = wiener2(xs, [1 n]);
    tab(k, 4) = ocena(x, xod);
end

%% Ocena L2
close all; clear; clc;
a = load("2022_szum_2.txt");
t = a(:, 1)';
x = a(:, 2)'-70;
xs = a(:, 3)'-70;
subplot(211), plot(t, x, 'r', t, xs, 'g');

ocena = @(x, xod)sqrt(1/500 * (sum((x(:)-xod(:)).^2)));

N = 41;
tab = zeros(N, 4);



%%
close all; clear; clc;
% Będziemy próbować oszacować odległość między sygnałami
% pierwszą trasę traktujemy jako wzorzec, a w następnych szukamy wzorca
% musimy znaleźć wszystkie prędkości (24)
% w każdej pętli musimy wyciągnać maksimum

a = load('sejs_2.txt');
% na osi x mamy czas i trasy z kolejnych sejsmików
[Np, Nt] = size(a); %Np to liczba wierszy, a Nt liczba kolumn
Fs = 400;
t = (0 : Np - 1)/Fs;
tc = (-Np+1 : Np+1)/Fs; %przeliczamy na czas kok próbkowania
czas = zeros(Nt-1, 1)
dx = 25;
figure;
hold on;
for k = 1 : Nt
    plot(t, a(:, k) + k - 1);
    if k > 1
        xc = xcorr(a(:,k), a(:,1));
        czas(k-1, 1) = find(xc == max(xc(:)), 1, 'first');
    end
end
hold off
odl = (1:Nt - 1)*dx;
FB = tc(czas);
v = odl./FB
%plot(v)
%mean(v)
