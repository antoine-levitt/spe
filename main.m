addpath 'graphs';
addpath 'plot';

% paramètres
global PARAMS
PARAMS.gstyle = 2;
PARAMS.rho = 0.999;
PARAMS.alpha = 0.999;
PARAMS.method = 5;
PARAMS.d = 1;
PARAMS.r = 0.3;
PARAMS.iterations = 300;

% le graphe
zachari;
A = A + A';
n_agents = size(A,1);

%les calculs
[Xs, U] = compute_model(1 * rand(n_agents, PARAMS.d), A);

% analyse de clusters
clusters(A, Xs, U);

% évolution temporelle
evolution(A, Xs);

% analyse des variances
%variances(A, Xs);
