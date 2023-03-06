local Class = require('source.utils.class')
local GOCreationRequest = require('source.ecs.components.go_creation_request')
local GOFlipbookRequest = require('source.ecs.components.go_flipbook_request')


local Tile = Class 'Tile'

	function Tile:init()
		self.position = vmath.vector3(0, 0, -1)
		self.set_check_pattern = true
		self.gridded = true
		self.tiled = true
		self.isometric = true
		self.update_position_request = true
		self.go_creation_request = GOCreationRequest('tile')
		self.go_flipbook_request = GOFlipbookRequest(_, 'tile_dark')
	end

return Tile
