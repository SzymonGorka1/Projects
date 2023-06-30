close all;clear;clc;
Fs = 100;
t = 0 : 1/Fs : 2*pi;
x = (cos(2*t)+1i*sin(2*t)) .* (t<=pi/2);
plot(t,real(x),'r',t,imag(x),'g');
[mean(x) 1i/(2*pi)]
[sum(abs(x).^2)/Fs pi/2]
%%
close all;clear;clc;
Fs = 20;
t = 0 : 1/Fs : 5;
x = (1+ 1i*t) ;
plot(t,real(x),'r',t,imag(x),'g');
[mean(x) 1+2.5*1i]
[sum(abs(x.^2)) 101+6767/8]
%%
conv([2 0 -1 4],[1 0 -2],'full') %domyślny, do konwolucji
conv([2 0 -1 4],[1 0 -2],'same') %uciety, srodkowe wartosci, do filtracji  
conv([2 0 -1 4],[1 0 -2],'valid') %opcjonalnie, niepotzrebny
%%
%t = <0,10>s, Fs=100;
%x1: trójkątny, wierz=5s, szer=6s, amp=1.1
%x2: prostokątny, środek:4s, szer:3s, amp=1
%prosze splot x1*x2
%wyświetlic: na gornym wykresie x1(t), x2(t)
%na dolnym xy(t)
close all;clear;clc;
Fs = 100;
t = 0 : 1/Fs : 10;
amp = 1.1;
x1 = amp * (1 - abs(t-5)/3).* (abs(t-5)<=3);
x2 = 1 * (abs(t-4)<=1.5);

subplot(2,1,1), plot(t,x1,'r',t,x2,'g')
xy = conv(x1,x2,'same');
subplot(2,1,2), plot(xy)
%dwa wierzsze, jedna kolumna i piszemy w pierwszym polu

%%
close all;clear;clc;
Fs = 100;
t = 0 : 1/Fs : 10;
x = 0.5*(mod(t,2)==0) + (-1)*(mod(t,2)==1);
%plot(t,x)

tp = -2 : 1/Fs : 2;
y = sinc(8*tp);
xy = conv(x,y,'same');
plot(t,x,'r',t,xy,'g')
%%
close all;clear;clc;
%t = <0,10> Fs=100
%x1 = troj, tw =3, szer=4, ampl=1
%x2 = troj, tw=6, szer=6, amp=0.8
Fs=100;
t = 0 : 1/Fs : 10;
amp = 1;
x1 = amp * (1 - abs(t-3)/2).* (abs(t-3)<=2);
amp = 0.8;
x2=  amp * (1 - abs(t-6)/3).* (abs(t-6)<=3);
subplot(2,1,1), plot(t,x1,'r',t,x2,'g')
xc = xcorr(x1,x2);
%trzeba sworzyć wektor czasu
tc = -10 : 1/Fs : 10;
subplot(212), plot(tc,xc)
%wskazuje jakie jest przesuniecie sygnalow miedzy soba
%nie jest symetryczna, ma znaczenie kolejność - w spolocie nie ma znaczenia
%czy pierwsze jest x czy y
%szukamy korelacji
%xc = xcorr([1+1i,0,2-1i,3],[-1,1+2i,4-1i]);