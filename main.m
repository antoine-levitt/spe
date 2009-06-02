addpath 'graphs';
addpath 'plot';

% paramètres
global PARAMS
PARAMS.gstyle = 2;
PARAMS.rho = 0.89;
PARAMS.alpha = 0.4;
PARAMS.method = 2;
PARAMS.d = 1;
PARAMS.r = 3;
PARAMS.iterations = 300;

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
[n_clusters, distrib] = n_concomp(N);

format short g
fprintf('%d clusters, N == A ? %d\n', full(n_clusters), full(pristine));
valp = sort(eig(iter(A)));
valp(abs(valp-1)<1e-10) = [];
fprintf('"Connectivite" de A: %g (rho : %g)\n', valp(end), PARAMS.rho);
fprintf('----------------------------------\n');
if n_clusters > 1
	clusters = split_clusters(N, distrib, Xs{end});
	for i = 1:n_clusters
		local_U = U(clusters{i}.members,:);
		local_U = local_U(:,clusters{i}.members);
		valp = sort(eig(local_U));
		valp(abs(valp-1)<1e-10) = [];
		fprintf('"Connectivite" pour le groupe %g : %g\n', i, valp(end));
		fprintf('[ ');
		for j = find(clusters{i}.members)
			fprintf('%g ', j);
		end
		fprintf(']\n');
	end
end
format


%subplot(2,2,1)
%plot(sommes);
%subplot(2,2,2)
%plotgraph(A, sommes(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
%subplot(2,2,3)
% plotgraph(N, sommes(PARAMS.iterations,:), cellstr(num2str((1:n_agents)')));
%subplot(2,2,4)
%v = v(:,ind)
%plotgraph(N, v, cellstr(num2str((1:n_agents)')));


if PARAMS.d == 1
	for t = 1:PARAMS.iterations
		vars(t) = sqrt(var(Xs{t}));
	end

	% calculer la pente de la variance
	p = polyfit(PARAMS.iterations-100:PARAMS.iterations, log(vars(PARAMS.iterations-100:PARAMS.iterations)), 1);
        plot(1:PARAMS.iterations, log10(vars(1:PARAMS.iterations)));
        hold on
        plot(log10(PARAMS.r * (PARAMS.rho .^ (1:PARAMS.iterations))), 'r');
	% plot(PARAMS.iterations-100:PARAMS.iterations, log10(vars(PARAMS.iterations-100:PARAMS.iterations)));
	% coefficient de decroissance
	exp(p(1))
end
