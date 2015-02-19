function pos = getFather(sonPos)
	if (mod(sonPos, 2) != 0) % is odd then is right son
		sonPos = sonPos - 1; % get left son pos
	end
	pos = sonPos / 2;
end
