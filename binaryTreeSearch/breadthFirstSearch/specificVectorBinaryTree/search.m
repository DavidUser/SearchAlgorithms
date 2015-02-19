%WARNING zero are preseted value of tree
function position = search(tree, key)
	position = 1;
	while ( position <= numel(tree) && tree(position) != key )
		position = position + 1;
	end
	if ( position > numel(tree) )
		position = nan;
	end
end
