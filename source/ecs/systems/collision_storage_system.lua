local globals = require('source.globals')
local scene = globals.scene
local tiny = globals.tiny


local CollisionStorageSystem = tiny.processing_system()
	CollisionStorageSystem.filter = tiny.require_all('collision_store_request', 'go_ref', 'parent')

	function CollisionStorageSystem:process(entity)
		scene.collisions[entity.go_ref] = entity.parent
		entity.collision_store_request = nil
		self.world:add_entity(entity)
	end

return CollisionStorageSystem
