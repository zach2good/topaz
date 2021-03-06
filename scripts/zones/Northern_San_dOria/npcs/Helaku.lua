-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Helaku
-- Involved in Missions 2-3
-- !pos 49 -2 -12 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local currentMission = player:getCurrentMission(BASTOK)
    local missionStatus = player:getMissionStatus(player:getNation())

    if (currentMission == xi.mission.id.bastok.THE_EMISSARY) then
        -- Bastok Mission 2-3 Part I - San d'Oria > Windurst
        if (missionStatus == 1) then
            player:startEvent(676)
        elseif (missionStatus == 2) then
            player:startEvent(536)
        elseif (missionStatus == 3) then
            player:showText(npc, ID.text.HELAKU_DIALOG)
        -- Bastok Mission 2-3 Part II - Windurst > San d'Oria
        elseif (missionStatus == 7) then
            player:startEvent(537)
        elseif (missionStatus == 11) then
            player:startEvent(557)
        end
    -- Bastok Mission 2-3 Part I - San d'Oria > Windurst
    elseif (currentMission == xi.mission.id.bastok.THE_EMISSARY_SANDORIA) then
        if (missionStatus <= 4) then
            player:startEvent(542)
        else
            player:startEvent(543)
        end
    -- Bastok Mission 2-3 Part II - Windurst > San d'Oria
    elseif (currentMission == xi.mission.id.bastok.THE_EMISSARY_SANDORIA2) then
        missionStatus = player:getMissionStatus(player:getNation())
        if (missionStatus == 7) then
            player:startEvent(537)
        elseif (missionStatus == 9) then
            player:startEvent(542)
        elseif (player:hasKeyItem(xi.ki.KINDRED_CREST)) then
            player:startEvent(545)
        end
    else
        player:startEvent(541)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 536) then
        player:setMissionStatus(player:getNation(), 3)
    elseif (csid == 543) then
        player:addMission(xi.mission.log_id.BASTOK, xi.mission.id.bastok.THE_EMISSARY)
        player:setMissionStatus(player:getNation(), 6)
    elseif (csid == 537 and option == 0) then
        player:addMission(xi.mission.log_id.BASTOK, xi.mission.id.bastok.THE_EMISSARY_SANDORIA2)
        player:setMissionStatus(player:getNation(), 8)
    elseif (csid == 545) then
        player:addMission(xi.mission.log_id.BASTOK, xi.mission.id.bastok.THE_EMISSARY)
        player:setMissionStatus(player:getNation(), 11)
        player:addKeyItem(xi.ki.KINDRED_REPORT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.KINDRED_REPORT)
        player:delKeyItem(xi.ki.KINDRED_CREST)
    end
end

return entity
