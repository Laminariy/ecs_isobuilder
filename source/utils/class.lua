local deepcopy = require('source.utils.deepcopy')


local Class = {}
  Class.__index = Class

  function Class.__tostring(class)
    return 'Class: '..class.class_type or 'Undefined'
  end

  function Class.__call(class, ...)
    return class:create(...)
  end

  function Class.define(class)
    class = class or {}
    if type(class) == 'string' then
      class = {class_type = class}
    end
    class.__index = class
    return setmetatable(class, Class)
  end

  function Class.include(class, ...)
    assert(class, 'You must provide class!')
    for _, other in ipairs({...}) do
      for key, value in pairs(other) do
        if rawget(class, key) == nil then
          rawset(class, key, deepcopy(value, true))
        end
      end
    end
    return class
  end

  function Class.create(class, ...)
    assert(class, 'You must provide class!')
    local object = setmetatable({}, class)
    object:init(...)
    return object
  end

  function Class.init(object, prototype)
    assert(prototype == nil or type(prototype) == 'table', 'Prototype must be table!')
    for key, value in pairs(prototype or {}) do
      object[key] = deepcopy(value, true)
    end
  end

return setmetatable(Class, {__call = function(class, ...) return class.define(...) end})
