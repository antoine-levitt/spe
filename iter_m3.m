function Y=iter_m3(N, X)
    global PARAMS
    L = diag(sum(N)) - N;
    D = diag(sum(N>0));
    Y = (eye(size(N)) - L * ((eye(size(N)) + D).^-1)) * X;
