a = 0.5;
b = 0.5;

xlin = linspace(0, 2);
ylin = linspace(0, 2);
[X, Y] = meshgrid(xlin, ylin);

Z = (X .^ a) .* (Y .^ b);

surf(X, Y, Z); hold;
surf(X, Y, - Z);
colormap jet

xlabel('x');
ylabel('y');
zlabel('z');