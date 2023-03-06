local Class = require('source.utils.class')


local Click = Class 'Click'

	function Click:init(clicked_objects)
		self.dead = true
		self.clicked_objects = clicked_objects
	end

return Click
