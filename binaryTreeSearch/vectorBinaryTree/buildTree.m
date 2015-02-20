% fix to build a balanced tree
function tree = buildTree(vector)
	tree = zeros(0);
	for iVector = 1:numel(vector)
		iTree = 1;
		if ( numel(tree) > 0 )
			while (iTree <= numel(tree))
				if (tree(iTree) == 0)
					break;
				end
				if (vector(iVector) <= tree(iTree))
					iTree = iTree + iTree;
				else
					iTree = iTree + iTree + 1;
				end
			end
		end
		tree(iTree) = vector(iVector);
	end
end
				
	 	
