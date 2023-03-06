local Class = require('source.utils.class')
local GOCreationRequest = require('source.ecs.components.go_creation_request')
local GOFlipBookRequest = require('source.ecs.components.go_flipbook_request')


local Explosion = Class 'Explosion'

	function Explosion:init(position)
		self.position = position
		self.y_sorted = true
		self.update_position_request = true
		self.go_creation_request = GOCreationRequest('explosion')
		self.go_flipbook_request = GOFlipBookRequest(_, 'explosion', {
			dead = true
		})
	end

return Explosion
