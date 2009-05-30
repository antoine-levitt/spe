function Y=iter_m3(N, X)
	global PARAMS
	Y = (X + N * X) ./ repmat((sum(N) + 1)', 1, PARAMS.d);
	% TODO rendre matrice d'iteration
