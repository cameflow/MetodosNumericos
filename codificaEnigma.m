function M = codificaEnigma(matriz,lista)
  A=zeros(size(matriz));
  for i = 1 : size(matriz, 1)
   for j = 1 : size(matriz, 2)
     x = matriz(i,j);
     matriz(i, j) = lista(x+1);
   endfor;
  endfor;
  M=matriz
end
