function y = gaussian_kernel(A, B, gamma)
% K(A,B) = \exp(-\gamma * || A - B ||^2)
m = size(A, 1);
n = size(B, 1);
norm_square = ones(m,1)*sum(B.^2, 2)' - 2*(A*B') + sum(A.^2, 2)*ones(1,n);
y = exp(-gamma * norm_square);
end
