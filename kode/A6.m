
polynomial = [1, 6, 2, -35, -19, 72, 0, -27];
A = compan(polynomial);
for i=1:1
  A = schur(A);
  # [Q R] = qr(A);
  # A = R * Q;
endfor
diag(A)
