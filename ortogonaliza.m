function [VO, R] = ortogonaliza(V, eps)
%Inicialización de la matríz resultado
VO = [V(:,1)];
%Inicialización del rango
R = 1;
%Variable para las diferntes proyecciones de los vectores columna
x = 0;

	%Comienzo del for en la segunda columna ya que la primera es la que se toma como referencia
	for i=2:columns(V)
		for j=1:columns(VO)
			%Se hace la proyección
			x += (dot( V(:,i),VO(:,j) ) / dot( VO(:,j),VO(:,j) )) * VO(:,j);
		endfor
		%Se saca el vector octogonal
		vectorE = V(:,i) - x;
    %Se vuelve a poner la proyección en 0 para volver a usar la variable
		x = 0;

		%Se obtiene la magnitud del vector
		magnitud = sqrt(sum(vectorE.^2));

		%Si La magnitud es mayor al error se guarda en la matriz y se aumenta el rango
		%Si es menor no se toma en cuenta ese vector
		if(magnitud > eps)
			VO(:,R+1) = vectorE;
			R++;
		endif
	endfor
end
