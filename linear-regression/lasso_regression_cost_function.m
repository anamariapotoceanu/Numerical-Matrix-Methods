function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function


  m = size(FeatureMatrix, 1);
  prod = 0;
  %Calculam valoarea prezisa conform formulei
  for i = 1:m
    h = FeatureMatrix(i, :) * Theta(2:end);
    result = Y(i) - h;
    prod += result * result;
  endfor

  coef = 1 / m;
  term1 = coef * prod;
  norma = norm(Theta, 1);
  %Calculam eroarea conform formulei
  Error = term1 + lambda * norma;
endfunction
