function L = potenciaLista(lista,N)
  x = size(lista ,2);
  i = 1;
  while i < x+1
    lista(i) = lista(i)**N;
    i = i+1;
  end;
  L=lista;
end
