2;

function y = f(x)
  y = x ^ x - x - 7;
endfunction

function y = fprime(x)
  y = ( x ^ x ) * (1 + log(x)) - 1;
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
  tolerance /= 2.0;
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

bisection(1, 3, 1e-2)
bisection(1, 3, 1e-4)
bisection(1, 3, 1e-8)
bisection(1, 3, 1e-16)


newton(2, 1e-2)
newton(2, 1e-4)
newton(2, 1e-8)
newton(2, 1e-16)