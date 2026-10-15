% 2.a)
lambda = 400; % pedidos por hora
mu = 10;      % servico por operador
m = 48;       % numero de operadores

r = lambda / mu;
rho = lambda / (m * mu);

% calcular pi_0 (probabilidade de estar vazio)
sum_terms = 0;
for k = 0 : m-1
    sum_terms = sum_terms + (r^k) / factorial(k);
end
last_term = (r^m) / (factorial(m) * (1 - rho));
pi_0 = 1 / (sum_terms + last_term);

% P_Q é a probabilidade de estar tudo ocupado
P_Q = last_term * pi_0;

% Percentagem
pct_immediate = (1 - P_Q) * 100

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2.b

% W_Q é o tempo medio em horas
W_Q = (rho / (lambda * (1 - rho))) * P_Q; 

% conversor para segundos
W_Q_seconds = W_Q * 3600

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2.c)
lambda = 400;
mu = 10;
r = lambda / mu;
m_vec = [45, 48, 51, 54, 57, 60];
P_Q_vec = zeros(size(m_vec));

for i = 1:length(m_vec)
    m = m_vec(i);
    rho = lambda / (m * mu);
    
    sum_terms = 0;
    for k = 0:m-1
        sum_terms = sum_terms + (r^k) / factorial(k);
    end
    last_term = (r^m) / (factorial(m) * (1 - rho));
    pi_0 = 1 / (sum_terms + last_term);
    
    P_Q_vec(i) = last_term * pi_0 * 100; % Probability in %
end

% grafico
bar(m_vec, P_Q_vec);
xlabel('Number of Operators (m)');
ylabel('Probability of All Operators Occupied (%)');
title('Probability of Operators Occupied vs. Number of Operators');
grid on;
