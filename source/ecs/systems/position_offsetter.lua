local globals = require('source.globals')
local tiny = globals.tiny


local PositionOffsetter = tiny.processing_system()
	PositionOffsetter.filter = tiny.require_all('update_position_request', 'position', 'offset')

	function PositionOffsetter:process(entity)
		entity.position = entity.position + entity.offset
	end

return PositionOffsetter
