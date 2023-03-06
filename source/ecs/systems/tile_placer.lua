local globals = require('source.globals')
local tiny = globals.tiny


local TilePlacer = tiny.processing_system()
	TilePlacer.filter = tiny.require_all('update_position_request',
																			 'parent', 'position', 'tiled')

	function TilePlacer:process(entity)
		local t_size = entity.parent.tile_size
		local pos = entity.position
		pos.x, pos.y = (pos.x-1) * t_size.x/2, (pos.y-1) * t_size.y/2
	end

return TilePlacer
