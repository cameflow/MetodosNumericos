
######## Función principal
function [R,E,M]=operaMatrices(A,B,N)  
    #If para hacer una función dependiendo del valor de N
    if N==0
      if !mismaDimension(A,B);
		    R = -1;
		    E = 1;
		    M = "No se puede realizar la suma";
      else
		    R = sumaM(A,B);
		    E = 0;
		    M = "";
      endif;
    elseif N==1
      if !mismaDimension(A,B);
        R = -1;
        E = 1;
        M = "No se puede realizar la resta";
      else
        R = restaM(A,B);
        E = 0;
        M = "";
      endif;
    elseif N==2
      if (size(A, 2) == size(B, 1)) #Comparación para saber si se pueden multiplicar las matrices
        R = multiM(A,B);
        E = 0;
        M = "";
      else
        R = -1;
        E = 1;
        M = "No se pueden multiplicar las matrices";
      endif;
    elseif N==3
      R = media_desivacion(A);
      E = 0;
      M = "";
    elseif N==4
      R = maximo_minimo_C(A);
      E=0;
      M="";
    else
      R = -1;
      E = 1;
      M = "No se especifico operación para esa opción"
    endif;
end

#Función que checa si las dimensiones son iguales
function r = mismaDimension(A, B)
  a = (size(A, 1) == size(B, 1));
  b = (size(A, 2) == size(B, 2));
  r = a && b;
end

#Función de suma
function r = sumaM(A,B) 
  for i = 1 : size(A, 1)
    for j = 1 : size(A, 2)
      A(i, j) = B(i, j) + A(i, j);
    endfor;
  endfor;
  r = A; 
end

#Función de resta
function r = restaM(A, B)
   for i = 1 : size(A, 1)
    for j = 1 : size(A, 2)
      A(i, j) = A(i,j) - B(i, j);
    endfor;
  endfor;
  r = A; 
end

#Función de multiplicación
function r = multiM(A, B)
  r = zeros(size(A, 1), size(B, 2)); 
  n = A(1,1);
   for m = 1 : size(A, 1)
     for x = 1 : size(B, 2)
       for n = 1 : size(A, 2)
          r(m, x) = r(m, x) + A(m, n) * B(n, x);
       endfor;
    endfor;
  endfor; 
end

#Función para las medias y la desviación estandar
function r = media_desivacion(A)
  r = [medias(A) desviacion(A)];
end

#Función para sacar las medias
function r = medias(A)
  m = size(A, 1);
  n = size(A, 2);
  A = sumaF(A);
  r = zeros(m, 1);
  for i = 1 : m
    r(i, 1) = A(i,1) / n;
  endfor;
end

#Función que suma las filas
function r = sumaF(A)
  sum = 0;
  r = zeros(size(A, 1), 1);
  for i = 1: size(A, 1)
    for j = 1: size(A, 2)
      sum = sum + A(i, j);
    endfor;
    r(i, 1) = sum;
    sum =0;
  endfor;
end

#Función para la desviación estandar
function r = desviacion(A)
  r = zeros(size(A, 1), 1);
  varianzaF = varianza(A);
  for i = 1: size(varianzaF, 1)
    r(i, 1) = sqrt(varianzaF(i, 1));
  endfor;
end

#Función para la varianza
function r = varianza(A)
  m = size(A, 1);
  n = size(A, 2);
  medias = medias(A);
  r = zeros(m, n);
  for i = 1 : m
    for j = 1: n
      r(i, j) = (A(i, j) - medias(i, 1)) ** 2;
    endfor;
  endfor;
  r = sumaF(r);
  for i = 1: size(r, 1)
    r(i, 1) = r(i, 1) / n ;
  endfor;
end


#Función para el máximo y mínimo de una columna
function r =  maximo_minimo_C(A)
  r = [maximoC(A); minimoC(A)]; 
end

#Función que saca el máximo de la columna
function r = maximoC(A)
  max = 0;
  r = zeros(1, size(A, 2)); 
  for i = 1 : size(A, 2)
    max = A(1, i);
    for j = 1 : size(A,1)
      if (A(j, i) > max)
        max = A(j, i);
      endif;
    endfor;
    r(1, i) = max;
  endfor;
end

#Función que saca el mínimo de una columna
function r = minimoC(A)
  min = 0;
  r = zeros(1, size(A, 2)); 
  for i = 1 : size(A, 2)
    min = A(1, i);
    for j = 1 : size(A,1)
      if ( A(j, i) < min)
        min = A(j, i);
      endif;
    endfor;
    r(1, i) = min;
  endfor; 
end
