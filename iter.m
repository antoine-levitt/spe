% renvoie la matrice d'iteration
function U = iter(N)
    global PARAMS;
    switch PARAMS.method
	case 1
		L = diag(sum(N)) - N;
		U = (eye(length(N)) - PARAMS.alpha * L);
	case 2
		L = diag(sum(N)) - N;
		som = sum(N);
		som = som + (som == 0);
		U = (eye(length(N)) - PARAMS.alpha * diag(som.^-1) * L);
	case 3
		n = size(N, 1);
		U = (eye(n, n) + N) ./ repmat((sum(N) + 1)', 1, n);
	end
