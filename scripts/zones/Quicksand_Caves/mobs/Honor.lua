-----------------------------------
-- Area: Quicksand Caves
--  Mob: Honor
-- Coming of Age (San dOria Mission 8-1)
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    DespawnMob(mob:getID(), 180)
    mob:addMod(xi.mod.SLEEPRES, 50)
    mob:addMod(xi.mod.LULLABYRES, 50)
end

entity.onMobDeath = function(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == xi.mission.id.sandoria.COMING_OF_AGE and player:getMissionStatus(player:getNation()) == 2) then
        player:setMissionStatus(player:getNation(), 3)
    end
end

return entity
