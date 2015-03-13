function [ ways, waysCost ] = search(graph, heuristic, start, GOALS)
	ways = zeros(0);
	waysCost = zeros(0);
	waysCostHeuristic = zeros(0);

	haveAWay = 1;

	ways = start;
	waysCost = 0;
	waysCostHeuristic = 0;
	lowerWay = 1;

	findElement = @(COLLECTION, element) nthargout(2, @ismember, element, COLLECTION);
	findLowerElement = @(COLLECTION, element) findElement(COLLECTION, min(COLLECTION));

	while ( haveAWay ) % have a lower way to expand
		way = ways(lowerWay,:);
		cost = waysCost(lowerWay);

		ways(lowerWay, :) = [];
		waysCost(lowerWay) = [];
		waysCostHeuristic(lowerWay) = [];

		expansionCost = graph(way(end),:);
		expansion = find(expansionCost);
		expansionCost = expansionCost + cost;
		newWays = [ ones(numel(expansion),1) * way, expansion' ];

		%repeat state to static ways
		if (size(ways)(2) < size(newWays)(2))
			ways = resize(ways, size(ways)(1), size(newWays)(2));
			for i=1:size(ways)(1)
				ways(i,find(ways(i,:) == 0)) = ways(i,find(ways(i,:)))(end);
			end	
		end
		ways = [ways; newWays]
		waysCost = [waysCost expansionCost(expansion)];

		expansionCostHeuristic = expansionCost + heuristic;
		expansionCostHeuristic = expansionCostHeuristic(expansion);
		waysCostHeuristic = [waysCostHeuristic expansionCostHeuristic]
		
		rankWay = waysCostHeuristic - min(waysCostHeuristic);
		lowerWay = findLowerElement(rankWay);
		haveAWay = finite(rankWay(lowerWay));
		
		% find a new lower way
		while ( haveAWay && not(any(graph(ways(lowerWay,end), :))) ) % lower way is cornered
			if ( not(findElement(GOALS, ways(lowerWay, end))) )
				ways(lowerWay, :) = [];
				waysCost(lowerWay) = [];
				waysCostHeuristic(lowerWay) = [];
			end
			rankWay(lowerWay) = inf;
			lowerWay = findLowerElement(rankWay)
			haveAWay = finite(rankWay(lowerWay));
		end

	end
end
