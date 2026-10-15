%% 2
N = 1e5;          % Number of experiences
n_bits = 16;      % Number bits for transmition
p_erro = 0.2;     % Probability error for bit

%% a)
% Generate matriz N bits
% 1= error, 0= success
transmissoes = rand(n_bits, N) < p_erro;

% X its sum of errors by transmition
X = sum(transmissoes);

%% b)
estimative_media = mean(X)
estimativa_variancia = var(X)

%% c)
% theoretical values of the mean and the variance
tMean = n_bits * p_erro
tVar = n_bits * p_erro * (1 - p_erro)

% pmf using binomial formula
k = 0:16; 
pmf_X = zeros(1, length(k)); % Inicialize PMF vector

for i = 1:length(k)
    % Binomial Formula: P(X=k) = nCk * p^k * (1-p)^(n-k)
    pmf_X(i) = nchoosek(n_bits, k(i)) * p_erro^k(i) * (1-p_erro)^(n_bits-k(i));
end

% Show PMF complete
pmf_X
fprintf('P(X=0)  = %.4f\n', pmf_X(k == 0));
fprintf('P(X=2)  = %.4f\n', pmf_X(k == 2));
fprintf('P(X=4)  = %.4f\n', pmf_X(k == 4));
fprintf('P(X=10) = %.4f\n', pmf_X(k == 10));