local random = math.random
local globals = require('source.globals')
local tiny = globals.tiny
local construction_map = globals.scene.construction_map


local RandomConstructionDestroyer = tiny.system()
	RandomConstructionDestroyer.filter = tiny.require_all('construction')

	local function choose_item(tbl)
		assert(#tbl > 0, 'Table is empty!')
		local id = random(1, #tbl)
		return tbl[id], id
	end

	function RandomConstructionDestroyer:update()
		if not construction_map.random_destroy_request then
			return
		end
		local amount = construction_map.random_destroy_request.amount
		local constructions = {unpack(self.entities)}
		local construction, construction_id
		for _ = 1, amount do
			if #constructions == 0 then
				break
			end
			construction, construction_id = choose_item(constructions)
			construction.dead = true
			table.remove(constructions, construction_id)
			self.world:add_entity(construction)
		end
		construction_map.random_destroy_request = nil
		self.world:add_entity(construction_map)
	end

return RandomConstructionDestroyer
