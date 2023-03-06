local Class = require('source.utils.class')
local GOConnectionRequest = require('source.ecs.components.go_connection_request')


local Camera = Class 'Camera'

	function Camera:init()
		self.camera = true
		self.position = vmath.vector3(0, 2500, 0)
		self.speed = 400
		self.direction = vmath.vector3(0)
		self.pixel_perfect = true
		self.update_position_request = true
		self.go_connection_request = GOConnectionRequest('/camera')
	end

return Camera
