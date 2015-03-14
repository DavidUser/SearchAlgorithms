#! /usr/bin/octave -q

positions(1,:) = [5 5];
positions(2,:) = [8 8];
positions(3,:) = [2 4];
positions(4,:) = [3 9];
positions(5,:) = [7 10];

graph = zeros(5);
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
goal = [2 3];

addpath('../drawGraph');

fprintf('full graph representation:\n');
display(graph);

drawGraph(positions, graph);
title('full graph');

pause();

% graph search and print and plot
 
[ways costs] = search(graph, heuristic, start, goal);

for i=1:size(ways)(1)
	% console result
	way = ways(i,:);
	way = way(find(way)); %remove zeros
	way = way(sort(nthargout(2, @unique, way, 'first'))); %remove repetitions
	fprintf('cost: %d, way: ', costs(i));
	display(way);
	
	% graphical plot
	wayGraph = zeros(size(graph));
	for j = 2:numel(way)
		wayGraph(way(j-1), way(j)) = graph(way(j-1), way(j));
	end
	drawGraph(positions, wayGraph);
	title(['way ',int2str(i), ' , cost: ', int2str(costs(i))]);
	pause();
end

