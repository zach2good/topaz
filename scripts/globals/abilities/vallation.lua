-----------------------------------
-- Ability: Vallation
-- Enhances attacks of party members within area of effect.
-- Obtained: Warrior Level 35
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    local merit = 0 --player:getMerit(xi.merit.SAVAGERY)
    local power = 0
    local duration = 120

    --if player:getMainJob() == xi.job.WAR then
    --    power = math.floor((player:getMainLvl()/4)+4.75)/256
    --else
    --    power = math.floor((player:getSubLvl()/4)+4.75)/256
   -- end

    --power = power * 100
    --duration = duration + player:getMod(xi.mod.WARCRY_DURATION)

    target:addStatusEffect(xi.effect.VALLATION,power,0,duration,0,merit)
end 

return ability_object
