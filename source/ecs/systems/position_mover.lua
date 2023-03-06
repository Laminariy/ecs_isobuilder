local globals = require('source.globals')
local tiny = globals.tiny


local PositionMover = tiny.processing_system()
	PositionMover.filter = tiny.require_all('update_position_request', 'position',
																				  'speed', 'direction')

	function PositionMover:process(entity, dt)
		if vmath.length(entity.direction) > 0 then
			entity.position = entity.position + vmath.normalize(entity.direction) * entity.speed * dt
			entity.direction = vmath.vector3(0)
		end
	end

return PositionMover
