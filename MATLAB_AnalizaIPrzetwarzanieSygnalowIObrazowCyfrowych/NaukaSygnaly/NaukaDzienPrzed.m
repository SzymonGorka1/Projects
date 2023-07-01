%% 3
close all; clear; clc;

a = load('testowe.dat');
t = a(:, 1)';
x = a(:, 2)';
dt = t(2) - t(1);

plot(t, x);

%trójąty szer = 1, amp = 1.25

tt1 = 0 : dt : 1;
xt1 = 1.25 * (1 - abs(tt1-0.5)/0.5);

% %xc = xcorr(x, xt1);
% %xc = xcorr(x.^4, xt1.^4);
% xc = xcorr(1-x, 1-xt1) + xcorr(x, xt1);
% tc = -10 : dt : 10;
% nr = find(xc == max(xc(:)), 1, 'first');
% tc(nr)

%trojkat szer = 2, amp = 0.5

tt2 = 0 : dt : 2;
xt2 = 0.5 * (1 - abs(tt2-1)/1);

% tc = -10 : dt : 10;
% %xc = xcorr(x, xt2);
% %xc = xcorr(x.^4, xt2.^4);
% xc = xcorr(1-x, 1-xt2) + xcorr(x, xt2);
% nr = find(xc == max(xc(:)), 1, 'first');
% tc(nr)

tt3 = 0 : dt : 2.5;
xt3 = 1 * (1 - abs(tt3-1.25)/1.25);

% %xc = xcorr(x, xt3);
% %xc = xcorr(x.^4, xt3.^4);
% xc = xcorr(1-x, 1-xt3) + xcorr(x, xt3);
% tc = -10 : dt : 10;
% nr = find(xc == max(xc(:)), 1, 'first');
% tc(nr)

%prostokatny szer 1.6 amp 0.65

% tp = 0 : dt : 1.6;
% xp = 0.65 * ones(size(tp));
% 
% xc = xcorr(x, xp);
% tc = -10 : dt : 10;
% nr = find(xc == max(xc(:)), 1, 'first');
% tc(nr)

%% 5
close all; clear; clc;

Fs = 25;
t = 0 : 1/Fs : 50;

x = 1 * sin(2*pi*t*1) + ...
    1/3 * sin(2*pi*t*3) + ...
    1/5 * sin(2*pi*t*5);


f = linspace(-Fs/2, Fs/2, length(t));
XT = fftshift(fft(x));
WA = abs(XT);

BP = 1.0 ./ (1+((f*2)./(f.^2-3.^2)).^(2*5));
XTn = XT .* BP;
xn = real(ifft(ifftshift(XTn)));

subplot(211), plot(t, x, 'g', t, xn, 'r');
subplot(212), plot(f, WA, 'g', f, BP * Fs, 'r');

%% 8
close all; clear; clc;
Fs = 500;

a = load('dem_201.txt');
x = a(:, 1);
xs = a(:, 2);

t = 0 : 1/Fs : 5-1/Fs;

plot(t, x, 'g', t, xs, 'r');

ocena = @(x, xod)sqrt(1/2500 * sum((x(:)-xod(:)).^2));

N = 61;
tab = zeros(N, 4);

for k = 1 : N
    n = 2*k + 1;
    
    LP = ones(1, n)/n;
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
xm = medfilt1(xs, 2*15 + 1);

plot(t, x, 'g', t, xs, 'r', t, xm, 'b');

%%
close all;clear;clc;

a = load("2022_szum_2.txt");
t = a(:, 1)';
x = a(:, 2)'-70;
xs = a(:, 3)'-70;

plot(t, x, 'r', t, xs, 'g');

ocena = @(x, xod)sqrt(1/500*sum((x(:)-xod(:)).^2));

N = 161;
tab = zeros(N, 4);

for k = 1 : N
    n = 2*k+1;
    
    LP = ones(1,n)/n;
    xa = conv(xs, LP, 'same');
    tab(k, 1) = ocena(x, xa);
    
    LP = exp(-(-k:k).^2/(k/8));
    LP = LP/sum(LP);
    xg = conv(xs, LP, 'same');
    tab(k, 2) = ocena(x, xg);
    
    xm = medfilt1(xs, n);
    tab(k, 3) = ocena(x, xm);
    
    xw = wiener2(xs, [1 n]);
    tab(k, 4) = ocena(x, xw);
