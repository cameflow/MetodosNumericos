##########################
#Función que convierta de cualquier base a cualquier base
#Recibe:
  #Número a convertir
  #Base del número a convertir
  #Base a la cual se quiere convertir
  #Número de decimales que se queire en el resultado
##########################

function [A,E] = convierte(x, y, z, d)
  numBase10 = convierteABase10(x,y);
  numBaseFinal = convierteDeBase10(mat2str(numBase10),z,d);
  A = numBaseFinal;
  E = numBase10 - convierteABase10(numBaseFinal,z);
end

#Regresa un valor flotante con el número en base 10
#Recibe un string que es el número y una base que es un int
function R = convierteABase10(x,base)
  tam = length(x);

  #Chequeo por si la base es mayor a 10 cambiar las letras por números
  arregloNum = cell(1,tam); #Creación de arreglo con los números
  for i = 1:tam
    arregloNum(i) = cellstr(x(i));
  endfor
  if (base > 10) #Si la base es mayor a 10 sustituir las letras por números
    for i=1:tam
      switch x(i)
        case "A"
					arregloNum(i) = "10";
				case "B"
					arregloNum(i) = "11";
				case "C"
					arregloNum(i) = "12";
				case "D"
					arregloNum(i) = "13";
				case "E"
					arregloNum(i) = "14";
				case "F"
					arregloNum(i) = "15";
      end
    endfor
  endif

  posPunto = -1;
  total = 0;

  #for que recorre la palabra para encontrar donde está el punto
  for i = 1:tam
    if(x(i)==".")
      posPunto = i;
      break;
    endif
  endfor
  tienePunto = true;
  if(posPunto == -1)
    tienePunto = false;
    posPunto = tam+1;
  endif
  #for que convierte a base10 la parte entera
  exponente = 0;
  i = posPunto-1;
  while (i>0)
    total = total + str2num(cell2mat(arregloNum(i)))*base^exponente;
    exponente++;
    i--;
  endwhile

  #La variable total Tiene la parte entera en base 10

  if(tienePunto)
    #for que convierte a base10 la parte decimal
    j = posPunto+1;
    exponente = -1;
    while (j<=tam)
      total = total + str2num(cell2mat(arregloNum(j)))*base^exponente;
      exponente--;
      j++;
    endwhile
  end
  #Total te regresa un valor flotante.
  R = total;
end

#Regresa un string
#Recibe un string, una base a la cual se va a convertir y los decimales que se quiere guardar
function R = convierteDeBase10(x,base,decimales)
  tam = length(x);
  posPunto = -1;
  total = "";
  temp = "";
  num1 = 0;
  enteroString = "";

  #for que recorre la palabra para encontrar donde está el punto
  for i = 1:tam
    if(x(i)==".")
      posPunto = i;
      break;
    endif
  endfor

  tienePunto = true;
  if(posPunto == -1)
    tienePunto = false;
    posPunto = tam+1;
  endif

  i = posPunto-1;
  while(i>0)
    temp = strcat(x(i),temp);
    i--;
  endwhile
  #Temp tiene la parte entera en base 10 guardada como string
  num1 = str2num(temp);
  enteroString = temp;
  #Num1 tiene la parte entera en número
  temp = "";
  result = 0;
  resid = 0;
  residuoString = "";
  resultadoTemp = 0;
  resultadoTemp = num1;
  while(true)
    result = fix(resultadoTemp/base);
    resid = mod(resultadoTemp,base);
    residuoString = mat2str(resid);
    if(base > 10)
      switch resid
        case 10
          residuoString = "A";
        case 11
          residuoString = "B";
        case 12
          residuoString = "C";
        case 13
          residuoString = "D";
        case 14
          residuoString = "E";
        case 15
          residuoString = "F";
      end
    endif
    temp = strcat(residuoString,temp);
    resultadoTemp = result;
    if(result < base)
      temp = strcat(mat2str(result),temp);
      break;
    endif
  endwhile
  #Temp tiene el número entero de la nueva base en forma de String
  if(tienePunto)
    tempPuntoDecimal = "0.";
    j = posPunto+1;
    while(j<=tam)
      tempPuntoDecimal = strcat(tempPuntoDecimal,x(j));
      j++;
    endwhile
    #tempPuntoDecimal tiene la parte decimal base 10 guardada como string

    parteDecimal = str2num(tempPuntoDecimal);
    #ParteDecimal tiene la parte decimal de base 10 pero como número
    parteDecimalString=".";
    variableSuperTemporal = 0;
    varX  = parteDecimal;
    temporalString = "";

    for j=1:decimales
      variableSuperTemporal = varX * base;
      temporalString = mat2str(fix(variableSuperTemporal));
      if(base >  10)
        switch temporalString
          case "10"
            temporalString = "A";
          case "11"
            temporalString = "B";
          case "12"
            temporalString = "C";
          case "13"
            temporalString = "D";
          case "14"
            temporalString = "E";
          case "15"
            temporalString = "F";
        end
      end
      parteDecimalString = strcat(parteDecimalString,temporalString);
      varX = variableSuperTemporal - fix(variableSuperTemporal);
    endfor
    numeroCompletoString = strcat(temp,parteDecimalString);
    R = numeroCompletoString;
  else
    R = temp;
  end
end
