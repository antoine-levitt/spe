function plotgraph(A, v, l)

global PARAMS

offset = 10;

colors=zeros(length(v), 3);
meuh = hot;
meuh = meuh((1+offset):end,:);
c_max = max(v);
c_min = min(v);
mapp = ceil((v - c_min)/(c_max-c_min) * (63-offset))+1;
colors = meuh(mapp,:);
if PARAMS.gstyle == 1
	draw_dot(A, colors, l);
else
	switch PARAMS.graph
		case 'zachari'
		load('xy.mat'); % specifique ZACHARI
		case 'dolph'
		load('dolphins-xy.mat'); % specifique Dauphins
	end
	x = xy(1,:);
	y = xy(2,:);
	graph_draw(A, colors, 'node_labels', l, 'fontsize', 9, 'node_shapes', zeros(size(x,2),1), 'X', x, 'Y', y);
end
