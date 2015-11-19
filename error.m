function E = error(X,X1,eps)
  E = 0;
  for i = 1:length(X)
    if abs(X(i)-X1(i)) >= eps
      E = 1;
      break;
    endif
  endfor
end
