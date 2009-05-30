function [Y,U]=iter_m1(N, X)
    global PARAMS
    L = diag(sum(N)) - N;
	U = (eye(length(X)) - PARAMS.alpha * L);
	Y = U*X;
    %Y = X - PARAMS.alpha * L * X;
