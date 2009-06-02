function clusters = split_clusters(A, distrib, Xt)

	% calcule les matrices d'adjacences des composantes connexes du graph
	% représenté par la matrice d'adjacence A.
	% distrib est un vecteur d'entiers donnant pour chaque noeud l'indice de la composante
	% connexe auquelle il appartient (utiliser n_concomp)

	for i = 1:max(distrib)
		tmp = A(distrib==i,:);
		clusters{i}.adj = tmp(:,distrib==i);
		clusters{i}.X = Xt(distrib==i,:);
		clusters{i}.members = distrib==i;
	end
