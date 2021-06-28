-----------------------------------
-- Aiming for Ygnas
-- Seekers of Adoulin M2-6
-----------------------------------
-- !addmission 12 26
-- Ploh Trishbahk : !pos 100.580 -40.150 -63.830 257
-----------------------------------
require('scripts/globals/missions')
require('scripts/globals/settings')
require('scripts/globals/interaction/mission')
require('scripts/globals/utils')
require('scripts/globals/zone')
-----------------------------------
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------

local mission = Mission:new(xi.mission.log_id.SOA, xi.mission.id.soa.AIMING_FOR_YGNAS)

mission.reward =
{
    nextMission = { xi.mission.log_id.SOA, xi.mission.id.soa.CALAMITY_IN_THE_KITCHEN },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.EASTERN_ADOULIN] =
        {
            ['Ploh_Trishbahk'] =
            {
                onTrigger = function(player, npc)
                    return mission:progressEvent(1505)
                end,
            },

            onEventFinish =
            {
                [1505] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
