local globals = require('source.globals')
local tiny = globals.tiny


local GOPositionUpdater = tiny.processing_system()
	GOPositionUpdater.filter = tiny.require_all('update_position_request', 'position')

	function GOPositionUpdater:process(entity)
		if entity.go_ref then
			go.set_position(entity.position, entity.go_ref)
		end
		entity.update_position_request = nil
		self.world:add_entity(entity)
	end

return GOPositionUpdater
