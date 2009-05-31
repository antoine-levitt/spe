function n_clusters = main(rho, r, doplots)

addpath 'graphs';
addpath 'plot';

% paramètres
global PARAMS
PARAMS.gstyle = 1;
PARAMS.rho = 0.947;
PARAMS.alpha = 0.4;
PARAMS.method = 2;
PARAMS.d = 1;
PARAMS.r = 1;

if nargin==2
	PARAMS.rho = rho;
	PARAMS.r = r;
end

if nargin < 3
	doplots = true;
end

%format short g
fprintf('rho:%g, alpha: %g, r: %g, d: %g\n', PARAMS.rho, PARAMS.alpha, PARAMS.r, PARAMS.d)
%format

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
    [Xs{t}, u] = iter(N, Xs{t-1});
end

% plotter les résultats
sommes = [];
vars = [];
for t = 1:iterations
	for i = 1:n_agents
    sommes(t,i) = norm(Xs{t}(i,:));
	end
end

n_clusters = n_concomp(N);
return


%[v, d]  = eig(u);
%
%[vals, perm] = sort(diag(d));
%
%ind = perm(n_agents-2);
%%disp(vals(n_agents-2))
%
%disp(vals')
%
%
%disp(eig(N)')
%disp(sum(eig(N)==0))
%
%n_clusters = sum(vals==vals(n_agents-1));

if doplots
%	subplot(2,2,1)
%	plot(sommes);
%	subplot(2,2,2)
%	plotgraph(A, sommes(iterations,:), cellstr(num2str((1:n_agents)')));
%	subplot(2,2,3)
	plotgraph(N, sommes(iterations,:), cellstr(num2str((1:n_agents)')));
%	subplot(2,2,4)
	%v = v(:,ind)
%	plotgraph(N, v, cellstr(num2str((1:n_agents)')));
end


%if PARAMS.d == 1 && false
%	for t = 1:iterations
%		vars(t) = var(Xs{t});
%	end
%
%	% calculer la pente de la variance
%	p = polyfit(iterations-100:iterations, log(vars(iterations-100:iterations)), 1);
%	% plot(iterations-100:iterations, log(vars(iterations-100:iterations)));
%	% coefficient de decroissance
%	exp(p(1))
%end
