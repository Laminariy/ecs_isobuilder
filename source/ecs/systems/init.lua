local globals = require('source.globals')
local world = globals.world


world:add_system(require('source.ecs.systems.gui_error_sender'))
world:add_system(require('source.ecs.systems.construction_count_updater'))
world:add_system(require('source.ecs.systems.collision_creator'))
world:add_system(require('source.ecs.systems.collision_storage_system'))
world:add_system(require('source.ecs.systems.random_construction_creator'))
world:add_system(require('source.ecs.systems.construction_exploder'))
world:add_system(require('source.ecs.systems.random_construction_destroyer'))
world:add_system(require('source.ecs.systems.construction_placer'))
world:add_system(require('source.ecs.systems.construction_remover'))
world:add_system(require('source.ecs.systems.container_filler'))
world:add_system(require('source.ecs.systems.tile_pattern_setter'))
world:add_system(require('source.ecs.systems.grid_placer'))
world:add_system(require('source.ecs.systems.tile_placer'))
world:add_system(require('source.ecs.systems.position_mover'))
world:add_system(require('source.ecs.systems.position_offsetter'))
world:add_system(require('source.ecs.systems.isometric_placer'))
world:add_system(require('source.ecs.systems.y_sorter'))
world:add_system(require('source.ecs.systems.pixel_perfect_position_setter'))
world:add_system(require('source.ecs.systems.go_connector'))
world:add_system(require('source.ecs.systems.go_position_updater'))
world:add_system(require('source.ecs.systems.go_creator'))
world:add_system(require('source.ecs.systems.go_flipbooker'))
world:add_system(require('source.ecs.systems.go_destroyer'))
world:add_system(require('source.ecs.systems.entity_destroyer'))
