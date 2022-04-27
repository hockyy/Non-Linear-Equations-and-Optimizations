4;

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
  
#plot(xCoordinate, yCoordinate);
#title ("Simple 2-D Plot");
#xlabel ("x");
#ylabel ("sin (x)");

function root = secant(fi, se, tolerance)
  tolerance /= 2.0;
  iteration = 0;
  do
    iteration += 1;
    # printf("Used the line y = %fx\n", fprime(x));
    x = se - (f(se) * (se - fi) / (f(se) - f(fi)));
    fi = se;
    se = x;
  until (abs(fi - se) < tolerance)
  root = se;
  iteration
endfunction

secant(2, 3, 1e-2)
secant(2, 3, 1e-4)
secant(2, 3, 1e-8)
secant(2, 3, 1e-16)