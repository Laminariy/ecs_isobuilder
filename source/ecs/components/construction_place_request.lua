local Class = require('source.utils.class')


local ConstructionPlaceRequest = Class 'ConstructionPlaceRequest'

	function ConstructionPlaceRequest:init(map, index)
		self.map = map
		self.index = index
	end

return ConstructionPlaceRequest
