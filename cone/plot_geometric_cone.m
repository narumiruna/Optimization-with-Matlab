function [] = plot_geometric_cone()
xlin = linspace(0, 2);
ylin = linspace(0, 2);
[X, Y] = meshgrid(xlin, ylin);

Z = arrayfun(@boundary, X, Y);

C = X + Y;
surf(X, Y, Z, C);
colormap jet

xlabel('x');
ylabel('y');
zlabel('z');
axis([0, 2, 0, 2, 0, 2])
end

function z = boundary(x, y)
% use newton method to find the value of z
max_iter = 50;

f = @(z) exp(- x / z) + exp(- y / z) - 1;
df = @(z) exp(- x / z) * x / z ^ 2 + exp(- y / z) * y / z ^ 2;

% let the initial value be the solution of f(z) = 0 when x = y
z = - (x + y) / (2 * log(1 / 2));
for i = 1:max_iter
    z = z - f(z) / df(z);
end
end
