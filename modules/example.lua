-----------------------------------
-- Basic Example Module
-----------------------------------
require("scripts/globals/items")
require("scripts/globals/player")
-----------------------------------
local enabled = false
if not enabled then
    return -1
end

-- Override: xi.player.onPlayerLevelUp = function(player) ... end
module.override(xi.player, "onPlayerLevelUp", function(player)
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
