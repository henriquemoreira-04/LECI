% 3.c)
% Dados
lambda = 45000;     % packet rate
C = 100;            % capacidade (Mbps)
N = 1e4;            % numero de packets por run
runs = 10;          % numero de runs

PAR_results = zeros(1, runs);

% corre 10 vezes
for i = 1:runs
    PAR_results(i) = SimulatorB(lambda, C, N);
end

% Computar a media das provas e o desvio 
avg_PAR = mean(PAR_results);
std_PAR = std(PAR_results);

% 90% Confidence Interval calculado
% Por 10 runs 
% Para 90% de confidence level, alpha = 0.10, por isso probabilidade de cauda é 0.05
t_crit = tinv(0.95, runs - 1); 
margin = t_crit * (std_PAR / sqrt(runs));

CI_lower = avg_PAR - margin;
CI_upper = avg_PAR + margin;

fprintf('Average: %f seconds\n', avg_PAR);
fprintf('Confidence interval = [%f, %f] seconds\n', CI_lower, CI_upper);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3.d)
lambda = 45000;    
C = 100;           
N = 1e4;      
runs = 100;         % correr 100 vezes      
PAR_results = zeros(1, runs);


for i = 1:runs
    PAR_results(i) = SimulatorB(lambda, C, N);
end

avg_PAR = mean(PAR_results);
std_PAR = std(PAR_results);

t_crit = tinv(0.95, runs - 1); 
margin = t_crit * (std_PAR / sqrt(runs));

CI_lower = avg_PAR - margin;
CI_upper = avg_PAR + margin;

fprintf('Average: %f seconds\n', avg_PAR);
fprintf('Confidence interval = [%f, %f] seconds\n', CI_lower, CI_upper);
