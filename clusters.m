% fait l'analyse des clusters
function clusters(A, Xs, U)
    global PARAMS;
    % nombre de clusters finaux
    N = neighbours(A, Xs{end}, PARAMS.iterations);
    pristine = all(all(A==N));
    [n_clusters, distrib] = n_concomp(N);

    % calcule les connectivités des différents clusters
    format short g
    fprintf('%d clusters, N == A ? %d\n', full(n_clusters), full(pristine));
    valp = sort(eig(iter(A)));
    valp(abs(valp-1)<1e-10) = [];
    fprintf('"Connectivite" de A: %g (rho : %g)\n', valp(end), PARAMS.rho);
    fprintf('----------------------------------\n');
    if n_clusters > 1
        clusters = split_clusters(N, distrib, Xs{end});
        for i = 1:n_clusters
            local_U = U(clusters{i}.members,:);
            local_U = local_U(:,clusters{i}.members);
            valp = sort(eig(local_U));
            valp(abs(valp-1)<1e-10) = [];
			if (length(valp) == 0)
				fprintf('Groupe %g (agent [%g]) isole\n', i, find(clusters{i}.members));
			else
				fprintf('"Connectivite" pour le groupe %g : %g\n', i, valp(end));
				fprintf('[ ');
				for j = find(clusters{i}.members)
					fprintf('%g ', j);
				end
				fprintf(']\n');
			end
        end
    end
    format
