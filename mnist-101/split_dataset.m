function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  m = size(X, 1);
  
  %Generam o ordine random pentru randurile din matrice
  
  index  = randperm(m);
  
  %Retinem in X_aux noua matrice care va avea randurile interschimbate
  
  X_aux = X(index, :);
  
  %Retinem in y_aux noul vector care va avea randurile interschimbate
  
  y_aux = y(index);
  
  %Calculam numarul de linii care va fi distribuit in "train"
  
  per = percent * m;
  new_row = per + 1;
  
  %Primele per linii se vor pune in X_train, iar celelalte vor fi adugate in X_test
  for i = 1:per
    X_train(i, :) = X_aux(i, :);
  endfor

  X_test = X_aux(new_row:end, :);
  
  %Primele per linii se vor pune in y_train, iar celelalte vor fi adugate in y_test
  for i = 1:per
    y_train(i, 1) = y_aux(i, :);
  endfor
  
    y_test = y_aux(new_row:end, :);
 
endfunction
