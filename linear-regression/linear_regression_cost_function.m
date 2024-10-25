function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function


  %Numarul de linii
  m = size(FeatureMatrix, 1);
  %Vom adauga la prod, de fiecare data, termenul la puterea a doua din formula
  prod = 0; 

  for i = 1:m
    %Calculam valoarea prezisa
    %Aceasta se calculeaza facand produsul dintre un rand al matricei si coeficientii(weights)
    h = FeatureMatrix(i, :) * Theta(2:end);
    result = h - Y(i);
    prod += result * result;
  endfor

  coef = 1 / (2 * m);
  %Calculam eroarea conform formulei
  Error = coef * prod;
endfunction
