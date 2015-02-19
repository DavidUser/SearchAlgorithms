function position = search(vector, key)
	iStart = 1;
	iEnd = numel(vector);

	while (iStart <= iEnd)
		iMiddle = floor( (iEnd - iStart) / 2 + iStart );
		
		if (vector(iMiddle) == key)
			position = iMiddle;
			break;
		else if (vector(iMiddle) < key)
			iStart = iMiddle + 1;
		else
			iEnd = iMiddle - 1;
		end
	end
end
