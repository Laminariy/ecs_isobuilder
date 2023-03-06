local globals = require('source.globals')
local tiny = globals.tiny


local GODestroyer = tiny.processing_system()
	GODestroyer.filter = tiny.require_all('go_ref', 'dead')

	function GODestroyer:process(entity)
		go.delete(entity.go_ref, false)
		entity.go_ref = nil
		self.world:add_entity(entity)
	end

return GODestroyer
