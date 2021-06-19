-----------------------------------
-- Decouple WOTG Missions from WOTG Nation Quests
--
-- Allows you to play through all of the WOTG mainline
-- missions without having to do the blocking nation
-- quests.
-----------------------------------
require("scripts/missions/wotg/helpers")
-----------------------------------
local enabled = false
if not enabled then
    return
end

module.override(xi.wotg.helpers, "meetsMission3Reqs", function(player)
    return true
end)

module.override(xi.wotg.helpers, "meetsMission8Reqs", function(player)
    return true
end)
