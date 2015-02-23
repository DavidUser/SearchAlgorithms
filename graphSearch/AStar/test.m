graph = zeros(0);
graph(1,2) = 1;
graph(1,3) = 4;
graph(2,3) = 2;
graph(2,4) = 5;
graph(2,5) = 12;
graph(3,4) = 2;
graph(4,5) = 3;

heuristic = zeros(0);
heuristic(1) = 7;
heuristic(2) = 6;
heuristic(3) = 2;
heuristic(4) = 1;
heuristic(5) = 0;

start = 1;
goal = 5;

[ways costs] = search(graph, heuristic, start, goal);

for i=1:size(ways)(1)
	fprintf('cost: %d, way: ', costs(i));
	display(unique(ways(i,:)));
end;
