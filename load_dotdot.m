function A = load_dotdot(filename)
	A = dot_to_graph(filename);
	A = (A>0);
