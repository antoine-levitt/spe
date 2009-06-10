% renvoie la matrice d'iteration
% On alors X(t) = U * X(t-1)
function [U] = iter(N)
    global PARAMS;
    switch PARAMS.method
      case 1
        % correction avec le voisinage, pondérée par alpha
        n = size(N, 1);
        L = diag(sum(N)) - N;
        U = (eye(n) - PARAMS.alpha * L);
        V = zeros(n, PARAMS.d);

      case 2
        % correction avec le voisinage, pondérée par alpha et le cardinal du voisinage
        n = size(N, 1);
        L = diag(sum(N)) - N;
        som = sum(N);
        som = som + (som == 0);
        U = (eye(n) - PARAMS.alpha * diag(som.^-1) * L);
        V = zeros(n, PARAMS.d);

      case 3
        % moyenne sur tout le voisinage
        n = size(N, 1);
        U = (eye(n, n) + N) ./ repmat((sum(N) + 1)', 1, n);
        V = zeros(n, PARAMS.d);
        
      case 4
        %matrice de modularite
        n = size(N, 1);
        d = sum(N);
        P = d * d' ./ 2 ./ sum(d) - N;
        U = eye(n, n) - PARAMS.alpha * P;
        
      case 5
        %matrice de modularite norm�e
        n = size(N, 1);
        d = sum(N);
        P = d * d' ./ 2 ./ sum(d) - N;
        d = d + (d == 0);
        U = eye(n, n) - PARAMS.alpha * diag(d.^(-1)) * P;
    end
