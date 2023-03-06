local globals = require('source.globals')
local tiny = globals.tiny


local EntityDestroyer = tiny.processing_system()

	function EntityDestroyer:filter(entity)
		return entity.dead == true
	end

	function EntityDestroyer:process(entity)
		self.world:remove_entity(entity)
	end

return EntityDestroyer
