function [ optimal_value, optimal_point ] = gradient_descent( f, df, x_init, max_iter, alpha, beta )
x = x_init;
it = 0;
while it < max_iter
    % gradient
    dx = -df(x);
    
    % backtracking line search
    t = 1;
    while f(x+t*dx) > f(x) - alpha*t*(dx'*dx)
        t = beta*t;
    end
    
    % update
    x = x + t*dx;
    it = it + 1;
    
    % print current status
%     fprintf('iteration: #%d, optimal value: %f, optimal point: %s.\n', it, f(x), mat2str(x));
end
optimal_value = f(x);
optimal_point = x;
end

