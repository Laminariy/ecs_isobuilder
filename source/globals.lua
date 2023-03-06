local Scene = require('source.ecs.entities.scene')
local wrap_s_case = require('source.utils.s_case_wrapper')


local Globals = {}

  Globals.tiny = wrap_s_case(require('source.deps.tiny'))
  Globals.world = wrap_s_case(Globals.tiny.world())
  Globals.scene = Scene(Globals.world)
  Globals.constructions = require('assets.constructions')

return Globals
