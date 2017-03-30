clc;
clear;

n = 100; % n points
X = linspace(-5,5,n)';
Y = 2*X + 2*sin(X) + 1.5*randn(n,1);

scatter(X,Y)
hold

gamma = 1;
C = 1;
K = gaussian_kernel(X,X,gamma);
w = linear_regression_l2(K,Y,C);
K1 = [K, ones(n,1)];
plot(X, K1*w)