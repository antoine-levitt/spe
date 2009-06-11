function clusters = clusterize(A, rho)

    addpath 'graphs';
    addpath 'plot';

    % paramètres
    global PARAMS
    PARAMS.gstyle = 2;
    PARAMS.alpha = 0.4;
    PARAMS.method = 2;
    PARAMS.d = 1;
    PARAMS.r = 1;
    PARAMS.iterations = 400;
    PARAMS.distrib = 'uni';
    
    PARAMS.rho = rho;
    
    zachari
    A = A + A';
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
    N = neighbours(A, Xs{end}, PARAMS.iterations);

    % séparer les clusters
    [n_clusters, distrib] = n_concomp(N);
    clusters = split_clusters(N, distrib, Xs{end});
