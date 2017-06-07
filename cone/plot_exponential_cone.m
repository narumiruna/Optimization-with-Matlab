function [] = plot_exponential_cone()
xlin = linspace(1, - 2);
ylin = linspace(0, 2);
[X, Y] = meshgrid(xlin, ylin);

Z = arrayfun(@boundary, X, Y);

C = X .* Y;
surf(X, Y, Z, C);
colormap jet

xlabel('x');
ylabel('y');
zlabel('z');
axis([-2, 1, 0, 2, 0, 2])
end

function z = boundary(x, y)
zmax = 3;
if y > 0
    z = y * exp(x / y);
else
    z = zmax;
end
z = min(z, zmax);
end