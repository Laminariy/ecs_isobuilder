local Explosion = require('source.ecs.entities.explosion')
local globals = require('source.globals')
local collisions = globals.scene.collisions
local tiny = globals.tiny


local ConstructionExploder = tiny.processing_system()
	ConstructionExploder.filter = tiny.require_all('clicked_objects')

	function ConstructionExploder:process(entity)
		-- sort by z coordinate
		if #entity.clicked_objects == 0 then return end
		table.sort(entity.clicked_objects, function(left, right)
			return collisions[left.id].position.z > collisions[right.id].position.z
		end)
		local construction = collisions[entity.clicked_objects[1].id] -- nearest clicked construction
		construction.dead = true
		local explosion = Explosion(construction.position)
		self.world:add_entity(construction)
		self.world:add_entity(explosion)
	end

return ConstructionExploder
