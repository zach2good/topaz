-----------------------------------
-- Basic Example Module
-----------------------------------
require("modules/module")
require("scripts/globals/items")
require("scripts/globals/player")
-----------------------------------
local m = Module:new("example_module")
m.enabled = false

-- Override: xi.player.onPlayerLevelUp = function(player) ... end
m.override(xi.player, "onPlayerLevelUp", function(player)
    -- Call the original function before your logic
    super(player)

    -- Do something with the <player> object
    print("Player: " .. player:getName() .." has leveled up!")
    player:addItem(xi.items.CHUNK_OF_ROCK_SALT)

    -- Call the original function after your logic
    -- (You can call the super multiple times, if you want)
    super(player)

    -- NOTE: If you don't call the super from your module, it won't fire at all!
end)
