%FILTRACJA-ZADANIA
%3
% Policz (w programie MatLAB) splot funkcji gaussowskiej f(t) o parametrach
% (sr=0.0, std=0.2) z funkcją Sza g(t) = X(t) (dla n ∈ N ) dla t ∈< −5, 10 >
% spróbkowanych z FS = 50Hz. Ćwiczenie powtórz dla różnych wartości odchylenia
% standardowego funkcji f(t).


sr=0.0;
std=0.2;
Fs=50;
t = -5 : 1/Fs : 10;
dt=0.1;
ft = 1/(sqrt(2*pi)*std) * exp(-((t-sr).^2)/(2*std*std));
gt= mod((-250:500),10) == 0;
fg = conv(ft,gt,'same');
subplot(211)
plot(t,ft,'r',t,gt,'g')
subplot(212)
plot(fg)

