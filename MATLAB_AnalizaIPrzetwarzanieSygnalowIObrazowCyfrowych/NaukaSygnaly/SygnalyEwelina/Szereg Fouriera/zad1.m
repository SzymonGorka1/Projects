close all;clear;clc;
Fs=100;
t=0 : 1/Fs :6;


x= 1 * (t>2 & t <=4) + 2*(t>4 & t<=6);
XT=ones(size(t));
for n=1:100
    bn = 2* (cos(2*n*pi/3)-1)/(n*pi);
    XT=XT+bn*sin(n*pi*t/3);
end

plot(t,x,'.g',t,XT,'r')
%%
close all;clear;clc;

Fs=100;
t=0:1/Fs:4;
x=1*(abs(t-2)>1)+2*(1-abs(t-2)/1) .* (abs(t-2)<=1);
XT=ones(size(t));
for n = 1:100
    an=2*sin(n*pi/2)/(n*pi)+...
       8*(cos(n*pi)-cos(n*pi/2))/(n*n*pi*pi);
    XT= XT + an*cos(n*pi*t/2);
end
plot(t,x,'.g',t,XT,'r');