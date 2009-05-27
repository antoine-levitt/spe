function Y=iter_m3(N, X)
    Y = (X + N * X) ./ (sum(N) + 1)';
