
clear; close all; clc;

a = imread('2022_grosze.png');
imshow(a);

obr = a;
bin = a(:,:,1) < 100 & a(:,:,2) < 100 & a(:,:,3) < 100;
bin = imfill(bin,'holes');

e = imerode(bin, strel('disk', 39));
d = bwdist(e);
w = watershed(d);
bin = bin & (w > 0);
bin = bwareaopen(bin, 700);

[aseg N] = bwlabel(bin);
pp = regionprops(aseg, 'all');
kola = zeros(size(aseg));

for i=1:N
    tt = aseg == i;
    if abs(pp(i).Circularity - 1) < 0.2
        kola = kola | tt;
    end
end

[aseg N] = bwlabel(kola);
pp = regionprops(aseg, 'all');
gr1 = zeros(size(aseg));
gr2 = zeros(size(aseg));
gr5 = zeros(size(aseg));
c1 = 0;
c2 = 0;
c5 = 0;

% petelki
for i=1:N
    tt = aseg == i;
    if pp(i).Area  < 8500
        gr1 = gr1 | tt;
        c1 = 1 + c1;
    end
    if pp(i).Area  < 11000 & pp(i).Area  > 9000 
        gr2 = gr2 | tt;
        c2 = 1 + c2;
    end
    if pp(i).Area  > 11000 & pp(i).Area  < 13000 
        gr5 = gr5 | tt;
        c5 = 1 + c5;
    end
end
% fprintf('Ilosc wszytskich monet: %d \n', N);  % ilosc monet wszytkich
fprintf('Ilosc 1 gr: %d \n', c1); 
fprintf('Ilosc 2 gr: %d \n', c2); 
fprintf('Ilosc 5 gr: %d \n', c5); 
fprintf('siiiiii');

% nakladanie obrazkow
over = imoverlay(obr, imdilate(bwperim(gr1), ones(5)), 'b');
over = imoverlay(over, imdilate(bwperim(gr2), ones(5)), 'g');
over = imoverlay(over, imdilate(bwperim(gr5), ones(5)), 'r');
imshow(over);




clear; close all; clc;

a = imread('text4.png');
obr = a;

% zmiana na skle szarosci
a = rgb2gray(a);

% odjecie od zamkniecia bazowego obrazu
a = imbothat(a, strel('disk', 201));

% normalizacja 
a = imadjust(a);

% progowanie
bin = ~(a < 100);

% usowanie malych elementow
bin = bwareaopen(bin, 70);

[aseg N] = bwlabel(bin);

pp = regionprops(aseg);

% tworzenie wektora pol
pola = [pp(:).Area];
min_pol = min(pola);
max_pol = max(pola);

% tworzenie koszykow
bins = min_pol : 1 : max_pol;
histogramito = hist(pola, bins);

%plot(histogramito);
nr1 = zeros(size(aseg));
for i=1:5
    nr = find(max(histogramito) == histogramito, 1, 'first');
    teo_pol = bins(nr);
    for j=1:N
        tt = aseg == j;
        if teo_pol == pp(j).Area
            nr1 = nr1 | tt;
        end
    end

    subplot(2, 3, i), imshow(nr1);
    title(['nr: ',  int2str(i)]);
    nr1 = zeros(size(aseg));
    histogramito(nr) = 0;
end
subplot(2, 3, 6), imshow(obr);
title('Obraz wejsciowy');
fprintf('\n essa sito'); 