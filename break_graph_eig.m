function [node_list, B] = break_graph_eig(A)

	global PARAMS
	laplace = true;

	%U = iter(A, 1);
	U = full(diag(sum(A))-A);

	
	[vectp, valp] = eig(U);

	valp = diag(valp);
	[valp, perm] = sort(valp);
	vectp = vectp(:, perm);

	if laplace
		valp=valp(2);
		vectp = vectp(:,2);
	else
		valp(abs(valp-1)<1e-10) = [];
		vectp(:, (length(valp)+1):end) = [];

		valp(valp < PARAMS.rho) = [];
		vectp(:, 1:(size(vectp, 2)-length(valp))) = [];
	end
	
	if length(valp) == 0
		node_list{1} = 1:length(U);
		B = A;
		return
	end

	if length(valp) == 1
		disp(vectp')

		B = A;
		node_list{1} = find(vectp > 0);
		node_list{2} = find(vectp <= 0);
		for i = node_list{1}
			B(i, node_list{2}) = 0;
			B(node_list{2}, i) = 0;
			return
		end
	end




	if length(valp) > 1
		fprintf('Length(valp) = %g\n', length(valp));
		disp(valp)
		error('!');
	end
