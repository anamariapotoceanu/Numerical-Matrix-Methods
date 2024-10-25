function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function


  %Obtinem dimeniunile matricei
  m = size(FeatureMatrix, 1);
  n = size(FeatureMatrix, 2);
  
  prod = 0;
  
  for i = 1:m
    h = FeatureMatrix(i, :) * Theta(2:end);
    result = h - Y(i);
    prod += result * result;
  endfor

  coef = 1 / (2 * m);
  %Calculam primul termen din formula
  term1 = coef * prod;
  sum = 0;
  for j = 2:n
    %Calculam suma patratelor fiecarui element din vectorul Theta
    sum += Theta(j) * Theta(j);
  endfor
  Error = term1 + lambda * sum;
endfunction
