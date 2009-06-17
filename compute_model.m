function [Xs, U] = compute_model(x0, A)
    global PARAMS;
    n_agents = size(A, 1);

    Xs{1} = x0;
	if PARAMS.animate
		evolution(A, Xs, [], [])
		F(1) = getframe;
	end

    for t = 2:PARAMS.iterations
        % calculer N
        N = neighbours(A, Xs{t-1}, t);
        % iteration
        [U] = iter(N);
        Xs{t} = U * Xs{t-1};
		if PARAMS.animate
			evolution(A, Xs, [], [])
			F(t) = getframe;
		end
    end


	if PARAMS.animate
		movie(F)
	end
