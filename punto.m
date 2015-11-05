function A = punto(C,D)
A=0;
  for i = [1:length(C)]
    A+=C(i)*D(i);
  endfor
end
