addpath 'graphs';
addpath 'plot';

% paramètres
global PARAMS
PARAMS.gstyle = 2;
PARAMS.rho = 0.951;
PARAMS.alpha = 0.08;
PARAMS.method = 1;
PARAMS.d = 1;
PARAMS.r = 3;
PARAMS.iterations = 400;
PARAMS.distrib = 'uni';
PARAMS.graph = 'zachari';
PARAMS.laplace = 0;
PARAMS.max_gap = 0;

% le graphe
switch PARAMS.graph
	case 'donjon'
	A = load_dotdot('graphs/dungeon_graph.dot');
	case 'dolph'
	A = load_dotdot('graphs/dolphins.dot');
	case 'zachari'
	zachari;
	A = A + A';
end

n_agents = size(A,1);

switch PARAMS.distrib
case 'uni'
	x0 = 1*rand(n_agents, PARAMS.d);
case 'gauss'
	sigma = eye(PARAMS.d);
	m = repmat(0.5, 1, PARAMS.d);
	x0 = mgd(n_agents, PARAMS.d, m, sigma);
	M0 = max(x0);
	m0 = min(x0);
	x0 = x0-repmat(m0, n_agents, 1);
	x0 = x0 * diag(ones(1, PARAMS.d)./(M0-m0));
end

%les calculs
[Xs, U] = compute_model(x0, A);
[i, B] = break_recu(A);

% analyse de clusters
clusters(A, Xs, U);

% évolution temporelle
evolution(A, Xs, i, B);

% analyse des variances
%variances(A, Xs);
