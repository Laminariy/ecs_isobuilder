local globals = require('source.globals')
local tiny = globals.tiny


local ContainerFiller = tiny.processing_system()
	ContainerFiller.filter = tiny.require_all('container', 'container_fill_request')

	function ContainerFiller:process(entity)
		local req = entity.container_fill_request
		local prototype = req.prototype
		local set_index = req.set_index
		local set_parent = req.set_parent
		local world = self.world
		local new_entity
		for i = 1, req.amount do
			new_entity = prototype()
			entity.container[i] = new_entity
			if set_index then
				new_entity.index = i
			end
			if set_parent then
				new_entity.parent = entity
			end
			world:add_entity(new_entity)
		end
		entity.container_fill_request = nil
		world:add_entity(entity)
	end

return ContainerFiller
