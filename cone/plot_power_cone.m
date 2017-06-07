function [] = plot_power_cone()
a = 0.5;
b = 0.5;

xlin = linspace(0, 4);
ylin = linspace(0, 4);
[X, Y] = meshgrid(xlin, ylin);

Z = (X .^ a) .* (Y .^ b);

surf(X, Y, Z); hold;
surf(X, Y, - Z);
colormap jet

xlabel('x');
ylabel('y');
zlabel('z');
axis([0, 2, 0, 2, -2, 2])
end