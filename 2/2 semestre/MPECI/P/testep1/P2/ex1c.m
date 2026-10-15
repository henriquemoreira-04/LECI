% 1.c)
% Dados
lambda_0 = 5/100; lambda_1 = 4/100; lambda_2 = 3/100; lambda_3 = 2/100; lambda_4 = 1/100;
mu_1 = 3; mu_2 = 6; mu_3 = 6; mu_4 = 6; mu_5 = 6;

% Probabilidades relativas a p0
p0 = 1;
p1 = (lambda_0 / mu_1) * p0;
p2 = (lambda_1 / mu_2) * p1;
p3 = (lambda_2 / mu_3) * p2;
p4 = (lambda_3 / mu_4) * p3;
p5 = (lambda_4 / mu_5) * p4;

% soma Total
total_sum = p0 + p1 + p2 + p3 + p4 + p5;

% Converter para percentagem
pi_0 = (p0 / total_sum) * 100;
pi_1 = (p1 / total_sum) * 100;

% probablidade de pelo menos 4 servidores a trabalhar -> estado 0 (5 está operacional) + estado
% 1 (4 está operacional)
prob_x4 = pi_0 + pi_1;

% probabilidade de pelo menos 5 estarem a trabalhar = estado 0 (5 está operacional)
prob_x5 = pi_0;

% pritn com 6 casas decimais
fprintf('Prob(x=4) = %.6f%%\n', prob_x4);
fprintf('Prob(x=5) = %.6f%%\n', prob_x5);