function graphFigure = drawGraph(states, transitions)
	graphFigure = drawBackgroundGraph(max(states(:,1)), max(states(:,2)));
	for i=1:size(states)(1)
		drawNodeGraph(states(i,1), states(i,2), i);
	end
	for i=1:size(transitions)(1)
		for j=1:size(transitions)(2)
			if (transitions(i,j))
				drawArrowGraph(states(i,:), states(j,:), transitions(i,j));
			end
		end
	end
end