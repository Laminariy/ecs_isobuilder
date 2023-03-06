local Class = require('source.utils.class')


local RandomConstructionRequest = Class 'RandomConstructionRequest'

	function RandomConstructionRequest:init(amount)
		self.amount = amount
	end

return RandomConstructionRequest
