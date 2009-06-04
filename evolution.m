% visualisation des résultats
function evolution(A, Xs)
    global PARAMS;
    N = neighbours(A, Xs{end}, PARAMS.iterations);
    n_agents = length(A);
    visu = [];
    for t = 1:PARAMS.iterations
        for i = 1:n_agents
            visu(t,i) = norm(Xs{t}(i,:));
        end
    end

	subplot(1,2,1)
    plot(visu);
	subplot(1,2,2)
    plotgraph(N, visu(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
    
    %subplot(2,2,2)
    %plotgraph(A, visu(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
    %subplot(2,2,4)
    %v = v(:,ind)
    %plotgraph(N, v, cellstr(num2str((1:n_agents)')));
