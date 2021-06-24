-----------------------------------
-- Misc Custom Changes
-- Small changes that don't result in giant shifts in gameplay
-- Many ported from options in settings.lua
-----------------------------------
require("modules/module")
require("modules/globals/homepoint")
-----------------------------------
local m = Module:new("custom_misc")
m.enabled = false

-- settings.lua: HOMEPOINT_HEAL
-- Set to 1 if you want Home Points to heal you like in single-player Final Fantasy games.
m.override(xi.homepoint, "onTrigger", function(player, csid, index)
    -- Full Heal
    player:addHP(player:getMaxHP())
    player:addMP(player:getMaxMP())

    -- Call super
    super(player, csid, index)
end
