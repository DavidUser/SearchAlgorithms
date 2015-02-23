function [ ways, waysCost ] = search(graph, heuristic, start, goal)
	ways = zeros(0);
	waysCost = zeros(0);
	waysCostHeuristic = zeros(0);

	haveIncompleteWays = true;

	way = start;
	cost = 0;

	while ( haveIncompleteWays )
		expansionCost = graph(way(end),:);
		expansion = find(expansionCost);
		expansionCost = expansionCost + cost;
		newWays = [ ones(numel(expansion),1) * way, expansion' ];

		if (size(ways)(2) < size(newWays)(2))
			ways = resize(ways, size(ways)(1), size(newWays)(2));
			for i=1:size(ways)(1)
				ways(i,find(ways(i,:) == 0)) = ways(i,find(ways(i,:)))(end);
			end	
		end
		ways = [ways; newWays];
		waysCost = [waysCost expansionCost(expansion)];

		expansionCostHeuristic = expansionCost + heuristic;
		expansionCostHeuristic = expansionCostHeuristic(expansion);
		waysCostHeuristic = [waysCostHeuristic expansionCostHeuristic];
		
		rankWay = waysCostHeuristic - min(waysCostHeuristic);
		lowerWay = find(not(rankWay));
		lowerWay = lowerWay(1);
		
		while ( ways(lowerWay, end) == goal || ways(lowerWay, end) == 0  )
			rankWay(lowerWay) = inf;
			if ( sum(finite(rankWay)) == 0) 
				haveIncompleteWays = false;
				break; % all ways founded
			end;
			lowerWay = find(not(rankWay - min(rankWay))); %find a new lower
			lowerWay = lowerWay(1);
		end

		if (haveIncompleteWays)
			way = ways(lowerWay,:);
			cost = waysCost(lowerWay);

			ways(lowerWay, :) = [];
			waysCost(lowerWay) = [];
			waysCostHeuristic(lowerWay) = [];
		end
	end
end
