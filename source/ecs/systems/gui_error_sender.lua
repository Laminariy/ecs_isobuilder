local globals = require('source.globals')
local tiny = globals.tiny


local GUIErrorSender = tiny.processing_system()
	GUIErrorSender.filter = tiny.require_all('error')

	function GUIErrorSender:process(entity)
		msg.post('/gui#main', 'show_error', {msg = entity.error})
	end

return GUIErrorSender
