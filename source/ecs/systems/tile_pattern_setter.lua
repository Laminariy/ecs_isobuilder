local globals = require('source.globals')
local tiny = globals.tiny


local TilePatternSetter = tiny.processing_system()
	TilePatternSetter.filter = tiny.require_all('index', 'set_check_pattern', 'go_flipbook_request')

	function TilePatternSetter:process(entity)
		if entity.index % 2 == 0 then
			entity.go_flipbook_request.animation = 'tile_light'
		end
		entity.set_check_pattern = nil
		self.world:add_entity(entity)
	end

return TilePatternSetter
