function node_list = break_graph_eig(U, rho, )

	global PARAMS
	
	[vectp, valp] = eig(U);

	valp = diag(valp);
	[valp, perm] = sort(valp);
    valp(abs(valp-1)<1e-10) = [];
	valp(valp < rho) = [];
	vectp = vectp(:, perm);
	perm(:, (length(valp)+1):end) = [];
	
	if length(valp) == 0
		node_list{1} = 1:length(U);
		return
	end

	if length(valp) == 1
		node_list{1} = find(perm > 0);
		node_list{2} = find(perm <= 0);
		return
	end

	error("plus de 2 clusters");
