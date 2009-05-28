addpath 'graphs';
addpath 'plot';

% paramètres
global PARAMS
PARAMS.r = 1;
PARAMS.rho = 0.9;
PARAMS.alpha = 0.029;
PARAMS.method = 1;
PARAMS.d = 1;

iterations = 400;

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
    somme = sum(Xs{t}, 2);
    sommes(t, :) = somme;
end
plot(sommes);
for t = 1:iterations
    vars(t) = var(Xs{t});
end

% calculer la pente de la variance
p = polyfit(iterations-100:iterations, log(vars(iterations-100:iterations)), 1);
% plot(iterations-100:iterations, log(vars(iterations-100:iterations)));
% coefficient de decroissance
exp(p(1))
