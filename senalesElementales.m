% Señales interesantes en MATLAB
% En este script se muestran algunas funciones de señales elementales 
% a utilizar
%%
% Se crea un vector en el intervalo [-3, 3], con pasos de 0.01
t = (-3:0.01:3);

% Generar las señales
% Impulso unitario o delta de Dirac
impulso = t == 0;

% Escalón unitario
% Por cuestiones de programa, debe estar definida desde 0
escalon = t >= 0;

% Rampa
rampa = t.* escalon;

% Cuadrática
cuad = t.^2.*escalon;

% Signo
signo = sign(t);

% Muestreo
samp = sinc(t);

% Graficar
hold on
plot(t, impulso)
plot(t, escalon)
plot(t, rampa)
plot(t, cuad)
plot(t, signo)
plot(t, samp)
xlabel('t'), ylabel('f(t)'), grid
legend('\delta(t)', 'u(t)', 'r(t)', 'q(t)', 'sgn(t)', 'Sa(t)')