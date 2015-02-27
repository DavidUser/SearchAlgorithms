function drawArrowGraph(initial, final, label = ' ')
	offset = .3;
	for i = 1:2
		if (initial(i) < final(i))
			initial(i) = initial(i) + offset;
			final(i) = final(i) - offset;
		end
		if (initial(i) > final(i))
			initial(i) = initial(i) - offset;
			final(i) = final(i) + offset;
		end
	end
	projectionX = [initial(1) final(1)];
	projectionY = [initial(2) final(2)];
	line(projectionX, projectionY);

	if (isnumeric(label))
		finalLabel = int2str(label);
	else
		finalLabel = label;
	end
	text(mean(projectionX), mean(projectionY), finalLabel);
end