end

min(tab(:, 1))
min(tab(:, 2))
min(tab(:, 3))
min(tab(:, 4))


proba = find(tab == min(tab(:, 2)), 1, 'first') - N

LP = exp(-(-128:128).^2/(128/8));
LP = LP/sum(LP);
xg = conv(xs, LP, 'same');

plot(t, x, 'r', t, xs, 'g', t, xg, 'b');

%%
close all; clear; clc;

Fs = 25;
t = 0 : 1/Fs : 50;

x = 1 * sin(2*pi*t*1) + ...
    1/3 * sin(2*pi*t*3) + ...
    1/5 * sin(2*pi*t*5);

plot(t, x);

f = linspace(-Fs/2, Fs/2, length(x));
XT = fftshift(fft(x));
WA = abs(XT);

% %wyciecie czestotliwosci 1 idelane
% LP = 1.0 * (abs(f) <= 1.5);
% XTn = XT .* LP;
% xn = real(ifft(ifftshift(XTn)));

% %wyciecie czestotliwosci 3 idelane
% LP = 1.0 * (abs(f) <= 2.5 | abs(f) >= 3.5);
% XTn = XT .* LP;
% xn = real(ifft(ifftshift(XTn)));

% %wycinanie Butterwertha czestotliwosci 3 i 5
% LP = 1.0 ./(1 + (f./1.5).^(2*10));
% XTn = XT .* LP;
% xn = real(ifft(ifftshift(XTn)));

%wycinanie Butterwortherem czestotliwosci 3
LP = 1.0 ./ (1 + ((f*2)./(f.^2-3.^2)).^(2*5));
XTn = XT .* LP;
xn = real(ifft(ifftshift(XTn)));

subplot(211), plot(t, x, 'g', t, xn, 'r');
subplot(212), plot(f, WA, 'g', f, LP*Fs , 'r');

%%
close all; clear, clc;

Fs = 25;
t = 0 : 1/Fs : 50;

x = 1 * sin(2*pi*t*1) + ...
    1/3 * sin(2*pi*t*3) + ...
    1/5 * sin(2*pi*t*5);

plot(t, x);

XT = fftshift(fft(x));
f = linspace(-Fs/2, Fs/2, length(x));
WA = abs(XT);

LP = 1 ./ (1 + ((f*2)./(f.^2-3^2)).^(2*5));
XTn = XT .* LP;
xn = real(ifft(ifftshift(XTn)));

subplot(211), plot(t, x, 'g', t, xn, 'r');
subplot(212), plot(f, WA, 'g', f, LP * Fs, 'r');


%%
close all; clear; clc;

a = load('testowe.dat');
t = a(:, 1);
x = a(:, 2);
dt = t(2) - t(1);

plot(t, x);

tt = 0 : dt : 2.5;
xt = 1 * (1 - abs(tt-1.25)/1.25);

tp = 0 : dt : 1.6;
xp = 0.4 * ones(size(tp));

plot(tp, xp);

tc = -10 : dt : 10;
xc = xcorr(x, xt);
%xc = xcorr(x.^4, xt.^4);
%xc = xcorr(1-x, 1-xt) + xcorr(x, xt);
nr = find(xc == max(xc(:)), 1, 'first');
tc(nr)


%%
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
    
    LP = ones(1,n)/n;
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

probka = find(tab == min(tab(:, 3)), 1, 'first') - 2*N

k = 15;
n = 2*k+1;
xm = medfilt1(xs, n);
    tab(k, 3) = ocena(x, xm);
    
plot(t, x, 'r', t, xs, 'g', t, xm, 'b');


%% stft z lekcji 

close all; clear; clc;
Fs = 100;
t = 0 : 1/Fs : 20;
N = length(t);
x = sin(2*pi*linspace(2,11,N).*t);
subplot(211), plot(t, x);
XT = fftshift(fft(x));
WA = abs(XT);
f = linspace(-Fs/2, Fs/2, N);
subplot(212), plot(f, WA);

