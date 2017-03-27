clc;
clear;
y_init = 3;
max_iter = 10;
alpha = 0.2;

f = @(x) x(1)^2 + x(2)^2;
df = @(x) [2*x(1); 2*x(2)];
A = [3, 1];
b = 1;

[optimal_value, optimal_point] = dual_ascent( f, df, A, b, y_init , max_iter, alpha);

f = @(x) (x(1)+1)^2 + (x(2)-1)^2 + (x(3)-1)^2;
df = @(x) [2*(x(1)+1);2*(x(2)-1);2*(x(3)-1)];
A = [0,0,0];
b = 0;
[optimal_value, optimal_point] = dual_ascent( f, df, A, b, y_init , max_iter, alpha);