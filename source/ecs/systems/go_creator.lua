local globals = require('source.globals')
local tiny = globals.tiny


local GOCreator = tiny.processing_system()
	GOCreator.filter = tiny.require_all('go_creation_request')

	function GOCreator:process(entity)
		local req = entity.go_creation_request
		local url = msg.url(_, 'factories', req.name)
		entity.go_ref = factory.create(url, entity.position, entity.rotation, req.properties, entity.scale)
		if req.parent then
			go.set_parent(entity.go_ref, req.parent)
		end
		entity.go_creation_request = nil
		self.world:add_entity(entity)
	end

return GOCreator
