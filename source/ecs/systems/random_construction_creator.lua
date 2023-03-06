local Error = require('source.ecs.entities.error')
local Construction = require('source.ecs.entities.construction')
local ConstructionPlaceRequest = require('source.ecs.components.construction_place_request')
local random = math.random
local grid_helpers = require('source.utils.grid_helpers')
local index_to_cords = grid_helpers.index_to_cords
local cords_to_index = grid_helpers.cords_to_index
local globals = require('source.globals')
local tiny = globals.tiny
local construction_map = globals.scene.construction_map
local constructions = globals.constructions


local RandomConstructionCreator = tiny.system()
	RandomConstructionCreator.filter = tiny.require_all('construction_spot')

	local function choose_item(tbl)
		assert(#tbl > 0, 'Table is empty!')
		local id = random(1, #tbl)
		return tbl[id], id
	end

	local function check_construction_spot(spot, size)
		local map = spot.parent
		local container = map.container
		local cord_x, cord_y = index_to_cords(spot.index, map.grid_size.x, map.grid_size.y)
		local success, index
		for x = cord_x, cord_x + size.x - 1 do
			for y = cord_y, cord_y + size.y - 1 do
				success, index = pcall(cords_to_index, x, y, map.grid_size.x, map.grid_size.y)
				if not success then return false end
				if not container[index].construction_spot then
					return false
				end
			end
		end
		return true
	end

	local function remove_choosed_spots(spot, size)
		local map = spot.parent
		local container = map.container
		local cord_x, cord_y = index_to_cords(spot.index, map.grid_size.x, map.grid_size.y)
		for x = cord_x, cord_x + size.x - 1 do
			for y = cord_y, cord_y + size.y - 1 do
				container[cords_to_index(x, y, map.grid_size.x, map.grid_size.y)].construction_spot = nil
			end
		end
	end

	local function clear_removed_spots(spots)
		local new_spots = {}
		for _, spot in ipairs(spots) do
			if spot.construction_spot then
				table.insert(new_spots, spot)
			end
		end
		return new_spots
	end

	function RandomConstructionCreator:update()
		if not construction_map.random_construction_request then
			return
		end
		if #construction_map.container == 0 then
			return -- spots not exists yet
		end
		local amount = construction_map.random_construction_request.amount
		local spots = {unpack(self.entities)} -- dirty copy
		local spot, spot_id
		local construction_list, construction, construction_id
		while amount > 0 do
			if #spots == 0 then -- there is no free spots - exit loop
				break
			end
			construction_list = {unpack(constructions)} -- random table for this step
			spot, spot_id = choose_item(spots) -- choose spot
			repeat -- choose construction that fits into this spot
				construction, construction_id = choose_item(construction_list)
				if not check_construction_spot(spot, construction.size) then
					table.remove(construction_list, construction_id)
					construction = nil
				end
			until #construction_list == 0 or construction
			if construction then -- construction choosed
				-- clear choosed spots
				remove_choosed_spots(spot, construction.size)
				spots = clear_removed_spots(spots)
				-- create construction
				construction = Construction(construction.name, vmath.vector3(construction.size), vmath.vector3(construction.offset))
				construction.construction_place_request = ConstructionPlaceRequest(construction_map, spot.index)
				self.world:add_entity(construction)
				-- decrement amount
				amount = amount - 1
			else -- no one construction fits into this spot
				table.remove(spots, spot_id) -- so we remove this spot and go to begin
			end
		end
		if amount > 0 then
			-- no free spots
			local error = Error("Not enough space for "..amount.." constructions!")
			self.world:add_entity(error)
		end
		construction_map.random_construction_request = nil
		self.world:add_entity(construction_map)
	end

return RandomConstructionCreator
