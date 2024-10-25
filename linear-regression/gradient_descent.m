function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights


  %Initializam vectorul Theta
  Thetaa = zeros(n, 1);
  Theta = zeros(n, 1);
  
  %In vectorul Delta vom retine derivatele partiale in raport cu fiecare coeficient
  
  Delta = zeros(n, 1);
  Theta2 = zeros(n + 1, 1);
  
  for j = 1:n
    suma = 0;
  for i = 1:m
    %Se calculeaza valorea prezisa
    h = FeatureMatrix(i, :) * Theta2(2:end);
    result = h - Y(i);
    produs = result * FeatureMatrix(i, j);
    suma += produs;
  endfor 
  
    coef = 1 / m;
    delta = coef * suma;%Se calculeaza derivata partiala
    Delta(j) = delta;%Derivatele partiale se retin intr-un vector
  endfor 
  
  for j = 1:n
  theta = 0;
  p = alpha * Delta(j);
  
  for k = 1:iter
    theta -= p;
  endfor
    Thetaa(j) = theta;
  endfor 
  
  Theta = vertcat(0, Thetaa);
  
endfunction

