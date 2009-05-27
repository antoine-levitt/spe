addpath 'graphs';
addpath 'plot';

% paramètres
global PARAMS
PARAMS.r = 1;
PARAMS.rho = 1;
PARAMS.alpha = 0.05;
PARAMS.method = 2;
PARAMS.d = 1;

iterations = 800;

% le graphe
zachari;
A = A + A';

n_agents = size(A, 1);

Xs = cell(iterations, 1);
Xs{1} = rand(PARAMS.d, n_agents);

for t = 2:iterations
    % calculer N
    N = neighbours(A, Xs{t-1}, t);
    % iteration
    Xs{t} = iter(N, Xs{t-1});
end

% plotter les résultats
res = [];
for t = 1:iterations
    somme = sum(Xs{t}, 1);
    res(t, :) = somme;
end

plot(res);
