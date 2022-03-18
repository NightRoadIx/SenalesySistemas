clear all
close all
clc

% Con esto se generan las variables simb�licas a utilizar, sin esto
% MATLAB no entiende que son variables del tipo simb�lico y las tomar�a
% como num�ricas
syms x a t s

% Nuestra funci�n
f = exp(-a * t)
% La transformada de Laplace
F = laplace(f)

% En caso de colocar una que consideraremos como constante "a"
f1 = a
% Se debe colocar cuales son las variables independientes de la funci�n
% y la transformada
F1 = laplace(f1, t, s)

% De funciones especiales como la delta de Dirac
delta = dirac(t)
DELTA = laplace(delta)

% Funci�n escal�n unitario
% Hay que indicar a > 0 con assume()
u = heaviside(t)
U = laplace(escalon)

% Funci�n rampa
r = t
R = laplace(r)

% Se puede observar el cambio cuando t^n n >= 1
r2 = t^2
R2 = laplace(r2)

r3 = t^3
R3 = laplace(r3)

r4 = t^4
R4 = laplace(r4)

rn = t^a
RN = laplace(rn)

% Funciones trigonom�tricas
f3 = 2*sin(3*t)
F3 = laplace(f3)

% Graficaci�n sencilla de funciones, mediante ezplot()
ezplot(tan(t))
ezplot( laplace(3*cos(2*t)) )