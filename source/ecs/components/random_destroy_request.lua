local Class = require('source.utils.class')


local RandomDestroyRequest = Class 'RandomDestroyRequest'

	function RandomDestroyRequest:init(amount)
		self.amount = amount
	end

return RandomDestroyRequest
