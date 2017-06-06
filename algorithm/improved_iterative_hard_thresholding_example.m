clc;
clear;

% Example 1
disp('==================================================')
disp('Example 2')
f = @(x) (x(1)+1)^2 + (x(2)-1)^2 + (x(3)-1)^2;
df = @(x) 2*[x(1)+1;x(2)-1;x(3)-1];

n = 3; % dimension
s = 2; % sparse number
alpha_0 = 0.5; % 0 < alpha < 1/L
sigma = 1; % sigma > 0
beta = 0.5; % 0 < beta < 1
epsilon = 1e-6; % epsilon > 0
max_iter = 100;

improved_iterative_hard_thresholding(f, df, n, s, alpha_0, sigma, beta, epsilon, max_iter);


% Example 2
disp('==================================================')
disp('Example 1')

n = 5; % dimension
scale = 10; % 
A = randn(n, n) .* scale;
Y = randn(n, 1) .* scale;

f = @(x) 0.5 * norm(A*x - Y)^2;
df = @(x) A'*(A*x-Y);

s = 2; % sparse number
alpha_0 = 0.5; % 0 < alpha < 1/L
sigma = 1; % sigma > 0
beta = 0.5; % 0 < beta < 1
epsilon = 1e-6; % epsilon > 0
max_iter = 100;

improved_iterative_hard_thresholding(f, df, n, s, alpha_0, sigma, beta, epsilon, max_iter);
