clc;
clear;

f = @(x) (x(1)-1)^2 + (x(2) - 2)^2 + 3;
df = @(x) 2*(x-[1;2]);

x_init = -5 + 10.*rand(2,1);
max_iter = 20;
alpha = 0.25; % (0,0.5)
beta = 0.5; % (0,1)

[optimal_value, optimal_point] = gradient_descent(f, df, x_init, max_iter, alpha, beta)
