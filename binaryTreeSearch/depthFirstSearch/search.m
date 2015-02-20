function pos = search(tree, key)
	stack = 1; % put root of tree in analise stack
	
	while (isempty(stack) == 0)	
		father = stack(end);
		if (tree(father) == key)
			pos = father;
			break;
		end;

		stack = stack(1:end-1);

		rightPos = getRight(father);
		leftPos = getLeft(father);

		if (rightPos <= numel(tree) && tree(rightPos) != 0)
			stack(end + 1) = rightPos;
		end
		if (leftPos <= numel(tree) && tree(leftPos) != 0)
			stack(end + 1) = leftPos;
		end
	end
end
