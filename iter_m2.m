function Y=iter_m2(N, X)
    global PARAMS
    L = diag(sum(N)) - N;
    som = sum(N);
    som = som + (som == 0);
    Y = X - PARAMS.alpha * (L * X) ./ som';
