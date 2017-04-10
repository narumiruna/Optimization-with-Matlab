function [optimal_val, optimal_point] = improved_iterative_hard_thresholding(f, df, n , s, alpha_0, sigma, beta, epsilon, max_iter)
% http://www.personal.soton.ac.uk/hdqi/REPORTS/IIHT.pdf
%% Step 0
% initial point
x = zeros(n,1);

% x^k(\alpha)
update = @(x, alpha) projection(x - alpha * df(x), s); 

for k=1:max_iter
    %% Step 1
    t = 1; % \beta^{q_k}
    while f(update(x, alpha_0*t)) > f(x) - (sigma/2)*norm(update(x, alpha_0*t) - x)^2
        t = t * beta;
    end
    x = update(x, alpha_0*t);
    fprintf('#%d: optimal value: %f, optimal point: %s\n', k, f(x), mat2str(x));

    %% Step 2
    if norm(df(x) .* (x~=0)) <= epsilon
        break;
    end
end
optimal_val = f(x);
optimal_point = x;
end

function y = projection(x, s)
% P_{R_+}
x = x .* (x>0);
% P_{S_+}
[~ , I] = sort(x, 'descend');
y = zeros(size(x));
for i=1:s
    y(I(i)) = x(I(i));
end
end
