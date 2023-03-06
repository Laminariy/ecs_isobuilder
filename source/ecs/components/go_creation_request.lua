local Class = require('source.utils.class')


local GOCreationRequest = Class 'GOCreationRequest'

	function GOCreationRequest:init(name, properties, parent)
		self.name = name
		self.properties = properties
		self.parent = parent
	end

return GOCreationRequest
