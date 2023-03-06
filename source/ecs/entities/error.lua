local Class = require('source.utils.class')


local Error = Class 'Error'

	function Error:init(msg)
		self.error = msg
		self.dead = true
	end

return Error
