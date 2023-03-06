local function deepcopy(orig, set_mt)
  if orig == nil then return nil end
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepcopy(orig_key, set_mt)] = deepcopy(orig_value, set_mt)
    end
    if set_mt then
      setmetatable(copy, getmetatable(orig))
    end
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

return deepcopy
