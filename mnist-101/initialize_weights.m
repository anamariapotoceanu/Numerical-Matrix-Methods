function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  
  sum = L_prev + L_next;
  numitor = sqrt(sum);
  numarator = sqrt(6);
  e = numarator / numitor;
  %Calculam e pentru a obtine intervalul din care vom genera numerele aleatorii

 sum_e = 2 * e;
  %Ne folosim de functia rand pentru a genera o matrice cu elemente aleatorii
  matrix = -e + sum_e .* rand(L_next, L_prev + 1);
endfunction


