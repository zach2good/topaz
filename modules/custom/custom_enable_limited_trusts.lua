-----------------------------------
-- Enable Limited Trusts (Cornelia and Matsui-P)
--
-- 1) The spells will need to be given to players with !addspell 1002 or !addspell 1003
-- 2) A GM command with permission 0 will need to be made to allow players to cast:
--
-- Example(cornelia.lua):
--    cmdprops = { permission = 0, parameters = "" }
--    function onTrigger(player)
--        require("scripts/globals/trust")
--        local spell = GetSpell(1002) -- Cornelia
--        if player:hasSpell(spell:getID()) and xi.trust.canCast(player, spell) then
--            xi.trust.spawn(player, spell)
--        end
--    end
-----------------------------------
require("modules/module")
require("scripts/globals/items")
require("scripts/globals/player")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
-----------------------------------
local m = Module:new("enable_limited_trusts")
m.enabled = false

-----------------------------------
-- Cornelia
-- costume 70
-----------------------------------
m:addSpellListEntry(1002,'cornelia',0x01010101010101010101010101010101010101010101,8,0,7,0,1,0,0,3000,24000,0,0,939,1500,0,0,1.00,0,0,0,0,NULL)
m:addMobPoolEntry(6002,'cornelia','Cornelia',153,0x0000460000000000000000000000000000000000,21,0,3,240,100,0,0,0,0,0,0,32,0,3,0,0,0,0,0,0)

-- Build cache entry
local cornelia = {}

cornelia.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

cornelia.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

cornelia.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.SPAWN)

    -- Potency of benefits is dependent on your current level. At Level 99, her benefit to Accuracy and Ranged Accuracy is +30.
    local power = (mob:getMainLvl() / 10) * 3

    -- Grants the following aura benefits: Haste+ (Indi-Haste), Accuracy+ (Indi-Precision), Range Accuracy+, Magic Accuracy+ (Indi-Focus).
    xi.job_utils.geomancer.addAura(mob, 0, xi.effect.GEO_HASTE, power, xi.auraTarget.ALLIES)
    xi.job_utils.geomancer.addAura(mob, 0, xi.effect.GEO_ACCURACY_BOOST, power, xi.auraTarget.ALLIES)
    -- TODO: Range Accuracy+
    xi.job_utils.geomancer.addAura(mob, 0, xi.effect.GEO_MAGIC_ACC_BOOST, power, xi.auraTarget.ALLIES)

    -- TODO: Only shows the icon for Haste, but the other 3 beneficial effects are also automatically applied.

    mob:SetAutoAttackEnabled(false)
end

cornelia.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

cornelia.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

-- Add to cache
xi.globals.spells.trust["cornelia"] = cornelia

-----------------------------------
-- Matsui-P
-- !costume 3121
-----------------------------------
m:addSpellListEntry(1003,'matsui-p',0x01010101010101010101010101010101010101010101,8,0,7,0,1,0,0,3000,24000,0,0,939,1500,0,0,1.00,0,0,0,0,NULL)
m:addMobPoolEntry(6003,'matsui-p','Matsui-P',153,0x0000310C00000000000000000000000000000000,13,4,9,190,60,0,0,0,0,0,0,32,0,3,0,0,435,0,0,1148)

-- Build cache entry
local matsui = {}

matsui.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

matsui.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

matsui.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.SPAWN)

    -- "Prefers to open skillchains. Will remember the last weapon skill used by the party leader
    -- and will open the highest-tier skillchain possible. Will not open skillchains for other
    -- trusts in the party."
    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.SPECIAL_AYAME)
end

matsui.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

matsui.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

-- Add to cache
xi.globals.spells.trust["matsui-p"] = matsui
