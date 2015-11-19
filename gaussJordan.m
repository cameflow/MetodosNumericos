% Alejandro Terrazas
% Solución de sistemas de ecuaciones con Gauss Jordan

% A es la matriz de coeficientes
% b son los términos constantes
% op para seleccionar la opción.
function [x, Ainv, d, solucion] = gaussJordan(A, b, op)
x = 0;
Ainv = 0;
d = 0;
solucion = 1;

if (!validaMatrix(A))
  solucion = 0;
  return;
endif

switch(op)
case 1
  x = solve(A, b);
  solucion = 1;
case 2
  [Ainv, d] = Inversa(A);
  solucion = 2;
otherwise
  return;
endswitch
end

% Función que revisa que la matriz sea válida
% Checa si el rango de la matriz es igual al número de columnas para saber si es válido.
function R = validaMatrix(A)
  R= (rank(A) == size(A, 2));
end

% Función que ajusta el pivote de la columna para que sea el mayor
% Regresa la nueva matriz y el número de cambios que se hizo
function [ANS, flips] = adjustPivotInCol(A, col, n)
  R = col;
  max = A(col, col);
  flips = 0;
  for (i = col+1:n )
    if(abs(A(i, col)) > max)
      max = A(i, col);
      R   = i;
      flips++;
    endif
  endfor
  if(i != col)
    b = A(col, :);
    A(col, :) = A(R, :);
    A(R, :)   = b;
    ANS = A;
  endif
end

% Resuelve el sistema de utilizando Gauss Jordan
% Regresa la última columna que es la que tiene la solución
function R = solve(A, b)
  n = size(A, 2);
  A = [A b];
  R = gaussJordanAlgo(A, n);
  R = R(:, n+1);
end

% Algoritmo de Gaus Jordan
% Pone el determinante en 1
function [output, det] = gaussJordanAlgo(A, n)
  det = 1;
  for (i = 1 : n)
    [A, b] = adjustPivotInCol(A, i, n); % Ajusta el pivote para que sea el mayor
    det = det * ((-1) ** b);
    diagonalEntry = A(i, i); % Valor que hay en la columna actual en la diagonal
    det = det *  diagonalEntry;
    A(i, :) = A(i, :) / diagonalEntry;
    for (j = 1 : n)
      if(i != j)
        A(j, :) = A(j, :) - A(j, i)* A(i, :); % Va modificando las filas para que se vuelva 0
      endif
    endfor
  endfor
  output = A;
end

% Obtener la inversa de la matríz%
function [inverseMatrix, det] = Inversa(A)
n = size(A, 2);
A = [A eye(n)];
s = size(A, 2);

[A, det] = gaussJordanAlgo(A, n);
inverseMatrix = A(1:n, n+1:s);
end
