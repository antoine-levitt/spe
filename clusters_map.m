global PARAMS
PARAMS.gstyle = 2;
PARAMS.rho = 0.947;
PARAMS.alpha = 0.4;
PARAMS.method = 4;
PARAMS.d = 1;
PARAMS.r = 1;
PARAMS.iterations = 400;

alpha = linspace(0.4, 0.6, 20);
rho= linspace(0.8,1,25);
r = linspace(0.1,5,25);

zachari;
A = A + A';

n_agents = size(A, 1);

trials = 50;
tmp = zeros(1,trials);

z = zeros(length(alpha));

for i = 1:length(alpha)
        PARAMS.alpha = alpha(i);
        for k = 1:trials
            x0 = 1 * rand(n_agents, PARAMS.d);
            [Xs, U] = compute_model(x0, A);
            N = neighbours(A, Xs{end}, PARAMS.iterations);
            tmp(k) = n_concomp(N);
        end
        z(i) = mean(tmp);
		fprintf('.')
end
fprintf('\n')


plot(alpha,z);
%surfc(r, rho, z);
% c'est pas a l'envers, cf HELP SURF
