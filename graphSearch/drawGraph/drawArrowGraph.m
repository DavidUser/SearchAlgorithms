function drawArrowGraph(initial, final, label = ' ', scale = 1, color = 'black')
	offset = .3*scale;
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
	line(projectionX, projectionY, 'color', color);

	if (isnumeric(label))
		finalLabel = num2str(label);
	else
		finalLabel = label;
	end
	text(mean(projectionX), mean(projectionY), finalLabel, 'color', color);
end
