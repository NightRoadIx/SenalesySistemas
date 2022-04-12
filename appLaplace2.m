clear all
close all
clc

% Variables simbólicas a utilizar
syms x y s t

% Señal de entrada
% x(t) = 5 u(t)
A = 1;
x = A * heaviside(t);
% Obtenemos Laplace X(s)
X = laplace(x);

% Respuesta al impulso del sistema
% H = 2 / (s*(s+3) + 2);
H = (2*s^2 + 6*s + 1)/(s^2 + 3*s + 3);
% Obtenemos la respuesta en el tiempo con laplace inversa
h = ilaplace(H);

% Se obtiene la respuesta del sistema a la señal de entrada x(t)
% y(t) = x(t) * h(t)        {donde * es convolución}
% Sin embargo en Laplace:
% Y(s) = X(s) H(s)          {donde la convolución se vuelve multiplicación}
Y = X*H;
% Se aplica el teorema del valor inicial para conocer el comportamiento del
% sistema, este dice que el limite t->0+ f(t) = limite s->Inf sF(s)
y_inicial = limit(s*Y, s, Inf);
sprintf('Valor inicial: %0.4f', double(y_inicial))
% Se aplica el teorema del valor final para conocer el comportamiento del
% sistema, este dice que el limite t->Inf f(t) = limite s->0 sF(s)
y_final = limit(s*Y, s, 0);
sprintf('Valor final: %0.4f', double(y_final))
% Obtener la respuesta en el tiempo mediante la transformada inversa de
% Laplace
y = ilaplace(Y);

% Obtener numeradores y denominadores
[n1, d1]= numden(Y);
% Obtener los coeficientes para resolver
arrn1 = sym2poly(n1);
arrd1 = sym2poly(d1);
% Se resuelve para obtener las soluciones
num1 = roots(arrn1);
den1 = roots(arrd1);

% Graficar todo esto
figure
%La entrada x(t)
subplot(221), ezplot(x, [0, 10]), axis([0 10 -A-1 A+1]), grid
title(strcat('$x(t) = ', latex(x), '$'), 'Interpreter', 'latex')
% La respuesta al impulso unitario del sistema
subplot(222), ezplot(h, [0, 10]), grid, title('h(t)')
title(strcat('$h(t) = ', latex(h), '$'), 'Interpreter', 'latex')
% La respuesta a la entrada x(t) del sistema
subplot(223), ezplot(y, [0, 10]), hold on, ezplot(x, [0, 10]), grid
axis([0 10 -A-1 double(y_inicial)+1])
title(strcat('$y(t) = ', latex(y), '$'), 'Interpreter', 'latex')
% Gráfica de polos y ceros
subplot(224)
plot(real(num1), imag(num1), 'bo'), hold on
plot(real(den1), imag(den1), 'rx'), grid
title('Gráfica de polos y ceros')
xlabel('\sigma')
ylabel('j\omega')