function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  input = fopen(file_path, "r");

  if input == -1
    error("Fisierul nu a putut fi deschis");
    return;
  endif

  %Citim dimensiunile matricei
  m = fscanf(input, "%d", 1);
  n = fscanf(input, "%d", 1);

  %Initializam vectorul coloana Y si matricea
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);

  for i = 1:m
    %Primul numar de pe fiecare rand va fi adaugat in vectorul coloana
  
    nr = fscanf(input, "%f", 1);
    Y(i)= nr;
    for j = 1:n
  
      %Citim urmatoarele numere pe care le adaugam in matrice
      aux = fscanf(input, "%s", 1);
    
      %Facem verificare daca avem un numar sau un sir de caractere
      if(isnumeric(aux))
         InitialMatrix{i, j} = str2double(aux);
      elseif
         InitialMatrix{i, j} = aux;
      endif
  
    endfor
  endfor

  fclose(input);

endfunction
