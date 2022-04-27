birdf = @(x, y)(sin(y) .* exp((1 - cos(x)).^2) + cos(x) .* exp((1 - sin(y)).^2) + (x-y).^2);
x = -10:0.1:0;  % define range and mesh of x and y which will be shown in figure
y = -10:0.1:0;
[X, Y] = meshgrid(x, y);
keepind = (X + 5).^2 + (Y + 5).^2 > 25;
X(keepind) = NaN;
Y(keepind) = NaN;
surf(X, Y, birdf(X, Y));
colormap default