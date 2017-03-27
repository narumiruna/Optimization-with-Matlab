function [optimal_value, optimal_point] = dual_ascent( f, df, A, b, y_init , max_iter, alpha)
% http://stanford.edu/~boyd/papers/pdf/admm_slides.pdf
y = y_init;

for i=1:max_iter
    % x-minimization
    x = argmin(f, df, A, b, y);
    
    % dual update
    y = y + alpha * (A * x - b);
    
    % print
    fprintf('iteration: #%d, optimal value: %f, optimal point: %s.\n', i, f(x), mat2str(x));
end

% recover
x = argmin(f, df, A, b, y);

% output
optimal_value = f(x);
optimal_point = x;
end

function x = argmin(f, df, A, b, y)
[~,n] = size(A);
l = @(x) f(x) + y' * (A * x - b);
dl = @(x) df(x) + A' * y;
x_init = -5 + 10 .* rand(n, 1);
max_iter = 20;
alpha = 0.25;
beta = 0.5;

[~, x] = gradient_descent(l ,dl, x_init, max_iter, alpha, beta);
end