okno = 512;
A = zeros(okno, N - okno);
okienko = blackman(okno)';
for k = 1 : N-okno
    xx = x(k:k+okno-1).*okienko;
    WAx = abs(fftshift(fft(xx)));
    A(:, k) = WAx';
end
figure;
ff = linspace(-Fs/2, Fs/2, okno);
tt = (0:N-okno-1)/Fs;
imagesc(tt, ff, A);
xlabel('Przesuniecie [s]');
ylabel('Czestotliwosc [Hz]');
ylim([0, Fs/2]);


%% stft julka

close all; clear; clc;

fs=50;
t=0:1/fs:20;
ff=linspace(11,6,length(t));

x1=0.1*sin(2*pi*t*17);
x2=1*abs(t-7)<=1.*(abs(t-7)<=1);
x3=1.5*(1-abs(t-3)/2).*(t>=1 & t<=5);
x4=0.75*sin(2*pi*t.*ff).*(t>=10);
x=x1+x2+x3+x4;

xt=fftshift(fft(x));
wa=abs(xt);

okno=256;
N=length(t);
tab=zeros(okno,N-okno);
okienko=hamming(okno)';

for k=1:N-okno
    xx=x(k:k+okno-1).*okienko;
    WA2=abs(ifft(ifftshift(xx)));
    tab(:,k)=WA2';
end

tt=0:(N-okno)/fs;
ff=linspace(-fs/2,fs/2,length(t));

BS=1./(1+ (0.3*ff./(ff.^2-289)).^4);
%BS=1-BS;
x_new=ifft(ifftshift(xt.*BS));

subplot(311), imagesc(tt,ff,tab);
subplot(312), plot(t,x,'g',t,x_new,'r');
subplot(313), plot(ff,wa,'g',ff, BS*fs,'k');

%% sftf zygmunt


close all; clear; clc;
%Zad. 6.
Fs = 50;
t = 0 : 1/Fs : 20;

x = 1.5 * (1 - abs(t-3)/2) .* (t>=1 & t<=5) +...
    1 * (t>=6 & t<=8) +...
    0.1 * sin(2*pi*t*17) +...
    0.75 * sin(2*pi*t .* linspace(11, 1, length(t/2))) .* (t>=10);

%STFT
XT = fftshift(fft(x));
WA = abs(XT);
f = linspace(-Fs/2, Fs/2, length(t));

N = length(t);
okno = 255;
tab = zeros(okno, N-okno);
okienko = hamming(okno)';

for k = 1 : N-okno
    xx = x(k : k+okno-1) .* okienko;
    WA2 = abs(fftshift(fft(xx)));
    tab(:, k) = WA2';
end
tt = (0 : N-okno-1) / Fs;
ff = linspace(-Fs/2, Fs/2, okno);

%imagesc(tt, ff, tab)

%Filtracja
f0 = 17;
N = 11;
w = 5;
LP = 1.0 ./ (1 + (f*w) ./ (f.^2 - f0^2) .^(2*N));
x_new = ifft(ifftshift(XT .* LP));

subplot(211), plot(t, x, 'r', t, x_new, 'k')
subplot(212), plot(f, WA, 'r', f, LP*Fs, 'k')



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


%% 3
close all; clear; clc;

a = load('testowe.dat');
t = a(:, 1);
x = a(:, 2);
plot(t, x);

dt = t(2)-t(1);

tt = 0 : dt : 2.5;
xt = 1.0 * (1 - abs(tt-1.25)/1.25);


tc = -10 : dt : 10;
xc = xcorr(x, xt);
%xc = xcorr(x.^4, xt.^4);
%xc = xcorr(1-x, 1-xt) + xcorr(x, xt);

nr = find(xc == max(xc(:)), 1, 'first');
tc(nr)

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
    tab(k, 3) = ocena(x, xs);
end

min(tab(:, 1))
min(tab(:, 2))
min(tab(:, 3))






