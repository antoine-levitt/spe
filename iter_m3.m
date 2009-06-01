function [Y, U]=iter_m3(N, X)
    global PARAMS
    n = size(N, 1);
    U = (eye(n, n) + N) ./ repmat((sum(N) + 1)', 1, n);
    % Y = (X + N * X) ./ repmat((sum(N) + 1)', 1, PARAMS.d);
    Y = U * X;
