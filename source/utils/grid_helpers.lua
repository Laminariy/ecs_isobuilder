local floor = math.floor


local GridHelpers = {}

	function GridHelpers.index_to_cords(index, size_x, size_y)
		assert(index > 0 and index <= size_x * size_y, 'Index out of bounds!')
		return (index-1)%size_y + 1, floor((index-1)/size_x) + 1
	end

	function GridHelpers.cords_to_index(x, y, size_x, size_y)
		assert(x > 0 and x <= size_x, 'X coordinate out of bounds!')
		assert(y > 0 and y <= size_y, 'Y coordinate out of bounds!')
		return x + (y - 1)*size_x
	end

return GridHelpers
