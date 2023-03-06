local grid_helpers = require('source.utils.grid_helpers')
local index_to_cords = grid_helpers.index_to_cords
local cords_to_index = grid_helpers.cords_to_index
local globals = require('source.globals')
local tiny = globals.tiny


local ConstructionPlacer = tiny.processing_system()
	ConstructionPlacer.filter = tiny.require_all('construction_place_request',
																							 'size')

	function ConstructionPlacer:process(entity)
		local req = entity.construction_place_request
		local map = req.map
		local container = map.container
		local index = req.index

		local g_size_x, g_size_y = map.grid_size.x, map.grid_size.y
		local cord_x, cord_y = index_to_cords(index, g_size_x, g_size_y)
		local i
		for x = cord_x, cord_x + entity.size.x - 1 do
			for y = cord_y, cord_y + entity.size.y - 1 do
				i = cords_to_index(x, y, g_size_x, g_size_y)
				-- mark all spots as dead
				container[i].dead = true
				self.world:add_entity(container[i])
				-- replace spots in map container
				container[i] = entity
			end
		end
		map.construction_counter = map.construction_counter + 1
		entity.parent = map
		entity.index = index
		entity.update_position_request = true
		entity.construction_place_request = nil
		self.world:add_entity(entity)
	end

return ConstructionPlacer
