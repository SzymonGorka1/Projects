% ZAD1
% szukamy troj szer=10, amp = 1
close all;clear;clc;

dane = load("corr_02.txt");
x = dane(:,2);
t = dane(:,1);

%sygnatura
dt= t(2) - t(1);
tp=0 : dt : 10;
xt=1-(abs(tp-5)/5);


subplot(411)
plot(tp,xt);

xc=xcorr(1-x,1-xt) + xcorr(x,xt);
tc=-200:dt:200;
subplot(412)
plot(tc,xc)

nr = find(xc > 0.99999* max(xc(:)),3,'first');
tc(nr)
subplot(413)
plot(t,x,'r',tp+1,xt,'g')
%%
close all;clear;clc;
% t=<0,30>s;
% Fs=100;
% x:suma skaldowych
% -prostokatny, sr=3,szer=4,amp=1;
% -trojkatny, wierzch=9s, szer = 6s, amp=1
% -delta diraca: t=13
% -syganl gaussa, sr=20, odch=2,amp=1
Fs=100;
t = 0: 1/Fs :30;
x = 1*(abs(t-3)<=2) + ...
1*(1-abs(t-9)/3) .* (abs(t-9)<=3) + ...
(t==13) + ...
1*exp(-(t-20).^2/8);
plot(t,x)

N=30;
%LP = ones(1,N)/N;

%filtr liniowy, uśrdniający,gaussowski
N2=floor(N/2);
odch = N2/2;
LP=exp((-N2:N2).^2 / (2* odch.^2));
LP=LP/sum(LP(:));


xs=x+0.05*randn(size(x));
y = conv(xs, LP, 'same');
plot(t,x,'r',t,y,'g');



%%
%znajdz sygn prost o szerokosci 10 s i amp 0.8

data = load("corr_02.txt");
x = data(:,2);
t= data(:,1);
dt = t(2) - t(1);
tp = 0:dt:10;
syg = 0.8 * ones(size(tp));
%plot(tp,syg)

tc = -200 : dt : 200;
xc = xcorr(x,syg);
maxXC = find(xc == max(xc(:)),3,"first");
tc(maxXC)

subplot(211)
plot(t,x,'r',tp +24,syg,'g')
subplot(212)
plot(tc,xc)
%%
close all; clear; clc;
data = load ("2022_szum_2.txt");
t = data(:,1)';
x = data(:,2)'-70;
xs = data(:,3)-70;
subplot(311)
plot(t,x,'r',t,xs,'g')
ocena = @(x,xod)sqrt(sum((x(:) - xod(:)).^2));

N=41;
tab=zeros(N,4);

for k=1:N

    n = 2*k+1;
    LP = ones(1,n)/n;
    xd = conv(xs,LP,'same');
    tab(k,1)=ocena(x,xd);
    
    LP = exp(-(-k:k).^2/(k/8));
    LP= LP/sum(LP(:));
    xg = conv(xs,LP,'same');
    tab(k,2) = ocena(x,xg);

    xm =medfilt1(xs,n);
    tab(k,3)=ocena(x,xm);

    xw=wiener2(xs,[1 n]);
    tab(k,4) = ocena(x,xw);
end   

min(tab(:, 1))
min(tab(:, 2))
min(tab(:, 3))
min(tab(:, 4))

probka = find(tab == min(tab(:, 1)), 1, 'first')

n = 2*4+1;
LP = ones(1,n)/n;
xd = conv(xs,LP,'same');

plot(t,x,'r',t,xs,'g', t, xd, 'b');
