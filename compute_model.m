function [Xs, U] = compute_model(PARAMS, x0, iterations, A)
    n_agents = size(A, 1);

    Xs = cell(iterations, 1);
    Xs{1} = x0;

    for t = 2:iterations
        % calculer N
        N = neighbours(A, Xs{t-1}, t);
        % iteration
        [Xs{t}, U] = iter(N, Xs{t-1});
    end
