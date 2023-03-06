local Class = require('source.utils.class')
local GOCreationRequest = require('source.ecs.components.go_creation_request')


local Collision = Class 'Collision'

	function Collision:init(scale, parent)
		self.collision_store_request = true
		self.scale = scale
		self.parent = parent
		self.go_creation_request = GOCreationRequest('collision', _, parent.go_ref)
	end

return Collision
