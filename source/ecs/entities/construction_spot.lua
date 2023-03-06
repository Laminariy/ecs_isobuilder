local Class = require('source.utils.class')


local ConstructionSpot = Class 'ConstructionSpot'

	function ConstructionSpot:init()
		self.position = vmath.vector3(0)
		self.construction_spot = true
		self.gridded = true
		self.tiled = true
		self.isometric = true
		self.update_position_request = true
	end

return ConstructionSpot
