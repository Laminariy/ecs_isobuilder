local globals = require('source.globals')
local tiny = globals.tiny


local PixelPerfectPositionSetter = tiny.processing_system()
	PixelPerfectPositionSetter.filter = tiny.require_all('update_position_request', 'position',
																											 'pixel_perfect')

	function PixelPerfectPositionSetter:process(entity, dt)
		entity.position.x = math.floor(entity.position.x)
		entity.position.y = math.floor(entity.position.y)
	end

return PixelPerfectPositionSetter
