local Class = require('source.utils.class')
local EntityContainerComponent = require('source.ecs.components.entity_container')
local ContainerFillRequest = require('source.ecs.components.container_fill_request')


local Map = Class 'Map'

	function Map:init(prototype, grid_size, tile_size)
		self.grid_size = grid_size or vmath.vector3(45, 45, 0)
		self.tile_size = tile_size or vmath.vector3(256, 127*2, 0)
		self.container = EntityContainerComponent()
		self.container_fill_request = ContainerFillRequest(prototype, self.grid_size.x*self.grid_size.y)
	end

return Map
