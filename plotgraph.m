function plotgraph(A, v, l, full_A)

global PARAMS

offset = 20;

colors=zeros(length(v), 3);
meuh = hot;
meuh = meuh((1+offset):end,:);
c_max = max(v);
c_min = min(v);
if c_min == c_max
	colors((1:length(v)), :) = repmat(meuh(1, :), length(v), 1);
else
	mapp = ceil((v - c_min)/(c_max-c_min) * (63-offset))+1;
	colors = meuh(mapp,:);
end
if PARAMS.gstyle == 1
	draw_dot(A, colors, l);
else
	switch PARAMS.graph
		case 'donjon'
		load('dungeon-xy.mat'); % specifique donjon
		case 'zachari'
		load('xy.mat'); % specifique ZACHARI
		case 'dolph'
		load('dolphins-xy.mat'); % specifique Dauphins
	end
	x = xy(1,:);
	y = xy(2,:);
	if exist('full_A')
		graph_draw(full_A, zeros(length(v), 3), 'linecolor', [0.7 0.7 0.7], 'linestyle', '-.', 'node_labels', l, 'fontsize', 9, 'node_shapes', zeros(size(x,2),1), 'X', x, 'Y', y);
	end
	graph_draw(A, colors, 'linewidth', 1, 'node_labels', l, 'fontsize', 9, 'node_shapes', zeros(size(x,2),1), 'X', x, 'Y', y);
end
