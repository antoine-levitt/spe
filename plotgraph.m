function plotgraph(A, v)

global PARAMS

colors=zeros(length(v), 3);
if PARAMS.d == 1
	meuh = hot;
	c_max = max(v);
	c_min = min(v);
	mapp = ceil((v - c_min)/(c_max-c_min) * 63)+1;
	colors = meuh(mapp,:);
	draw_dot(A, colors);
end
