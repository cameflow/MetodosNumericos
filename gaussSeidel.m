function X1 = gaussSeidel(X,eps)
  E = 1;
  while E == 1
    X2 = X;
    X1(1) = g1(X1);
    X1(2) = g2(X1);
    X1(3) = g3(X1);
    X1(4) = g4(X1);

    E = error(X,X1,eps);
    X = X1;
  endwhile
end
