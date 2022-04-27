2;

% Program 2.3 Broyden’s Method I
% Input: initial vector x0, max steps k
% Output: solution x
% Example usage: broyden(f,[1;1],10)
function x=broyden(f,df,x0,k)
  [n,m]=size(x0);
  A=df(x0) % initial A
  for i=1:k
    x=x0-A^-1*f(x0);
    del=x-x0;delta=f(x)-f(x0);
    A=A+(delta-A*del)*del'/(del'*del);
    x0=x;
    i
    err = norm(f(x), 2)
  end
endfunction

% Program 2.3 Broyden’s Method II
% Input: initial vector x0, max steps k
% Output: solution x
% Example usage: broyden2(f,[1;1],10)
function x=broyden2(f,df,x0,k)
  [n,m]=size(x0);
  b=I % initial b
  for i=1:k
    x=x0-b*f(x0);
    del=x-x0;delta=f(x)-f(x0);
    b=b+(del-b*delta)*del'*b/(del'*b*delta);
    x0=x;
  end
endfunction

df=@(x) [4 * x(1) - 4, 2 * x(2) + 3 * x(3) ^ 2 , 6 * x(2) * x(3) + 6;
  2 * x(1) * x(2), x(1) ^ 2 + 2 * x(2) - 2, 4 * x(3);
  6 * x(1) - 12 + x(2)^2, 2 * x(1) * x(2), 6 * x(3)];

f=@(x) [2 * x(1) ^ 2 - 4 * x(1) + x(2) ^ 2 + 3 * x(2) * x(3)^2 + 6 * x(3) - 2;
x(1)^2 * x(2) + x(2) ^ 2 - 2 * x(2) + 2 * x(3) ^ 2 - 3;
3 * x(1)^2 - 12 * x(1) + x(1) * x(2)^2 + 3 * x(3)^2 + 2];

x0 = rand(3, 1) * 3
x0 = [0.5111;0.4755;1.8644]
   
x = broyden(f,df,x0,20)
error = f(x)
   
# x = broyden2(f,df,x0,10)
# error = f(x)