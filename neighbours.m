% renvoie la matrice d'adjacence modifiée à partir de A et de x, à l'instant t; x est une matrice dont les colonnes sont les x_i
function N = neighbours(A, x, t)
    global PARAMS;
	switch PARAMS.method
	case {1, 2, 3, 5}
		upper_bound = PARAMS.r * PARAMS.rho ^ (t-1);
	case 4
		upper_bound = PARAMS.r;
	end
    N = full(A);
    [row, col] = find(A);
    for i = 1:numel(row)
        if norm(x(row(i), :) - x(col(i), :)) > upper_bound
            N(row(i), col(i)) = 0;
        end
    end
