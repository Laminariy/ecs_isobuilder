local grid_helpers = require('source.utils.grid_helpers')
local index_to_cords = grid_helpers.index_to_cords
local globals = require('source.globals')
local tiny = globals.tiny


local GridPlacer = tiny.processing_system()
	GridPlacer.filter = tiny.require_all('index', 'parent', 'position', 'gridded',
																			 'update_position_request')

	function GridPlacer:process(entity)
		local size = entity.parent.grid_size
		entity.position.x, entity.position.y = index_to_cords(entity.index, size.x, size.y)
	end

return GridPlacer
