rho = linspace(0.8,1,25);
r = linspace(0.1,5,25);

trials = 5;
tmp = zeros(1,trials);

z = zeros(length(rho), length(r));

for i = 1:length(rho)
	parfor j = 1:length(r)
		for k = 1:trials;
			tmp(k) = main(rho(i), r(j));
		end
		z(i, j) = mean(tmp);
		disp(z(i, j))
	end
end

surfc(rho, r, z);
