%% Ejercicio (a): Vector par de 4 a 100
% Sintaxis: inicio:paso:final
vec_a = 4:2:100;

%% Ejercicio (b): Secuencia decreciente de 5 a -5
% Nota: El paso debe ser negativo (-1) para ir hacia atrás
vec_b = 5:-1:-5;

%% Ejercicio (c): 100 elementos entre 0 y 1
% Para un número específico de elementos, usamos linspace
vec_c = linspace(0, 1, 100);

%% Ejercicio (d): Matrices y submatrices
% Crear matriz aleatoria 20x30
B = rand(20, 30);
% Extraer submatriz C
% Sintaxis: Matriz(filas_inicio:filas_fin, col_inicio:col_fin)
C = B(10:15, 9:12);

%% Ejercicio (e): Secuencia con Pi
% Usamos 'pi' que es una constante interna de MATLAB
x = -pi:pi/15:pi;

%% Ejercicio (f): Gráfica
% Esto generará una ventana emergente con el gráfico
plot(x, sin(4*pi*x));
title('Gráfica del ejercicio F');
xlabel('x');
ylabel('sin(4\pi x)');
