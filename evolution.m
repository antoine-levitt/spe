% visualisation des résultats
function evolution(A, Xs, node_list, B)
    global PARAMS;
    N = neighbours(A, Xs{end}, PARAMS.iterations);
    n_agents = length(A);
    visu = [];
    for t = 1:PARAMS.iterations
        for i = 1:n_agents
            visu(t,i) = norm(Xs{t}(i,:));
        end
    end


	subplot(2,1,2)
	hold off
    plot(visu);
	subplot(2,2,1)
	cla
    plotgraph(N, visu(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
	subplot(2,2,2)
	cla
	eigcolors(1, node_list{1}) = 1;
	eigcolors(1, node_list{2}) = 10;
    plotgraph(B, eigcolors, cellstr(num2str((1:n_agents)')));
    
    %subplot(2,2,2)
    %plotgraph(A, visu(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
    %subplot(2,2,4)
    %v = v(:,ind)
    %plotgraph(N, v, cellstr(num2str((1:n_agents)')));
