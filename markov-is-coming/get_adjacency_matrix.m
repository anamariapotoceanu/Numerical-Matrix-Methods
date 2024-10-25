function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  %Obtinem dimeniunile matricei

  row = size(Labyrinth, 1);

  coll = size(Labyrinth, 2);

  %Matricea de adiacenta va avea doua linii si doua coloane in plus pentru win si lose
  nr = row * coll + 2;

  %Formam o matrice rara
  Adj = sparse(nr, nr);

  for i = 1:row
    for j = 1:coll

    %Determinam indexul corespunzator celulei in care ne aflam
        index = j + (i - 1) * coll;

        nord = j + (i - 2) * coll; %indexul pentru nord
        sud = j + i * coll; %indexul pentru sud
        est = j + (i - 1) * coll + 1; %indexul pentru est
        vest = j + (i - 1) * coll - 1; %indexul pentru vest
        
        Adj(nr - 1, nr - 1) = 1; %adaugam 1 pe linia win
        Adj(nr, nr) = 1; %adaugam 1 pe linia lose
	
	%Cazurile cand ne aflam pe prima, respectiv ultima linie, vor fi tratate separat
	%8 -> 1000, avem zid la nordul celulei
        if i != 1
          if bitand(Labyrinth(i, j), 8) == 0
            Adj(index, nord) = 1;
          endif
        endif
       
       %Daca suntem pe prima linie si avem in celula 1000, inseamna ca exista starea win
        if i == 1
          if bitand(Labyrinth(i, j), 8) == 0
            Adj(index, nr - 1) = 1;
          endif
        endif
        
	%4 -> 0100, avem zid la sudul celulei
        if i != row
          if bitand(Labyrinth(i, j), 4)== 0
            Adj(index, sud) = 1;
          endif
        endif
        
        %Daca suntem pe ultima linie si intalnim 0100, vom avea starea win

        if i == row
          if bitand(Labyrinth(i, j), 4) == 0
            Adj(index, nr - 1) = 1;
           endif
        endif
     %2 -> 0010, avem zid la esttul celulei
        if j != coll
          if bitand(Labyrinth(i, j), 2) == 0
            Adj(index, est) = 1;
          endif
        endif
        
        %Ne aflam pe ultima coloana
        %Daca intalnim 0010, vom avea starea lose
        if j == coll
          if bitand(Labyrinth(i, j), 2) == 0
           Adj(index, nr) = 1;
           endif
        endif

     %1 -> 0001, avem zid la vestul celulei
        if j != 1
          if bitand(Labyrinth(i, j), 1) == 0
            Adj(index, vest) = 1;
          endif
        endif

	%Daca suntem pe prima linie si intalnim 0001, avem starea lose
        if j == 1
          if bitand(Labyrinth(i, j), 1) == 0
            Adj(index, nr) = 1;
          endif
        endif

     endfor
  endfor
  
endfunction
