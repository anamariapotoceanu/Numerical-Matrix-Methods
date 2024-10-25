function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  n = size(FeatureMatrix, 2);
  
  Theta = zeros(n, 1);
  
  %Matricea A din algortim este de fapt FeatureMatrix' * FeatureMatrix
  
  X = FeatureMatrix';
  A = X * FeatureMatrix;
  
  %Verificam daca matricea este pozitiv definita, folosind functia chol
  %Daca R esste un numar intreg diferit de 0, atunci nu este pozitiv definita
  
  [~, R] = chol(A);
  if R != 0
    Theta = vertcat(0, Theta);
    return;
  endif

  b = X * Y;
  x0 = zeros(n, 1);
  
  %Implementarea pseudocodului prezentat
  
  rprev = b - A * x0;
  
  vprev = rprev;
  
  Theta = x0;
  
  tolsq = tol * tol;
  
  k = 1;
  
  while k <= iter && rprev' * rprev > tolsq
  
    rprod = rprev' * rprev;
    
    tk = (rprev' * rprev) / (vprev' * (A * vprev));
    
    produs = tk * vprev;
    
    Theta += produs;
    
    rprev -= tk * (A * vprev);
    
    %rprev va avea o noua valoare, vom calcula noul produs rprev' * rprev
    rprodnew = rprev' * rprev;

    sk = rprodnew / rprod;
    
    var = sk * vprev;
    
    vprev = rprev + var;
    
    rprev = rprev; %Se modifica valorea lui rprev
    k++;
    
  endwhile

   %Theta0 se considera 0, deci il vom adauga pe prima pozitie in vector

   Theta = vertcat(0, Theta);

endfunction


