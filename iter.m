% renvoie la matrice d'iteration
% On alors X(t) = U * X(t-1) + V
function [U, V] = iter(N, t)
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
		% moyenne sur tout le voisinage + bruit
		n = size(N, 1);
		U = (eye(n, n) + N) ./ repmat((sum(N) + 1)', 1, n);
		V = 2*PARAMS.alpha*(rand(n,PARAMS.d)-0.5);

	case 5
		% correction avec le voisinage, pondéré par alpha fonction de t
		n = size(N, 1);
		L = diag(sum(N)) - N;
		U = (eye(n) - give_me_alpha(t) * L);
		V = zeros(n, PARAMS.d);
	end

function a = give_me_alpha(t)
    global PARAMS;
	a=1/t;
