function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

 
  steps = 0;
  prev_x = x0;

  while 1
    %Calculam x conform formulei din tema
    x = G * prev_x + c;
  
    dif = x - prev_x;
    %Calculam eroarea
    err = norm(dif);

    steps = steps + 1;
    %Avem doua conditii de oprire steps == max_steps sau err < tol
    if steps == max_steps
       return;
    endif

    if err < tol
      return;
    endif

    prev_x = x;

  endwhile
endfunction
