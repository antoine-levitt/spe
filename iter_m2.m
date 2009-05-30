function [Y,U]=iter_m2(N, X)
    global PARAMS
    L = diag(sum(N)) - N;
    som = sum(N);
    som = som + (som == 0);
	U = (eye(length(X)) - PARAMS.alpha * diag(som.^-1) * L);
	Y = U*X;
    %Y = X - PARAMS.alpha * (L * X) ./ som';
