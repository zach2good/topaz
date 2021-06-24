-----------------------------------
-- Decouple WOTG Missions from WOTG Nation Quests
--
-- Allows you to play through all of the WOTG mainline
-- missions without having to do the blocking nation
-- quests.
-----------------------------------
require("modules/module")
require("scripts/missions/wotg/helpers")
-----------------------------------
local m = Module:new("decouple_wotg_missions_from_worg_quests")
m.enabled = false

m:override(xi.wotg.helpers, "meetsMission3Reqs", function(player)
    return true
end)

m:override(xi.wotg.helpers, "meetsMission8Reqs", function(player)
    return true
end)
