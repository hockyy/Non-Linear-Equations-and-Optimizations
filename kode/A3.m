3;

function x = g(x)
  x = acos(x * x) / pi;
endfunction

function root = steffensen(x, tolerance)
  iteration = 0
  do
    bf = x;
    iteration += 1;
    # printf("Used the line y = %fx\n", fprime(x));
    # x = sqrt(cos(pi * x));
    # x = cos(pi * x) / x;
    # x = (cos((pi * x)/2)^2 - sin((pi * x)/2)^2)/x
    # x = (2 * cos(pi * x / 2)^2 - 1)/x;
    # x = acos(sqrt((x^2 + 1)/2)) * 2 / pi;
    # x = -sqrt(abs(cos(pi * x)))
    
    x1=g(x);
    x2=g(x1);
    % new initial guess:
    x = x - (x1 - x)^2 / (x2 - 2 * x1 + x);
    if(isnan(x))
      break;
    endif
  until (x == bf || abs(x - bf)*2 < tolerance)
  root = x;
  iteration
endfunction

function root = fpi(x, tolerance)
  iteration = 0;
  do
    bf = x;
    iteration += 1;
    # printf("Used the line y = %fx\n", fprime(x));
    # x = sqrt(cos(pi * x));
    # x = cos(pi * x) / x;
    # x = (cos((pi * x)/2)^2 - sin((pi * x)/2)^2)/x;
    # x = (2 * cos(pi * x / 2)^2 - 1)/x;
    # x = acos(x * x) / pi;
    x = acos(sqrt((x^2 + 1)/2)) * 2 / pi;
    if(isnan(x) || iteration > 100)
      break;
    endif
  until (x == bf || abs(x - bf)*2 < tolerance)
  root = x;
  iteration
endfunction


# steffensen(0.2,1e-7)

fpi(0.2,1e-7)