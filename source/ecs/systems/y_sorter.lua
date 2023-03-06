local globals = require('source.globals')
local tiny = globals.tiny


local YSorter = tiny.processing_system()
	YSorter.filter = tiny.require_all('update_position_request', 'y_sorted', 'position')

	function YSorter:process(entity)
		if entity.position.y == 0 then
			entity.position.z = 1
			return
		end
		entity.position.z = 1/entity.position.y
	end

return YSorter
