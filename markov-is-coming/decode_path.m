function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state



  dim = length(path) - 1;
  %Vom crea un vector cu doua coloane
  %Pe prima coloana retinem indicele randului, iar pe a doua indicele coloanei
  decoded_path = zeros(dim, 2);

  k = 1;
  for i = 1:dim
    index = path(k, 1);
    %Determinam indicii corespunzatori randului si coloanei si ii adaugam in vector
    row = ceil(index / cols);
    col = mod(index - 1, cols) + 1;
    decoded_path(k, 1) = row;
    decoded_path(k, 2) = col;
    k++;
  endfor
endfunction
