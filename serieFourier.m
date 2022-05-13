clear all
close all
clc

% Variables simbólicas
syms y t m n
assume(n, 'integer')
assume(m, 'integer')

% Función a evaluar
y = t^9;
% Periodo
T = 2*pi;
% Intervalo
tnum = 0:0.1:2*pi;
% Obtener el valor numérico
ynum = double(subs(y, t, tnum));

% Graficar la original
figure
plot(tnum, ynum, 'b')
xlabel('t')
ylabel('f(t)')
hold on

% Constantes
k = 2*pi / T;
N = 20;

%%
% Coeficientes de Fourier
a0 = (2/T)*int(y, t, 0, T);
am = (2/T)*int(y*cos(m*k*t), t, 0, T);
bm = (2/T)*int(y*sin(m*k*t), t, 0, T);

cadena = cell(1,N+1);
cadena{1} = 'f(t)';
for j = 1:N
    % Sumas de Fourier
    serieY = a0/2;
    % Suma de coeficientes de Jurier
    for i=1:j
        jedi = simplify(subs(am*cos(m*k*t) + bm*sin(m*k*t), m, i));
        serieY = serieY + jedi;
    end
    % Evaluar el valor de la serie
    ynums = double(subs(serieY, t,tnum));
    cadena{j+1} = sprintf('Serie %d', j);
    plot(tnum, ynums, 'color', rand(1,3))
end
grid, legend(cadena)
hold off