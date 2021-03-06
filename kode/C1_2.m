# gradient descent
function [X] = C1_2(X, alpha, n_iters)
  TOL = 1e-7;
  [g] = gradF(X);
  n = 0
  for i=1:n_iters
    [g] = gradF(X)
    if(g < TOL)
      printf("num iters: %d\n", n);
      g
      break;
    endif
    X = X + alpha * g;
    n+=1;

  endfor
endfunction

function [g] = gradF(X)
  w = X(1);
  x = X(2);
  y = X(3);
  z = X(4);
  g = [-2*w + x + 1 ; w - 2*x + y + 2; x - 2*y + z + 2 ; y - 2*z + 1];
endfunction

function [f] = F(X)
  w = X(1);
  x = X(2);
  y = X(3);
  z = X(4);
  f = (w+1)*(x+1) + (x+1)*(y+1) + (y+1)*(z+1) - w*w - x*x - y*y - z*z;
endfunction