clear all
close all
clc

% Variables simbólicas a utilizar
syms x y s t

% Señal de entrada
% x(t) = 5 u(t)
x = 5 * heaviside(t);
% Obtenemos Laplace X(s)
X = laplace(x);

% Respuesta al impulso del sistema
H = 2 / (s*(s+3) + 2);
% Obtenemos la respuesta en el tiempo con laplace inversa
h = ilaplace(H);

% Se obtiene la respuesta del sistema a la señal de entrada x(t)
% y(t) = x(t) * h(t)        {donde * es convolución}
% Sin embargo en Laplace:
% Y(s) = X(s) H(s)          {donde la convolución se vuelve multiplicación}
Y = X*H;
% Se aplica el teorema del valor final para conocer el comportamiento del
% sistema, este dice que el limite t->Inf f(t) = limite s->0 sF(s)
y_final = limit(s*Y, s, 0);
sprintf('Valor final: %0.4f', double(y_final))
% Obtener la respuesta en el tiempo mediante la transformada inversa de
% Laplace
y = ilaplace(Y);

% Graficar todo esto
figure
%La entrada x(t)
subplot(311), ezplot(x, [0, 10]), axis([0 10 -1 6]), grid
title(strcat('$x(t) = ', latex(x), '$'), 'Interpreter', 'latex')
% La respuesta al impulso unitario del sistema
subplot(312), ezplot(h, [0, 10]), grid, title('h(t)')
title(strcat('$h(t) = ', latex(h), '$'), 'Interpreter', 'latex')
% La respuesta a la entrada x(t) del sistema
subplot(313), ezplot(y, [0, 10]), hold on, ezplot(x, [0, 10]), grid, title('y(t)=x(t)*h(t)')
title(strcat('$y(t) = ', latex(y), '$'), 'Interpreter', 'latex')