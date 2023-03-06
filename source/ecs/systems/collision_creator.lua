local Collision = require('source.ecs.entities.collision')
local globals = require('source.globals')
local tiny = globals.tiny


local CollisionCreator = tiny.processing_system()
	CollisionCreator.filter = tiny.require_all('go_ref', 'collision_create_request',
														tiny.reject_all('go_flipbook_request'))

	function CollisionCreator:process(entity)
		local scale = go.get(msg.url(_, entity.go_ref, 'sprite'), 'size')
		entity.collision = Collision(scale, entity)
		entity.collision_create_request = nil
		self.world:add_entity(entity)
		self.world:add_entity(entity.collision)
	end

return CollisionCreator
