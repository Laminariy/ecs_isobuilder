local globals = require('source.globals')
local tiny = globals.tiny


local GOConnector = tiny.processing_system()
	GOConnector.filter = tiny.require_all('go_connection_request')

	function GOConnector:process(entity)
		local path = entity.go_connection_request.path
		entity.go_ref = go.get_id(path)
		entity.go_connection_request = nil
		self.world:add_entity(entity)
	end

return GOConnector
