local Class = require('source.utils.class')


local ContainerFillRequest = Class 'ContainerFillRequest'
	-- defaults
	ContainerFillRequest.set_index = true
	ContainerFillRequest.set_parent = true

	function ContainerFillRequest:init(prototype, amount, set_index, set_parent)
		self.prototype = prototype
		self.amount = amount
		self.set_index = set_index
		self.set_parent = set_parent
	end

return ContainerFillRequest
