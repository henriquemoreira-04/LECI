clc; clear;

%% Parámetros del problema
ber_states = [1e-6, 1e-5, 1e-4, 1e-3, 1e-2];
n = length(ber_states);


lambda = [8, 5, 2, 1]; 
mu = [600, 100, 20, 5];

%% (a) y (b) Cálculo de Probabilidades Estacionarias (Matriz Q)

T = zeros(n);
for i = 1:n-1
    T(i+1, i) = lambda(i); 
    T(i, i+1) = mu(i);
end

 
Q = T;
for i = 1:n
    Q(i,i) = -sum(T(:,i)); 
end

% Resolver el sistema Qu = 0 con la restricción sum(pi) = 1
M = [Q; ones(1, n)];
b = [zeros(n, 1); 1];
u = M \ b; 

fprintf('--- (a) y (b) Probabilidades de cada estado (tiempo promedio) ---\n');
for i = 1:n
    fprintf('Estado ber=%.0e: %.4f%%\n', ber_states(i), u(i)*100);
end

%% (c) Tiempo medio de permanencia (Holding Time)
% El tiempo medio en el estado i es 1 / (suma de tasas de salida de i) 
q_exit = abs(diag(Q)); % Los elementos de la diagonal de Q son las tasas de salida
T_holding_min = (1 ./ q_exit) * 60; % Convertir de horas a minutos 

fprintf('\n--- (c) Tiempo medio de permanencia (minutos) ---\n');
for i = 1:n
    fprintf('Estado ber=%.0e: %.3f min\n', ber_states(i), T_holding_min(i));
end

%% (d) Probabilidad de error en trama de 100 Bytes
L1 = 100 * 8; % bits
P_E_given_S = 1 - (1 - ber_states).^L1; % Probabilidad de error dado el estado 
P_E_total_100 = sum(P_E_given_S .* u'); % Probabilidad total

fprintf('\n--- (d) Prob. error en trama de 100 Bytes ---\n');
fprintf('P(Error) = %.4f%%\n', P_E_total_100 * 100);

%% (e) Probabilidad de éxito en trama de 1500 Bytes
L2 = 1500 * 8; % bits
P_NE_given_S = (1 - ber_states).^L2; % Prob. sin error dado el estado
P_NE_total_1500 = sum(P_NE_given_S .* u');

fprintf('\n--- (e) Prob. de éxito (sin errores) en trama de 1500 Bytes ---\n');
fprintf('P(Sin Error) = %.4f%%\n', P_NE_total_1500 * 100);

%% (f) Probabilidad condicionada (Regla de Bayes) 
% P(S|E) = P(E|S) * P(S) / P(E)
P_E_total_1500 = 1 - P_NE_total_1500;
P_E_given_S_1500 = 1 - P_NE_given_S;

Prob_S1_given_E = (P_E_given_S_1500(1) * u(1)) / P_E_total_1500;
Prob_S5_given_E = (P_E_given_S_1500(5) * u(5)) / P_E_total_1500;

fprintf('\n--- (f) Probabilidad condicionada dado error en 1500 Bytes ---\n');
fprintf('P(Estado 10^-6 | Error) = %.4f%%\n', Prob_S1_given_E * 100);
fprintf('P(Estado 10^-2 | Error) = %.4f%%\n', Prob_S5_given_E * 100);