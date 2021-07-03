-----------------------------------
-- Area: Mhaura
--  NPC: Fyi_Chalmwoh
-- !pos -39.273 -16.000 70.126 249
-----------------------------------
require("scripts/globals/items")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local rainingMannequins = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ITS_RAINING_MANNEQUINS)
    if rainingMannequins == QUEST_COMPLETED then
        if
            (npcUtil.tradeHasExactly(trade, { xi.items.HUME_M_MANNEQUIN }) or
            npcUtil.tradeHasExactly(trade, { xi.items.HUME_F_MANNEQUIN }) or
            npcUtil.tradeHasExactly(trade, { xi.items.ELVAAN_M_MANNEQUIN }) or
            npcUtil.tradeHasExactly(trade, { xi.items.ELVAAN_F_MANNEQUIN }) or
            npcUtil.tradeHasExactly(trade, { xi.items.TARUTARU_M_MANNEQUIN }) or
            npcUtil.tradeHasExactly(trade, { xi.items.TARUTARU_F_MANNEQUIN }) or
            npcUtil.tradeHasExactly(trade, { xi.items.MITHRA_MANNEQUIN }) or
            npcUtil.tradeHasExactly(trade, { xi.items.GALKA_MANNEQUIN })) and
            player:getGil() >= 2000
        then
            player:startEvent(319, 2, 0, 100000, 2000, 0, 0, 4095, 0)
        end
    end
end

entity.onTrigger = function(player, npc)
    local rainingMannequins = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.ITS_RAINING_MANNEQUINS)

    -- Mannequin shop + exchange
    -- TODO: When you try to buy a new one, mannequins you already own aren't available
    -- TODO: Check money
    if rainingMannequins == QUEST_COMPLETED then
        local alreadyOwnedMask = 0
        player:startEvent(318, 0, alreadyOwnedMask, 100000, 2000, 0, 0, 0, 0)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 318 or csid == 319 then
        if option == 1 then
            player:addItem({ id = xi.items.HUME_M_MANNEQUIN, exdata = { [18] = 1 } })
        elseif option == 2 then
            player:addItem({ id = xi.items.HUME_F_MANNEQUIN, exdata = { [18] = 2 } })
        elseif option == 3 then
            player:addItem({ id = xi.items.ELVAAN_M_MANNEQUIN, exdata = { [18] = 3 } })
        elseif option == 4 then
            player:addItem({ id = xi.items.ELVAAN_F_MANNEQUIN, exdata = { [18] = 4 } })
        elseif option == 5 then
            player:addItem({ id = xi.items.TARUTARU_M_MANNEQUIN, exdata = { [18] = 5 } })
        elseif option == 6 then
            player:addItem({ id = xi.items.TARUTARU_F_MANNEQUIN, exdata = { [18] = 6 } })
        elseif option == 7 then
            player:addItem({ id = xi.items.MITHRA_MANNEQUIN, exdata = { [18] = 7 } })
        elseif option == 8 then
            player:addItem({ id = xi.items.GALKA_MANNEQUIN, exdata = { [18] = 8 } })
        end
    end
end

return entity
