local Class = require('source.utils.class')
local GOCreationRequest = require('source.ecs.components.go_creation_request')
local GOFlipbookRequest = require('source.ecs.components.go_flipbook_request')


local Construction = Class 'Construction'

	function Construction:init(name, size, pivot)
		self.construction = true
		self.position = vmath.vector3(0)
		self.offset = pivot or vmath.vector3(0)
		self.size = size or vmath.vector3(1, 1, 0)
		self.gridded = true
		self.tiled = true
		self.isometric = true
		self.y_sorted = true
		self.collision_create_request = true
		self.go_creation_request = GOCreationRequest('construction')
		self.go_flipbook_request = GOFlipbookRequest(_, name)
	end

return Construction
