--[[
  Only store data you need to share across scenes that you aren't persisting in some other manner in here.
  Just add any variables you need to the table....
--]]

local Globals = 
{
    ["Score"]        = 1,
    ["Something else you care about"]    = 1200,
    ["StandardLabelColors"] = {["r"] = 200, ["g"] = 30, ["b"] = 40, ["a"] = 255},    
}
 
function getGlobal(key)
    local val = Globals[key]
    return val
end
 
function setGlobal(key, val)
    Globals[key] = val
    return
end