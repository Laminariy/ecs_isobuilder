local Class = require('source.utils.class')


local GOFlipbookRequest = Class 'GOFlipbookRequest'
	-- defaults
	GOFlipbookRequest.sprite = 'sprite'

	function GOFlipbookRequest:init(sprite, animation, after_components, offset, playback_rate)
		self.sprite = sprite
		self.animation = animation
		self.after_components = after_components
		self.offset = offset
		self.playback_rate = playback_rate
	end

return GOFlipbookRequest
