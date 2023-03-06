local Class = require('source.utils.class')
local Map = require('source.ecs.entities.map')
local Tile = require('source.ecs.entities.tile')
local ConstructionSpot = require('source.ecs.entities.construction_spot')
local Camera = require('source.ecs.entities.camera')


local Scene = Class 'Scene'

	function Scene:init(world)
		self.world = world
		self.tile_map = Map(Tile)
		self.construction_map = Map(ConstructionSpot)
		self.construction_map.construction_counter = 0
		self.collisions = {}
		self.camera = Camera()
		world:add_entity(self.tile_map)
		world:add_entity(self.construction_map)
		world:add_entity(self.camera)
	end

return Scene
