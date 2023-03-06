--- Wraps table so all of snake_case indexes becomes pascalCase
return function(tbl)
  tbl = tbl or {}
  local wrap_tbl = {__orig = tbl}
  local wrap_mt = {}
  wrap_mt.__index = function(_, key)
    return tbl[key] or tbl[key:gsub('_(%l)', string.upper)]
  end
  return setmetatable(wrap_tbl, wrap_mt)
end
