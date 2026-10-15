%% 3a 

% t_ji: rown j é o destine, colune i é a origin
T = [0.25  0.5   0;   % for State 0
     0.25  0.25  0;   % for State 1
     0.50  0.25  1];  % for state F

% Verify if colunes added by one -> should be [1 1 1]
sum(T)

%% b)
% T(destine, origin)
prob_b = T(1,2) * T(1,1) * T(2,1);
fprintf('Probability of sequence 1001 start in 1: %.3f%%\n', prob_b * 100);

%% c)

% Isolate a submatrix Q -> transitions between states 0 and 1
Q = T(1:2, 1:2);

% Probability de absorcao to state F
R = T(3, 1:2);

% initial probability -> 0.5 to 0 and 0.5 to 1
v0 = [0.5; 0.5];

% Probability:
% - starts in v0 (1 bit)
% - Multiply by Q^4 (more 4 bits generated = 5)
% - Multiply by R (jump to F, end of sequence)
prob_5_bits = R * (Q^4) * v0;

% Show result in percentage
fprintf('Result: %.4f%%\n', prob_5_bits * 100);