function pos = getBrother(brotherPos)
	if (mod(brotherPos, 2) == 0) % is even then is left son
		pos = brotherPos + 1;
	else
		pos = brotherPos - 1;
end
