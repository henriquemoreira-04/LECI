%% 1 

P_D = 0.03;                             % Probability of having disease
P_notD = 1 - P_D;                       % Probability of not having disease
P_Pos_given_D = 0.95;                   % Sensibility
P_Neg_given_notD = 0.92;                % Especify
P_Pos_given_notD = 1 - P_Neg_given_notD; % False Positive

%% a) 
P_Pos = P_Pos_given_D * P_D + P_Pos_given_notD * P_notD;
theoretical_probability = (P_Pos_given_D * P_D) / P_Pos;

fprintf('a) Probabilidade Teórica P(D|Pos): %.4f\n', theoretical_probability);

%% b) 
N = 1e5;                       % Number of testes/people
has_disease = rand(N,1) < P_D; % Logical vector: 1 if has disease

test_positive = false(N,1);    % Inicialize result vector

% Test in people that have the disease
test_positive(has_disease) = rand(sum(has_disease),1) < P_Pos_given_D;

% Test in healthy people
test_positive(~has_disease) = rand(sum(~has_disease),1) < P_Pos_given_notD;

n_positive = sum(test_positive);
n_disease_and_positive = sum(has_disease & test_positive);
simulated_probability = n_disease_and_positive / n_positive;

fprintf('b) Probabilidade Simulada (N=10^5): %.4f\n', simulated_probability);