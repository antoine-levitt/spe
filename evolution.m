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


    %subplot(1,2,1)
    %hold off
    %plot(visu);
    %subplot(1,2,1)
    %cla
    %plotgraph(N, visu(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')), A);
    %subplot(1,2,2)
    cla
    for i = 1:length(node_list)
        eigcolors(1, node_list{i}) = i;
    end
    plotgraph(B, eigcolors, cellstr(num2str((1:n_agents)')), A);

    %subplot(2,2,2)
    %plotgraph(A, visu(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
    %subplot(2,2,4)
    %v = v(:,ind)
    %plotgraph(N, v, cellstr(num2str((1:n_agents)')));
