addpath 'graphs';
addpath 'plot';

% paramètres
global PARAMS
PARAMS.gstyle = 2;
PARAMS.rho = 0.94;
PARAMS.alpha = 0.4;
PARAMS.method = 2;
PARAMS.d = 1;
PARAMS.r = 3;
PARAMS.iterations = 400;

% le graphe
zachari;
A = A + A';

n_agents = size(A,1);

[Xs, U] = compute_model(1 * rand(n_agents, PARAMS.d), A);

% plotter les résultats
sommes = [];
vars = [];
for t = 1:PARAMS.iterations
    for i = 1:n_agents
        sommes(t,i) = norm(Xs{t}(i,:));
    end
end

N = neighbours(A, Xs{end}, PARAMS.iterations);
pristine = all(all(A==N));
n_clusters = n_concomp(N);

fprintf('%d clusters, N == A ? %d\n', full(n_clusters), full(pristine));

%subplot(2,2,1)
%plot(sommes);
%subplot(2,2,2)
%plotgraph(A, sommes(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
%subplot(2,2,3)
plotgraph(N, sommes(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
%subplot(2,2,4)
%v = v(:,ind)
%plotgraph(N, v, cellstr(num2str((1:n_agents)')));


%if PARAMS.d == 1
%	for t = 1:PARAMS.iterations
%		vars(t) = var(Xs{t});
%	end
%
%	% calculer la pente de la variance
%	p = polyfit(PARAMS.iterations-100:PARAMS.iterations, log(vars(PARAMS.iterations-100:PARAMS.iterations)), 1);
%	% plot(PARAMS.iterations-100:PARAMS.iterations, log(vars(PARAMS.iterations-100:PARAMS.iterations)));
%	% coefficient de decroissance
%	exp(p(1))
%end
