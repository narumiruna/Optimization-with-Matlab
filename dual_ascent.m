function [x, y] = dual_ascent( f, df, A, b, y_init , max_iter, alpha)
% http://stanford.edu/~boyd/papers/pdf/admm_slides.pdf
[~, n] = size(A);
x = randn(n, 1);
y = y_init;

xmin_max_iter = 20;
xmin_alpha = 0.25;
xmin_beta = 0.5;

for i=1:max_iter
    % x-minimization
    l = @(x) f(x) + y' * (A * x - b);
    dl = @(x) df(x) + A' * y;
    [~, x] = gradient_descent(l ,dl, x, xmin_max_iter, xmin_alpha, xmin_beta);
                          
    % dual update
    y = y + alpha * (A * x - b);
end
end