function [X,E,iter] = newtonRaphson(x0,eps,maxit)
  cont = 0;  %Variable que cuenta las iteracionse
  resultado = x0; %Asignación del resultado par que empieze en el valor de x0
  err = 0;    %El error inicial
  valorAnterior = x0; %Variable para saber el valor anterior y calcular el error
  converge = false;
  while (cont < maxit)   %Se hace el ciclo menos del número de veces que de iteraciones que se pidio
    resultado = resultado-(f(resultado)/df(resultado)); %Calcula el resultado
    err = resultado-valorAnterior;      %Calcula el error
    valorAnterior = resultado;        %Asigna a valor anterior el valor actual
    if(abs(err) <= eps)  %Si el error ya es menor a el parámetro que se le pasó se termina el ciclo
      %Se asignan los valores que se regresan
      X= resultado;
      E = 0;
      iter = cont;
      converge = true;
      break;
    endif
    cont++; %Se aumenta el contador
  end
  if(!converge) %Revisa si se llego a un resultado en las operacines
    %Se asigna el valor a las variables
    X = 'El valor no converge';
    E = 1;
    iter = cont;
  endif
end
