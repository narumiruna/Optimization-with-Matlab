function [w] = linear_regression_l2(A, Y, C)
[m,n] = size(A);
A1 = [A, ones(m,1)];
w_init = randn(n+1,1);

f = @(w) (1/2)*(norm(A1*w - Y)^2 + C*norm(w)^2);
df = @(w) A1'*(A1*w - Y) + C*w;

max_iter = 200;
alpha = 0.25;
beta = 0.5;
[~, w] = gradient_descent(f, df, w_init, max_iter, alpha, beta);
end