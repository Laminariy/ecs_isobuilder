local globals = require('source.globals')
local tiny = globals.tiny


local GOFlipbooker = tiny.processing_system()
	GOFlipbooker.filter = tiny.require_all('go_ref', 'go_flipbook_request')

	function GOFlipbooker:process(entity)
		local req = entity.go_flipbook_request
		local url = msg.url(_, entity.go_ref, req.sprite or 'sprite')
		sprite.play_flipbook(url, req.animation, function()
			for key, value in pairs(req.after_components or {}) do
				entity[key] = value
			end
			self.world:add_entity(entity)
		end,
		{
			offset = req.offset,
			playback_rate = req.playback_rate
		})
		entity.go_flipbook_request = nil
		self.world:add_entity(entity)
	end

return GOFlipbooker
