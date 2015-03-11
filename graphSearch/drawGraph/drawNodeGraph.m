function drawNodeGraph(posX, posY, name, scale = 1)
	hold on;
	radius = .3*scale;
	[X Y Z] = ellipsoid(posX, posY, 0, radius, radius, 0);
	surf(X,Y,Z,'EdgeColor', 'none');
	if (isnumeric(name))
		text(posX, posY, int2str(name));
	else
		text(posX, posY, name);
	end
	hold off;
end
