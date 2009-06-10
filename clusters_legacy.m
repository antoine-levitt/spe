function clusters_legacy(A)
	
	global PARAMS


	list = break_graph_eig(A, PARAMS.rho);
	for i = 1:length(list)
		disp(list{i}');
		fprintf('-----\n')
	end

	local_A = A(clusters{i}.members,:);
	local_A= local_A(:,clusters{i}.members);
