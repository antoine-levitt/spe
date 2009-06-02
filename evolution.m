% visualisation des résultats
function evolution(A, Xs)
    global PARAMS;
    n_agents = length(A);
    visu = [];
    for t = 1:PARAMS.iterations
        for i = 1:n_agents
            visu(t,i) = norm(Xs{t}(i,:));
        end
    end

    plot(visu);
    
    %subplot(2,2,1)
    %subplot(2,2,2)
    %plotgraph(A, visu(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
    %subplot(2,2,3)
    % plotgraph(N, visu(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
    %subplot(2,2,4)
    %v = v(:,ind)
    %plotgraph(N, v, cellstr(num2str((1:n_agents)')));
