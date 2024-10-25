function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
 

  %Dimensiunile matricei
  row = size(InitialMatrix, 1);
  coll = size(InitialMatrix, 2); 

  %Initializam matricea numai cu zerouri
  FeatureMatrix = zeros(row, coll);

  for i = 1:row
    for j = 1:coll
    %Daca nu regasim niciun sir de caractere, transformam elementul in numar
     if !strcmp(InitialMatrix{i, j}, 'semi-furnished') && !strcmp(InitialMatrix{i, j}, 'unfurnished') && !strcmp(InitialMatrix{i, j}, 'furnished') && !strcmp(InitialMatrix{i, j}, 'yes') && !strcmp(InitialMatrix{i, j}, 'no')
      nr = InitialMatrix{i, j};
      FeatureMatrix(i, j) = str2double(nr);
     endif
    
    endfor
  endfor

  for i = 1:row
    for j = 1:coll 
     %Verificam daca avem string-ul "yes", respectiv "no"
     if strcmp(InitialMatrix{i, j}, 'yes')
       FeatureMatrix(i, j) = 1;
     endif
      
     if strcmp(InitialMatrix{i, j}, 'no')
        FeatureMatrix(i, j) = 0;
     endif
      
     endfor
  endfor

  for i = 1:row
    for j = 1:coll
       new_coll = coll +1;
       %In ultimul caz, in matrice putem regasi trei string-uri posibile
       %Valorea din celula cu string-ul respectiv devine 1 sau 0, dupa caz
       %Mutam toate elementele cu o pozitie pentru a putea adauga o noua coloana
       if strcmp(InitialMatrix{i, j}, 'semi-furnished')
       FeatureMatrix(i, j) = 1;
       FeatureMatrix(i, j+1 : new_coll) = FeatureMatrix(i, j:coll);
       FeatureMatrix(i, j + 1) = 0;
      endif

      if strcmp(InitialMatrix{i, j}, 'unfurnished')
        FeatureMatrix(i, j) = 0;
       FeatureMatrix(i, j+1 : new_coll) = FeatureMatrix(i, j:coll);
        FeatureMatrix(i, j + 1) = 1;
      endif
      
      if strcmp(InitialMatrix{i, j}, 'furnished')
       FeatureMatrix(i, j) = 0;
       FeatureMatrix(i, j+1 : new_coll) = FeatureMatrix(i, j:coll);
       FeatureMatrix(i, j + 1) = 0;
       endif
    endfor
  endfor

endfunction

