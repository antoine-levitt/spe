function Y=iter_m1(N, X)
    global PARAMS
    L = diag(sum(N)) - N;
    Y = X - X * PARAMS.alpha * L;
