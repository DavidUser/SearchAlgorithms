function [ ways, waysCost ] = search(graph, heuristic, start, GOALS, searchTime = inf)
	ways = zeros(0);
	waysCost = zeros(0);
	waysCostHeuristic = zeros(0);

	haveAWay = 1;

	ways = start;
	waysCost = 0;
	waysCostHeuristic = 0;
	lowerWay = 1;

	waysGoal = [];
	waysGoalCost = [];

	findElement = @(COLLECTION, element) nthargout(2, @ismember, element, COLLECTION);
	findLowerElement = @(COLLECTION, element) findElement(COLLECTION, min(COLLECTION));

	tic;
	while ( haveAWay && toc < searchTime ) % have a lower way to expand
		way = ways(lowerWay,:);
		cost = waysCost(lowerWay);

		ways(lowerWay, :) = [];
		waysCost(lowerWay) = [];
		waysCostHeuristic(lowerWay) = [];

		expansionCost = graph(way(end),:);
		expansion = find(expansionCost);

		% eliminate cycle expansion
		expansion( find(ismember(expansion, way)) ) = [];

		expansionCost = expansionCost + cost;
		newCost = expansionCost(expansion);
		newWays = [ ones(numel(expansion),1) * way, expansion' ];
		ways = [ways ways(:,end); 	% repeat last state to static ways
			newWays]; 		% concat new ways
		waysCost = [waysCost newCost];

		newWaysGoalIndex = find(ismember(newWays(:, end), GOALS));
		waysGoal = resize(waysGoal, size(waysGoal)(1), size(ways)(2));
		waysGoal = [waysGoal; newWays(newWaysGoalIndex, :)];
		waysGoalCost = [waysGoalCost newCost(newWaysGoalIndex)];
		
		expansionCostHeuristic = expansionCost + heuristic;
		expansionCostHeuristic = expansionCostHeuristic(expansion);
		waysCostHeuristic = [waysCostHeuristic expansionCostHeuristic];
		
		rankWay = waysCostHeuristic - min(waysCostHeuristic);
		lowerWay = findLowerElement(rankWay);
		haveAWay = finite(rankWay(lowerWay));
		
		% find a new lower way
		while ( haveAWay && not(any(graph(ways(lowerWay,end), :))) ) % lower way is cornered
			goalElementPosition = findElement(GOALS, ways(lowerWay, :));
			if ( not(goalElementPosition) )
				ways(lowerWay, :) = [];
				waysCost(lowerWay) = [];
				waysCostHeuristic(lowerWay) = [];
				rankWay(lowerWay) = [];
			else
				goalElementPosition = find(goalElementPosition)(end);
				ways(lowerWay,goalElementPosition:end) = ways(lowerWay, goalElementPosition);
				haveAWay = false;
			end
			rankWay(lowerWay) = inf;
			lowerWay = findLowerElement(rankWay);
			haveAWay = finite(rankWay(lowerWay));
		end

	end
	ways = waysGoal;
	waysCost = waysGoalCost;
end
