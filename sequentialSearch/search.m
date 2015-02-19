function i = search(vector, searched)
	for i = 1:numel(vector)
		if ( vector(i) == searched )
			break;
		end
	end
end
