-----------------------------------
-- Custom Mog Wardrobe Unlocks
-----------------------------------
require("modules/module")
require("scripts/globals/interaction/interaction_global")
require("scripts/globals/zone")
-----------------------------------
local m = Module:new("custom_wardrobe_unlocks")
m.enabled = false

-- Unlock Mog Wardrobe 3 after THE_CELESTIAL_NEXUS fight win
m.override(InteractionGlobal.lookup.data[xi.zone.THE_CELESTIAL_NEXUS]["onEventFinish"], "32001", function(player, csid, option, npc)
    if player:getLocalVar("battlefieldWin") == 320 then
        player:changeContainerSize(xi.inv.WARDROBE2, 80)
    end
    super(player, csid, option, npc)
end
