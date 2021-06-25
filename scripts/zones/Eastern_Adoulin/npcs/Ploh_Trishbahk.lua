-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Ploh Trishbahk
-- Type: Palace Guard
-- !pos 100.580 -40.150 -63.830 257
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(563)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
