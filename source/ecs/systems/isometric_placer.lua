local globals = require('source.globals')
local tiny = globals.tiny


local IsometricPlacer = tiny.processing_system()
	IsometricPlacer.filter = tiny.require_all('position', 'isometric',
																						'update_position_request')

	function IsometricPlacer:process(entity)
		local pos = entity.position
		local pos_x, pos_y = pos.x, pos.y
		pos.x = pos_x - pos_y
		pos.y = (pos_x + pos_y)/2
	end

return IsometricPlacer
