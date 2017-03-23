clc;
clear;

f = @(x) x(1)^2 + x(2)^2;
df = @(x) [2*x(1); 2*x(2)];
A = [3, 1];
b = 1;

y_init = 3;
max_iter = 20;
alpha = 0.1;

dual_ascent( f, df, A, b, y_init , max_iter, alpha)

f = @(x) (x(1)+1)^2 + (x(2)-1)^2 + (x(3)-1)^2;
df = @(x) [2*(x(1)+1);2*(x(2)-1);2*(x(3)-1)];
A = [0,0,0];
b = 0;
dual_ascent( f, df, A, b, y_init , max_iter, alpha)