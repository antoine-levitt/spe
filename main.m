addpath 'graphs';
addpath 'plot';

% paramètres
global PARAMS
PARAMS.r = 2;
PARAMS.rho = 0.95;
PARAMS.alpha = 0.029;
PARAMS.method = 1;
PARAMS.d = 1;

iterations = 200;

% le graphe
zachari;
A = A + A';

n_agents = size(A, 1);

Xs = cell(iterations, 1);
Xs{1} = 1 * rand(n_agents, PARAMS.d);

for t = 2:iterations
    % calculer N
    N = neighbours(A, Xs{t-1}, t);
    % iteration
    Xs{t} = iter(N, Xs{t-1});
end

% plotter les résultats
sommes = [];
vars = [];
for t = 1:iterations
	for i = 1:n_agents
    sommes(t,i) = norm(Xs{t}(i,:));
	end
end

subplot(1,2,1)
plot(sommes);
subplot(1,2,2)
plotgraph(A, sommes(iterations,:));


if PARAMS.d == 1 && false
	for t = 1:iterations
		vars(t) = var(Xs{t});
	end

	% calculer la pente de la variance
	p = polyfit(iterations-100:iterations, log(vars(iterations-100:iterations)), 1);
	% plot(iterations-100:iterations, log(vars(iterations-100:iterations)));
	% coefficient de decroissance
	exp(p(1))
end
