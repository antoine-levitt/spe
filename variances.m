function variances(A, Xs)
    global PARAMS;
    if PARAMS.d == 1
        vars = [];
        for t = 1:PARAMS.iterations
            vars(t) = sqrt(var(Xs{t}));
        end
        clf
        semilogy(vars(1:PARAMS.iterations));
        hold on
        semilogy(PARAMS.r * (PARAMS.rho .^ (1:PARAMS.iterations)), 'r');
    end
