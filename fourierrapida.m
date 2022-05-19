clear all
close all
clc

% PARAMETROS DE LAS SEÑALES
% Frecuencia (se colocan en un vector para poner varias señales) [Hz]
f = [20, 50, 390, 440, 1200];
% Amplitud (para todas las señales)
A = [10, 8, 6, 4, 2];
% Frecuencia de muestreo (Fs > 2f) [Hz]
Fs = 5*max(f);
% Periodo de muestreo [s]
T = 1/Fs;
% Tiempo total que se observa la señal [s]
tfinal = 1;

% Arreglo de tiempo
t = 0:T:tfinal;
% Suma de las señales y(t)
y = A(1)*cos(2*pi*f(1)*t) + A(2)*cos(2*pi*f(2)*t) + A(3)*cos(2*pi*f(3)*t) + A(4)*cos(2*pi*f(4)*t) + A(5)*cos(2*pi*f(5)*t);
% Longitud de la señal
L = length(y);

% Contaminar la señal con ruido blanco (valores aleatorios con distribución
% uniforme)
s = y + 10*randn(size(t));

% Graficar la señal
figure
subplot(2,2,1)
plot(t, y)
xlabel('tiempo t [s]')
ylabel('Amplitud y(t)')

subplot(2,2,2)
plot(t, s)
xlabel('tiempo t [s]')
ylabel('Amplitud y(t) + ruido')

% Calcular la transformada de Fourier rápida
Y = fft(y);
S = fft(s);
% Obtener el valor absoluto de la transformada
P = abs(Y);
Ps = abs(S);
% Obtener solamente uno de los lados de la transformada
Pu = P(1:L/2+1);
Psu = Ps(1:L/2+1);
% Vector de frecuencias para graficar la transformada
freq = Fs*(0:(L/2))/L;

% Graficar las frecuencias
subplot(2,2,3)
plot(freq, Pu, 'r')
xlabel('frecuencia [Hz]')
ylabel('|Pu(f)|')

subplot(2,2,4)
plot(freq, Psu, 'r')
xlabel('frecuencia [Hz]')
ylabel('|Psu(f)|')

% Probar el audio de las señales generadas
sound(y, Fs)
pause(3)
sound(s, Fs)