local globals = require('source.globals')
local tiny = globals.tiny


local ConstructionCountUpdater = tiny.processing_system()
	ConstructionCountUpdater.filter = tiny.require_all('construction_counter')

	function ConstructionCountUpdater:process(entity)
		msg.post('/gui#main', 'update_counter', {msg = entity.construction_counter})
	end

return ConstructionCountUpdater
