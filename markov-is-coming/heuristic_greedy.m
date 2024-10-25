function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  n = size(Adj, 1);

  %Vom initializa un vector coloana in care retinem calea catre WIN
  path = [];

  %Avem nevoie de un vector visited, in care retinem daca celula a fost vizitata
  visited = false(n, 1);

  dim = length(path) + 1;

  %Adugam pozitia de start in vector

  path(dim, 1) = start_position;

  visited(start_position, 1) = true;

  while length(path) > 0

    %Selectam ultimul element din vector
    position = path(end);
  
    %Daca ajungem in starea de WIN, ne oprim
    if position == n - 1;
      return;
    endif
  
    p = 1;
  
    for j = 1:n - 1
    %Verificam daca mai avem vecini nevizitati
      if Adj(position, j) != 0 && visited(j, 1) == false
      p = 0;
      endif
    endfor
 
    %Daca toti vecinii au fost vizitati, stergem elementul din vector
    if p == 1
      path(end) = [];
    endif

    max = -1;
    %Verificam care vecin are probabilitatea mai mare

   for j=1:n - 1
     if Adj(position, j) != 0 && visited(j, 1) == false
       if probabilities(j) > max
       max = probabilities(j);
       neigh = j;
       endif
     endif
   endfor
 
   %Vecinul cu probabilitatea mai mare va fi adaugat in vector
   visited(neigh, 1) = true;

   path(length(path) + 1, 1) = neigh;
 
   endwhile

endfunction
