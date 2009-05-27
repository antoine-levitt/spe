function Y=iter_m2(N, X)
    global PARAMS
    L = diag(sum(N)) - N;
    som = sum(N);
    som = som + (som == 0);
    Dm1 = diag(som.^-1);
    Y = X - X * PARAMS.alpha * Dm1 * L;
