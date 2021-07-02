-----------------------------------
-- Area: Mhaura
--  NPC: Fyi_Chalmwoh
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:additem({ id = 256, exdata = { [18] = 1 } })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
