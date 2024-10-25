function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  row = rows(Link);
  coll = columns(Link);
  dim1 = row - 2;
  dim2 = coll - 2;

  %Matricea de iteratie nu contine liniile si coloane pentru win si lose

  G = sparse(row - 2, coll - 2);

  %Vom crea matricea de iteratie
  for i = 1:dim1
    for j = 1:dim2
    G(i, j) = Link(i,j);
    endfor
  endfor

  %v va fi coloana corespunzatoare starii win
  v = Link(:, end - 1);

  %vectorul de iteratie nu contine datele pentru win si lose
  c = v(1:dim1, 1);
endfunction
