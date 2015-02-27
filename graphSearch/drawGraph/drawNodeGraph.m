function drawNodeGraph(posX, posY, name)
	hold on;
	[X Y Z] = ellipsoid(posX, posY, 0, .3, .3, 0);
	surf(X,Y,Z,'EdgeColor', 'none');
	if (isnumeric(name))
		text(posX, posY, int2str(name));
	else
		text(posX, posY, name);
	end
	hold off;
end
