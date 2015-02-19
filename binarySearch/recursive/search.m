function position = search(vector, key, iStart, iEnd)
	if (iStart > iEnd)
		position = -1; %keyword not found
	else
		iMiddle = floor( (iEnd - iStart) / 2 + iStart );
		
		if ( vector(iMiddle) == key )
			position = iMiddle;
		else if ( vector(iMiddle) < key )
			position = search(vector, key, iMiddle + 1, iEnd);
		else
			position = search(vector, key, iStart, iMiddle);
		end
	end
end
