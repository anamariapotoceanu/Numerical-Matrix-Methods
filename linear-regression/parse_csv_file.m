function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  input = fopen(file_path, "r");

  if input == -1
    error("Fisierul nu a putut fi deshis");
    return;
  endif


  fgets(input);

  %Citim toata matricea din fisier
  matrix = textscan(input, "%s", "Delimiter", "\n");

  m = length(matrix{1});

  %Selectam o linie din matrix care va fi impartita in mai multe cuvinte
  l = matrix{1}{1};

  %Cuvintele sunt adaugate intr-un vector
  tok = regexp(l, ',', 'split');

  n = length(tok);

  %Initializam vectorul si matricea

  Y = zeros(m, 1);
  InitialMatrix = cell(m, n - 1);
  p = 1;
  while p <= m
    line = matrix{1}{p};
    token =  regexp(line, ',', 'split');
    %Primul element de pe linie se adauga in vectorul Y
    aux = token{1};
    Y(p) = str2double(aux);
    p++;
  endwhile

  for i = 1:m
    line = matrix{1}{i};
    token =  regexp(line, ',', 'split');
    k = 1;
    %Ignoram primul element
    %Celelalte elemente se adauga in matrice
    for j = 2:n
     InitialMatrix{i, k} = token{j};
     k++;
    endfor
  endfor
endfunction

