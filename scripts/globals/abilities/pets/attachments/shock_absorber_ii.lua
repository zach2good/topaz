-----------------------------------
-- Attachment: Shock Absorber II
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local attachment_object = {}

attachment_object.onEquip = function(pet)
    pet:setLocalVar("stoneskin", VanadielTime() + 180)
    pet:setLocalVar("shockabsorber", pet:getLocalVar("shockabsorber") + 2)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_SHOCK_ABSORBER_II", function(automaton, target)
        local master = automaton:getMaster()
        if not automaton:hasRecast(xi.recast.ABILITY, 1946) and master and master:countEffect(xi.effect.EARTH_MANEUVER) > 0 and automaton:getLocalVar("stoneskin") < VanadielTime() then
            automaton:useMobAbility(1946, automaton)
        end
    end)
end

attachment_object.onUnequip = function(pet)
    pet:setLocalVar("shockabsorber", pet:getLocalVar("shockabsorber") - 2)
    pet:removeListener("ATTACHMENT_SHOCK_ABSORBER_II")
end

attachment_object.onManeuverGain = function(pet, maneuvers)
end

attachment_object.onManeuverLose = function(pet, maneuvers)
end

return attachment_object
