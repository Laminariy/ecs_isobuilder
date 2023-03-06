local ConstructionSpot = require('source.ecs.entities.construction_spot')
local grid_helpers = require('source.utils.grid_helpers')
local index_to_cords = grid_helpers.index_to_cords
local cords_to_index = grid_helpers.cords_to_index
local globals = require('source.globals')
local scene = globals.scene
local tiny = globals.tiny


local ConstructionRemover = tiny.processing_system()
	ConstructionRemover.filter = tiny.require_all('construction', 'dead', 'size')

	function ConstructionRemover:process(entity)
		local map = entity.parent
		local container = map.container
		local g_size_x, g_size_y = map.grid_size.x, map.grid_size.y
		local cord_x, cord_y = index_to_cords(entity.index, g_size_x, g_size_y)
		local spot
		local i
		for x = cord_x, cord_x + entity.size.x - 1 do
			for y = cord_y, cord_y + entity.size.y - 1 do
				-- recreate free spots
				spot = ConstructionSpot()
				i = cords_to_index(x, y, g_size_x, g_size_y)
				spot.index = i
				spot.parent = map
				container[i] = spot
				self.world:add_entity(spot)
			end
		end
		map.construction_counter = map.construction_counter - 1
		entity.collision.dead = true
		entity.dead = true
		scene.collisions[entity.collision.go_ref] = nil
		self.world:add_entity(entity)
		self.world:add_entity(entity.collision)
	end

return ConstructionRemover
