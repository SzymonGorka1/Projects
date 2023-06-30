%%
close all; clear; clc;

Fs = 50;
t = 0 : 1/Fs : 20;
ff = linspace(11, 1, length(t/2));

x = 1.5 * (1 - abs(t-3)/2) .* (abs(t-3)<=2) + ...
    1 * (abs(t-7)<=1) + ...
    0.1 * sin(2*pi*t*17) + ...
    0.75 * sin(2*pi*t.*ff) .* (t>= 10);

plot(t, x);

XT = fftshift(fft(x));
WA = abs(XT);
f = linspace(-Fs/2, Fs/2, length(t));

okno = 255;
N = length(t);
tab = zeros(okno, N - okno);
okienko = hamming(okno)';

for k = 1:N-okno
    xx = x(k:k+okno-1).*okienko;
    WA2 = abs(fftshift(fft(xx)));
    tab(:, k) = WA2';
end

tt = 0:(N-okno)/Fs;
ff = linspace(-Fs/2, Fs/2, okno);
%imagesc(tt, ff, tab);

LP = 1 ./ (1 + ((f.*2)./(f.^2-17^2)).^(2*5));
XTn = ifft(ifftshift(XT .* LP));

subplot(311),imagesc(tt, ff, tab);
subplot(312), plot(t, x, 'r', t, XTn, 'g');
subplot(313), plot(f, WA, 'r', f, LP .*Fs ,'g');

%%
%% 1
close all; clear; clc;
Fs = 500;
a = load('dem_201.txt');
x = a(:, 1);
xs = a(:, 2);

t = 0 : 1/Fs : 5-1/Fs;

plot(t, x, 'r', t, xs, 'g');

ocena = @(x, xod)sqrt(1/2500 * sum((x(:)-xod(:)).^2));

N = 61;
tab = zeros(N, 4);

for k = 1 : N
    n = 2*k+1;
    
    LP = ones(1, n)/n;
    xa = conv(xs, LP, 'same');
    tab(k, 1) = ocena(x, xa);
    
    LP = exp(-(-k:k).^2./(k/8));
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

%%
close all; clear; clc;

Fs = 25;
t = 0 : 1/Fs : 50;

x = 1 * sin(2*pi*t*1) + ...
    1/3 * sin(2*pi*t*3) + ...
    1/5 * sin(2*pi*t*5);

f = linspace(-Fs/2,  Fs/2, length(t));
XT = fftshift(fft(x));
WA = abs(XT);

LP = 1 ./ (1 + ((f.*1)./(f.^2-3.^2)).^(2*5));
XTn = XT .* LP;
xn = real(ifft(ifftshift(XTn)));

subplot(211), plot(t, x, 'r', t, xn, 'g');
subplot(212), plot(f, WA, 'r', f, LP .* Fs, 'g');

%%
close all; clear; clc;

Fs = 50;
t = 0 : 1/Fs : 20;
ff = linspace(11, 1, length(t/2));

x = 1.5 * (1 - abs(t-3)/2) .* (abs(t-3)<=2) + ...
    1 * (abs(t-7)<=1) + ...
    0.1 * sin(2*pi*t*17) + ...
    0.75 * sin(2*pi*t.*ff) .* (t>= 10);

XT = fftshift(fft(x));
WA = abs(XT);
f = linspace(-Fs/2, Fs/2, length(t));

okno = 255;
N = length(t);
tab = zeros(okno, N-okno);
okienko = hamming(okno)';

for k = 1 : N-okno
    xx = x(k:k+okno-1).*okienko;
    WA2 = abs(fftshift(fft(xx)));
    tab(:, k) = WA2';
end

tt = 0:(N-okno)/Fs;
ff = linspace(-Fs/2, Fs/2, okno);

imagesc(tt, ff, tab);



%%
close all; clear; clc;

Fs = 50;
t = 0 : 1/Fs : 20;
ff = linspace(11, 1, length(t/2));

x = 1.5 * (1 - abs(t-3)/2) .* (abs(t-3)<=2) + ...
    1 * (abs(t-7)<=1) + ...
    0.1 * sin(2*pi*t*17) + ...
    0.75 * sin(2*pi*t.*ff) .* (t>= 10);


XT = fftshift(fft(x));
f = linspace(-Fs/2, Fs/2, length(t));
WA = abs(XT);

okno = 255;
N = length(t);
tab = zeros(okno, N-okno);
okienko = hamming(okno)';

for k = 1 : N-okno
    xx = x(k:k+okno-1).*okienko;
    WA2 = abs(fftshift(fft(xx)));
    tab(:, k) = WA2';
end

ff = linspace(-Fs/2, Fs/2, okno)
tt = 0:(N-okno)/Fs;

imagesc(tt, ff, tab);


























