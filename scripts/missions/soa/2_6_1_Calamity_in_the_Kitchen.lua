-----------------------------------
-- Budding Prospects
-- Seekers of Adoulin M2-1
-----------------------------------
-- !addmission 12 11
-- Levil : !pos -87.204 3.350 12.655 256
-----------------------------------
require('scripts/globals/missions')
require('scripts/globals/settings')
require('scripts/globals/interaction/mission')
require('scripts/globals/utils')
require('scripts/globals/zone')
-----------------------------------
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------

local mission = Mission:new(xi.mission.log_id.SOA, xi.mission.id.soa.CALAMITY_IN_THE_KITCHEN)

mission.reward =
{
    nextMission = { xi.mission.log_id.SOA, xi.mission.id.soa.ARCIELAS_PROMISE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,


    },
}

return mission
