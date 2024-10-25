function [X, y] = load_dataset(path)
  % path -> a relative path to the .mat file that must be loaded
  
  % X, y -> the training examples (X) and their corresponding labels (y)
  
  %Deschidem fisierul
   input = fopen(path, "r");
   
   if input == -1
   	error("Fisierul nu a putut fi deschis");
   endif
   
   fisier = load(path);
   %Atribuim matricei X campul X care se gaseste in fisierul dat
   X = fisier.X;
   %Atribuim vectorului y campul y care se gaseste in fisierul dat
   y = fisier.y;
endfunction
