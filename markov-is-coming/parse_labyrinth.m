function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls
  

  %Deschidem fisierul primit pentru operatia de citire

  in = fopen(file_path, "r");

  %Verificam daca fisierul a putut fi deschis

  if in == -1
    rror("Fisierul dat nu a putut fi deschis");
    return;
  endif

  %Citim dimeniunile matricei, care se afla pe primul rand in fisier

  size = fscanf(in, "%d %d", 2);

  rows = size(1); %Numarul de randuri
  cols = size(2); %Numarul de coloane

  %Vom vrea o matrice plina cu zerouri, conform dimensiunilor

  Labyrinth = zeros(rows, cols);

  k = 1;
  %Citim urmatoarele randuri din fisier si formam matricea
  while k <= rows
    row = fscanf(in, "%d", cols); %Citim un rand intreg
    Labyrinth(k, :) = row; %Randul k din matrice va fi un randul citit din fisier
    k++;
  endwhile

  fclose(in);
endfunction
