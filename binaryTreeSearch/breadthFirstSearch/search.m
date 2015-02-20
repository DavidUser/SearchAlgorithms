function pos = search(tree, key)
	queue = 1; % put root of tree in analise queue
	
	while (isempty(queue) == 0)	
		father = queue(1);
		if (tree(father) == key)
			pos = father;
			break;
		end;

		queue = queue(2:end);

		rightPos = getRight(father);
		leftPos = getLeft(father);

		if (rightPos <= numel(tree) && tree(rightPos) != 0)
			queue(end + 1) = rightPos;
		end
		if (leftPos <= numel(tree) && tree(leftPos) != 0)
			queue(end + 1) = leftPos;
		end
	end
end
