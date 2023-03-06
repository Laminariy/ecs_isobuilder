local Class = require('source.utils.class')


local GOConnectionRequest = Class 'GOConnectionRequest'

	function GOConnectionRequest:init(path)
		self.path = path
	end

return GOConnectionRequest
