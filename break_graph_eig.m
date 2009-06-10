function [node_list, B] = break_graph_eig(A)

	global PARAMS


	[node_list, B] = recursive_break(U, valp, vectp)
	
function [node_list, B, max_vp] = recursive_break(A, valp, vectp)

	global PARAMS

	laplace = true;
	max_gap = 1;

	if laplace
		U = iter(A, 1);
	else
		U = full(diag(sum(A))-A);
	end

	
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
		node_list{1} = 1:length(A);
		B = A;
		return
	else
		B = A;
		
		if max_gap
			sorted_vectp = sort(vectp);
			[dummy, i_max] = max(abs(sorted_vectp(:,(2:end)) - sorted_vectp(:,(1:(end-1)))));
			threshold = sorted_vectp(:,i_max);

			node_list{1} = find(vectp(:,end) > threshold);
			node_list{2} = find(vectp(:,end) <= threshold);
		else
			node_list{1} = find(vectp(:,end) > 0);
			node_list{2} = find(vectp(:,end) <= 0);
		end

		B1(:, node_list{2}) = 0;
		B1(node_list{2}, :) = 0;

		B2(:, node_list{1}) = 0;
		B2(node_list{1}, :) = 0;
	end





	if length(valp) > 1
		fprintf('Length(valp) = %g\n', length(valp));
		disp(valp)
		error('!');
	end
