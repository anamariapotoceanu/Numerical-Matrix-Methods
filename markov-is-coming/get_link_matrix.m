function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  Aux = get_adjacency_matrix(Labyrinth);

  dim = size(Aux);
  row = dim(1);
  coll = dim(2);

  %Vom crea un vector in care vom retine sumele de pe fiecare linie

  sums = zeros(1, size(Aux, 1));

  %Vom matricea rara Link

  Link = sparse(row, coll);
  %Parcurgem fiecare linie si calculam suma elementelo
  l = 1;
  while l <= size(Aux, 1)
     s = 0;
     for j = 1:coll
     s += Aux(l, j);
  endfor
  sums(1, l) = s;
  l++;
  endwhile

  %Unde intalnim 1 in matricea de adiacenta, inlocuim cu probabilitatea corespunzatoare

  k = 1;
  for i = 1:row
    for j = 1:coll
    if Aux(i, j) == 1
      Aux(i, j) = 1 / sums(k);
    endif
  endfor
  k++;
  endfor

  %Link devine Aux
  for i = 1:row
    for j = 1:coll
    Link(i, j) = Aux(i, j);
  endfor

  endfor
endfunction
