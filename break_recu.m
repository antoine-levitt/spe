function [node_list, B] = break_recu(A, recursing, laplace_max_clusters)

	global PARAMS

	if ~(exist('laplace_max_clusters'))
		laplace_max_clusters = 2;
	end
	if ~(2^nextpow2(laplace_max_clusters) == laplace_max_clusters)
		error('max clusters is not a power of 2');
	end

	% utiliser la Laplacienne, pas la matrice d'iteration
	laplace = PARAMS.laplace;

	% séparer selon le plus grand écart, pas en 0
	max_gap = PARAMS.max_gap;

	if laplace
		U = full(diag(sum(A))-A);
	else
		U = iter(A);
	end

	
	[vectp, valp] = eig(U);
	valp = diag(valp);

	[valp, perm] = sort(valp);
	vectp = vectp(:, perm);
	disp(valp')

	if length(valp) == 1
		node_list{1} = 1:length(A);
		B = A;
		return
	end

	if laplace
		valp=valp(2);
		vectp = vectp(:,2);
	else
		valp=valp(end-1);
		vectp = vectp(:,(end-1));
	end

	if (valp < PARAMS.rho && ~laplace) || (laplace && laplace_max_clusters == 1)
		node_list{1} = 1:length(A);
		B = A;
		return
	else
		if max_gap
			sorted_vectp = sort(vectp(:,end));
			[dummy, i_max] = max(abs(sorted_vectp(2:end) - sorted_vectp(1:(end-1))));
			threshold = sorted_vectp(i_max);

			tmp_node_list{1} = find(vectp(:,end) > threshold);
			tmp_node_list{2} = find(vectp(:,end) <= threshold);
		else
			tmp_node_list{1} = find(vectp(:,end) > 0);
			tmp_node_list{2} = find(vectp(:,end) <= 0);
		end


		A1 = A(tmp_node_list{1}, tmp_node_list{1});
		A2 = A(tmp_node_list{2}, tmp_node_list{2});

		if laplace
			l1 = break_recu(A1, 1, laplace_max_clusters/2);
			l2 = break_recu(A2, 1, laplace_max_clusters/2);
		else
			l1 = break_recu(A1, 1);
			l2 = break_recu(A2, 1);
		end
		for i = 1:length(l1)
			node_list{i}=tmp_node_list{1}(l1{i});
		end
		for i = 1:length(l2)
			node_list{i + length(l1)}=tmp_node_list{2}(l2{i});
		end


		if exist('recursing')
			B = [];
		else
			B = A;
			for i = 1:length(node_list)
				aliens = setdiff(1:length(A), node_list{i});
				B(node_list{i}, aliens) = 0;
				B(aliens, node_list{i}) = 0;
			end
			fprintf('Analyse spectrale : %g cluster(s)\n', length(node_list));
		end
	end
