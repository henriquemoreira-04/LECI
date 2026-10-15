% 1.b)
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

% Soma total
total_sum = p0 + p1 + p2 + p3 + p4 + p5;

% converter para %)
pi_0 = (p0 / total_sum) * 100;
pi_1 = (p1 / total_sum) * 100;
pi_2 = (p2 / total_sum) * 100;

% prints com 6 casas decimais
fprintf('Prob. of state 1 = %.6f%%\n', pi_1);
fprintf('Prob. of state 2 = %.6f%%\n', pi_2);