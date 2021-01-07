-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effecttbl = {}

function onEffectGain(target, effect)
    target:addPetMod(tpz.mod.ACC, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delPetMod(tpz.mod.ACC, effect:getPower())
end

return effecttbl
