function X1 = jacobi(X,eps)
  E = 1;
  while E == 1
    % X2 = X;
    X1(1) = g1(X);
    X1(2) = g2(X);
    X1(3) = g3(X);
    X1(4) = g4(X);

    E = error(X,X1,eps);
    X = X1;
  endwhile
end
