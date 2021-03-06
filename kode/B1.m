function [x, err, y, a ,b] = B1(x)
u = x(1);
v = x(2);
w = x(3);

F = @(u, v, w) [2 * u ^ 2 - 4 * u + v ^ 2 + 3 * v * w ^ 2 + 6 *w - 2; u ^ 2 * v + v ^ 2 - 2 * v + 2 * w ^ 2 - 3; 3 * u ^ 2- 12 * u + u * v ^ 2 + 3 * w ^ 2 + 2];
J = @(u, v, w) [4 * u - 4, 2 * v + 3 * w ^ 2, 6 * v * w + 6; 2 * u * v, u ^ 2 + 2 * v - 2, 4 * w; 6 * u + v ^ 2 - 12, 2 * u* v, 6 * w];

a = J(u, v, w);
b = F(u, v, w);

d =  a \ -b
#[L U p] = LUwPivot(a, -b)
#x2 = backward_sub(U, -b)
#d2 = -a .^ -1 * b

x = x + d';
y = F(x(1), x(2), x(3));
err = norm(y);
endfunction