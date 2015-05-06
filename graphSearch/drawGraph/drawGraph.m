function graphFigure = drawGraph(states, transitions, scale = 1)
	for i=1:size(states)(1)
		drawNodeGraph(states(i,1), states(i,2), i, scale);
	end
	for i=1:size(transitions)(1)
		for j=1:size(transitions)(2)
			if (transitions(i,j))
				if ( i > j && transitions(i,j) == transitions(j,i)) % no directional arrow
					continue;
				end
				drawArrowGraph(states(i,:), states(j,:), transitions(i,j), scale, mod(rand(1,3),.7));
			end
		end
	end
end
