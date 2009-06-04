function [Xs, U] = compute_model(x0, A)
    global PARAMS;
    n_agents = size(A, 1);

    Xs = cell(PARAMS.iterations, 1);
    Xs{1} = x0;

    for t = 2:PARAMS.iterations
        % calculer N
        N = neighbours(A, Xs{t-1}, t);
        % iteration
        [U, V] = iter(N,t);
		Xs{t} = U * Xs{t-1} + V;
    end
