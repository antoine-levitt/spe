global PARAMS
PARAMS.gstyle = 2;
PARAMS.rho = 0.947;
PARAMS.alpha = 0.4;
PARAMS.method = 2;
PARAMS.d = 1;
PARAMS.r = 1;
PARAMS.iterations = 400;

rho= linspace(0.8,1,25);
r = linspace(0.1,5,25);

zachari;
A = A + A';

n_agents = size(A, 1);

trials = 5;
tmp = zeros(1,trials);

z = zeros(length(rho), length(r));

for i = 1:length(rho)
    for j = 1:length(r)
        PARAMS.rho = rho(i);
        PARAMS.r = r(i);
        for k = 1:trials
            x0 = 1 * rand(n_agents, PARAMS.d);
            [Xs, U] = compute_model(x0, A);
            N = neighbours(A, Xs{end}, PARAMS.iterations);
            tmp(k) = n_concomp(N);
        end
        z(i, j) = mean(tmp);
    end
end

surfc(r, rho, z);
% c'est pas a l'envers, cf HELP SURF
