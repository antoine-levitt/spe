function [cc, X]=n_concomp(A)
 if ~all(all(A == A'))
	 error('Matrix is not symetric');
 end
 if ~(size(A,1) == size(A,2))
	 error('Matrix is not square');
 end

 cc = 0;
 n = size(A, 1);

 X = zeros(1, n);

 c = 1;

 lifo = [1];

 while ~all(X)
 i = lifo(1);
 X(i) = c;
 lifo(lifo == i) = [];
	 k = 0;
	 for j = 1:n
		 if A(i,j) && ~X(j)
			 X(j) = c;
			 lifo = [lifo j];
			 k = k + 1;
		 end
	 end
	 if (length(lifo) > 0)
		 continue;
	 else
		 lifo = find(X==0, 1);
		 if length(lifo > 0)
			 c = c + 1;
		 else
			 break
		 end
	 end
 end

 cc = c;
