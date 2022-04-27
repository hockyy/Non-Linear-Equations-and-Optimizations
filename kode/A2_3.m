2;

function y = f(x)
  y = (x-1)^2 * (x+3)^3 * (x^2-x-1);
endfunction

function y = fprime(x)
  y = x * (x - 1) * (x + 3)^2 * (7 * x^2 + x - 16);
endfunction

function y = fdiv(x)
  y = ((x-1) / (7 * x^2 + x - 16)) * ((x + 3) * (x^2 - x - 1) / x)
endfunction

xCoordinate = 0.1:0.1:5;
yCoordinate = 0.1:0.1:5;
[n n] = size(xCoordinate);

for i=1:n
  yCoordinate(i) = fprime(xCoordinate(i));
endfor
  
plot(xCoordinate, yCoordinate);
#title ("Simple 2-D Plot");
#xlabel ("x");
#ylabel ("sin (x)");

function root = bisection(left, right, tolerance)
  display("doing bisection ...")
  iteration = 0;
  signright = sign(f(right));
  middle = left;
  do
    iteration += 1;
    lastmiddle = middle;
    middle = (left + right) / 2.0;
    result = f(middle);
    if(sign(result) == signright) right = middle;
    else left = middle;
    endif
  
  until (lastmiddle == middle || right-left < tolerance)
  root = middle;
  iteration
endfunction

function root = newton(x, tolerance)
  iteration = 0;
  do
    bf = x
    iteration += 1;
    # printf("Used the line y = %fx\n", fprime(x));
    if(fprime(x) == 0) break; endif
    x = x - f(x)/fprime(x);
  until (abs(x - bf)*2 < tolerance)
  root = x;
  iteration
endfunction

bisection(-4, -2.5, 1e-2)
bisection(-4, -2.5, 1e-4)
bisection(-4, -2.5, 1e-8)
bisection(-4, -2.5, 1e-16)

bisection(-1, -0.5, 1e-2)
bisection(-1, -0.5, 1e-4)
bisection(-1, -0.5, 1e-8)
bisection(-1, -0.5, 1e-16)

bisection(0.5, 1, 1e-2)
bisection(0.5, 1, 1e-4)
bisection(0.5, 1, 1e-8)
bisection(0.5, 1, 1e-16)


bisection(1.5, 2, 1e-2)
bisection(1.5, 2, 1e-4)
bisection(1.5, 2, 1e-8)
bisection(1.5, 2, 1e-16)

newton(-3.5, 1e-2)
newton(-3.5, 1e-4)
newton(-3.5, 1e-8)
newton(-3.5, 1e-16)

newton(-0.5, 1e-2)
newton(-0.5, 1e-4)
newton(-0.5, 1e-8)
newton(-0.5, 1e-16)

newton(0.5, 1e-2)
newton(0.5, 1e-4)
newton(0.5, 1e-8)
newton(0.5, 1e-16)

newton(2, 1e-2)
newton(2, 1e-4)
newton(2, 1e-8)
newton(2, 1e-16)