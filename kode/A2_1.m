2;

function y = f(x)
  y = x * x - cos(pi * x);
endfunction

function y = fprime(x)
  y = 2 * x + pi * sin(pi * x);
endfunction

xCoordinate = -5:0.1:5;
yCoordinate = -5:0.1:5;
[n n] = size(xCoordinate);

for i=1:n
  yCoordinate(i) = fprime(xCoordinate(i));
endfor
  
#plot(xCoordinate, yCoordinate);
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
  tolerance /= 2.0
  iteration = 0;
  do
    bf = x
    iteration += 1;
    # printf("Used the line y = %fx\n", fprime(x));
    x = x - f(x)/fprime(x);
  until (abs(x - bf) < tolerance)
  root = x;
  iteration
endfunction

bisection(0.2, 0.8, 1e-2)
bisection(0.2, 0.8, 1e-4)
bisection(0.2, 0.8, 1e-8)
bisection(0.2, 0.8, 1e-16)

bisection(-0.5, -0.1, 1e-2)
bisection(-0.5, -0.1, 1e-4)
bisection(-0.5, -0.1, 1e-8)
bisection(-0.5, -0.1, 1e-16)

newton(-0.6, 1e-2)
newton(-0.6, 1e-4)
newton(-0.6, 1e-8)
newton(-0.6, 1e-16)

newton(0.4, 1e-2)
newton(0.4, 1e-4)
newton(0.4, 1e-8)
newton(0.4, 1e-16)