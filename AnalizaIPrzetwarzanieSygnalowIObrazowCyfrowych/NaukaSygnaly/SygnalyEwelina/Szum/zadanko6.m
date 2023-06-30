close all;clear;clc;
a = load("2022_szum_2.txt");
t = a(:,1)';%' oznacza transpozycje
x = a(:,2)'-70; %obniżamy sygnał o 70 w dół i zeszliśmy w dół 
xs = a(:,3)'-70;
plot(t,xs,'g',t,x,'k')
%odszumianie i ocenienie w sposob liczbowy jak bardzo odbiega zaszumiony od
%niezaszumionego
ocena = @(x,xod)sqrt(sum((x(:)-xod(:)).^2 ));
ocena(x,xs);

N=41; %41 kobinacji razy cztery maski
tab = zeros(N,4);
%ocena
for k = 1:N
    n = 2*k + 1;
    LP=ones(1,n)/n;
    %xod= conv(xs,LP,'same');
    %xod=imfilter(xs,LP,'replicate');
    xod=imfilter(xs,LP,'symmetric');
    tab(k,1) = ocena(x,xod);
    % zamineimay 
    

    LP=exp(-(-k:k).^2/(k/8));
    LP =LP/sum(LP(:));
    %xod= conv(xs,LP,'same');
    xod=imfilter(xs,LP,'symmetric');
    tab(k,2) = ocena(x,xod);

   % xod=medfilt1(xs,n);
    xod = medfilt2(xs, [1 n], 'symmetric');
    tab(k,3) = ocena(x,xod);

    xod=wiener2(xs,[1 n]);
    tab(k,4) = ocena(x,xod);
end
subplot(311)
plot(1:N, tab);
legend('avg','Gauss','median','wiener')
%plot(t,x,'r',t,xod,'g');
min(tab(:))
ocena(x,xs);
subplot(312)
plot(t,x,'r',t,wiener2(xs,[1 9]),'g'); %4*2+1 = 9 odczytalismy minimum wczesniej
subplot(313)
plot(t,xs)
