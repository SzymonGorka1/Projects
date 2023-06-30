close all;clear;clc;
a = load('sejs_2.txt');
%na osi x mamy czas i trasy z kolejnych sejsmików
[Np,Nt] = size(a);
%
Fs=400;
%
t= (0:Np-1)/Fs;
tc= (-Np+1:Np+1)/Fs; %przeliczamy na czas krok probkowania
figure;
FB = zeros(1,Nt-1);
dx=25;
hold on;
for k = 1 : Nt
    plot(t,a(:,k)+k-1);
    %plot mamy po 24 geofonach wiec cos trzeba pominac
    if k >1
        xc = corr(a(:,k),a(:,1));
        nr = find(xc == max(xc(:)),1,'first');
        FB(1,k-1)=tc(nr);
    end
end
hold off;
odl = (1:Nt-1)*dx; % odleglosc do k-tego odbiornika
v = odl./FB;