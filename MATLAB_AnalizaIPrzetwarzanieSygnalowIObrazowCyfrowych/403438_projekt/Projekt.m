clc; close all ; clear;

%% mika

a = imread('18_180_xn.jpg');
a_1 = imread('18_180_1N.jpg');

m = a(:,:,1) > 220 & a(:,:,2) > 90;
% m_1 = (a_1(:,:,1) > 140 &  a_1(:,:,1) <255) & (a_1(:,:,2) > 0 & a_1(:,:,2)< 120) & (a_1(:,:,3)>80 & a_1(:,:,3) <160);
% m_2 = (a_1(:,:,1) > 180 &  a_1(:,:,1) <255) & (a_1(:,:,2) > 150 & a_1(:,:,2)< 255) & (a_1(:,:,3)>80 & a_1(:,:,3) <160);


 se = strel('square',13);
 m = imclose(m, se);
 m = medfilt2(m, [11,11]);
 m = bwareaopen(m, 1500);

%  se = strel('square',11);
%  m_1 = imclose(m_1, se);
%  m_1 = medfilt2(m_1, [11,11]);
%  m_1 = bwareaopen(m_1, 501);

%  se = strel('square',17);
%  m_2 = medfilt2(m_2, [3,3]);
%  m_2 = imclose(m_2, se);
%  m_2 = medfilt2(m_2, [11,11]);
%  m_2 = bwareaopen(m_2, 700);

%  m = m+m_1+m_2;

%% glaukonit


a = imread('18_180_1N.jpg');
g = (a(:,:,1) > 125 &  a(:,:,1) <180) & (a(:,:,2) > 130 & a(:,:,2)< 170) & (a(:,:,3)>80 & a(:,:,3) <120);

se = strel('square',41);
g = medfilt2(g, [9,9]);
g = imclose(g, se); 
g = medfilt2(g, [7,7]);
g = bwareaopen(g, 100);


%% kwarc


a = imread('18_240_xn.jpg');

k_1 = (a(:,:,1) > 50 &  a(:,:,1) <80) & (a(:,:,2) > 50 & a(:,:,2)< 80) & (a(:,:,3)>50 & a(:,:,3) <90);
k_2 = (a(:,:,1) > 60 &  a(:,:,1) <140) & (a(:,:,2) > 60 & a(:,:,2)< 150) & (a(:,:,3)>60 & a(:,:,3) <180);
k_3 = (a(:,:,1) > 250 &  a(:,:,1) <256) & (a(:,:,2) > 250 & a(:,:,2)< 256) & (a(:,:,3)>250 & a(:,:,3) <256);
k_4 = (a(:,:,1) > 140 &  a(:,:,1) <256) & (a(:,:,2) > 130 & a(:,:,2)< 220) & (a(:,:,3)>150 & a(:,:,3) <240);
k_5 = (a(:,:,1) > 34 &  a(:,:,1) <55) & (a(:,:,2) > 32 & a(:,:,2)< 55) & (a(:,:,3)>35 & a(:,:,3) <65);

k_1 = medfilt2(k_1, [11,11]);
se = strel('square',21);
k_1 = medfilt2(k_1, [9,9]);
k_1 = imclose(k_1, se); 
k_1 = bwareaopen(k_1, 201);

k_2 = medfilt2(k_2, [11,11]);
se = strel('square',21);
k_2= imclose(k_2, se); 
k_2 = medfilt2(k_2, [9,9]);
k_2 = bwareaopen(k_2, 2001);
k_2 = imfill(k_2,'holes');

se = strel('square',21); 
k_3= imclose(k_3, se); 
k_3 = medfilt2(k_3, [15,15]);
k_3 = bwareaopen(k_3, 901);

k_4 = medfilt2(k_4, [3,3]);
se = strel('disk',11); 
k_4= imclose(k_4, se); 
k_4 = medfilt2(k_4, [15,15]);
k_4 = bwareaopen(k_4, 901);


k_5 = medfilt2(k_5, [7,7]);
se = strel('disk',5); 
k_5= imclose(k_5, se); 
k_5 = medfilt2(k_5, [15,15]);
k_5 = bwareaopen(k_5, 2001);
k_5 = imfill(k_5,'holes');

a = imread('18_180_xn.jpg');
k_6 = (a(:,:,1) > 0 &  a(:,:,1) <17) & (a(:,:,2) > 0 & a(:,:,2)< 15) & (a(:,:,3)>0 & a(:,:,3) <18);
k_6 = medfilt2(k_6, [15,15]);
se = strel('disk',5); 
k_6= imclose(k_6, se); 
k_6 = medfilt2(k_6, [15,15]);
k_6 = bwareaopen(k_6, 8000);
k_6 = imfill(k_6,'holes');

k_7 = (a(:,:,1) > 40 &  a(:,:,1) <165) & (a(:,:,2) > 40 & a(:,:,2)< 156) & (a(:,:,3)>50 & a(:,:,3) <157);
k_7 = medfilt2(k_7, [15,15]);
se = strel('disk',5); 
k_7= imclose(k_7, se); 
k_7 = medfilt2(k_7, [15,15]);
k_7 = bwareaopen(k_7, 1000);
k_7 = imfill(k_7,'holes');

k_8 = (a(:,:,1) > 26 &  a(:,:,1) <46) & (a(:,:,2) > 25 & a(:,:,2)< 43) & (a(:,:,3)>23 & a(:,:,3) <50);
k_8 = medfilt2(k_8, [3,3]); 
se = strel('disk',5); 
k_8= imclose(k_8, se); 
k_8 = medfilt2(k_8, [30,30]);
k_8 = bwareaopen(k_8, 8000);
k_8 = imfill(k_8,'holes');


k = k_1 + k_2 + k_3 + k_4 + k_5;
k_rot = imrotate(k, 300, 'crop');
k_rot = circshift(k_rot,[-76 -155]) + k_6 + k_7 + k_8;


%%
a = imread('18_180_xn.jpg');
glaukonit = bwperim(g,8);
mika = bwperim(m,8);
kwarc = bwperim(k_rot,8);

wynik = imoverlay(a, bwmorph(glaukonit, 'thicken'), 'red');
wynik = imoverlay(wynik, bwmorph(mika, 'thicken'),'yellow');
wynik = imoverlay(wynik, bwmorph(kwarc, 'thicken'), 'white');

skala = ((500/942)*0.001)^2;
kwarc =  sum(k(:)) * skala
glaukonit =  sum(g(:)) * skala
mika =  sum(m(:)) * skala

imshow(wynik);








