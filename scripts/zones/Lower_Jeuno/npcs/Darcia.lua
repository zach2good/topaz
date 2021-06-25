-----------------------------------
-- Area: Lower Jeuno (245)
--  NPC: Darcia
--  SoA: Mission NPC
-- !pos 25 -38.617 -1.000
-----------------------------------
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if ENABLE_SOA == 0 then
        player:startEvent(10124)
    else
        player:startEvent(10123)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
