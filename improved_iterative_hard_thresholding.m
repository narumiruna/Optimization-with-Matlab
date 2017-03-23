function [optimal_val, optimal_point] = improved_iterative_hard_thresholding(f, df, n , s, alpha_0, sigma, beta, epsilon, max_iter)
% http://www.personal.soton.ac.uk/hdqi/REPORTS/IIHT.pdf
% Step 1
x = zeros(n,1);
update = @(x, alpha) projection(x - alpha * df(x), s);
for k=1:max_iter
    % Step 2
    t = 1;
    while f(update(x, alpha_0*t)) > f(x) - (sigma/2)*norm(update(x, alpha_0*t) - x)^2
        t = t * beta;
    end
    x = update(x, alpha_0*t);
    
    %% Step 3
     supp = x~=0;
     grad = df(x);
     if norm(grad - supp .* grad) <= epsilon
         break;
     end
end
optimal_val = f(x);
optimal_point = x;
end

function x_proj = projection(x, s)
% P_{R_+}
x = x - (x<0) .* x;
% P_{S_+}
[~ , I] = sort(x, 'descend');
x_proj = zeros(size(x));
for i=1:s
    x_proj(I(i)) = x(I(i));
end
end
