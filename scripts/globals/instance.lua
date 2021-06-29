-----------------------------------
-- Instance
-----------------------------------
-- Salvage
-- Wings of the Goddess storyline missions
-- Certain Campaign Ops
-- Moblin Maze Mongers
-- The Notorious Monster battles that occur when Sandworm sucks in players using Doomvoid
--
-- Instance zones:
-- - ILRUSI_ATOLL                    = 55,
-- - PERIQIA                         = 56,
-- - THE_ASHU_TALIF                  = 60,
-- - LEBROS_CAVERN                   = 63,
-- - MAMOOL_JA_TRAINING_GROUNDS      = 66,
-- - LEUJAOAM_SANCTUM                = 69,
-- - ZHAYOLM_REMNANTS                = 73,
-- - ARRAPAGO_REMNANTS               = 74,
-- - BHAFLAU_REMNANTS                = 75,
-- - SILVER_SEA_REMNANTS             = 76,
-- - NYZUL_ISLE                      = 77,
-- - EVERBLOOM_HOLLOW                = 86,
-- - RUHOTZ_SILVERMINES              = 93,
-- - GHOYUS_REVERIE                  = 129,
-- - MAQUETTE_ABDHALJS_LEGION_A      = 183,
-- - RALA_WATERWAYS_U                = 259,
-- - YORCIA_WEALD_U                  = 264,
-- - CIRDAS_CAVERNS_U                = 271,
-- - OUTER_RAKAZNAR_U                = 275,
-- - MAQUETTE_ABDHALJS_LEGION_B      = 287, -- See: ambuscade.lua
-- - DYNAMIS_SAN_DORIA_D             = 294,
-- - DYNAMIS_BASTOK_D                = 295,
-- - DYNAMIS_WINDURST_D              = 296,
-- - DYNAMIS_JEUNO_D                 = 297,
-----------------------------------
require("scripts/globals/utils")
-----------------------------------
xi = xi or {}
xi.instance = {}

--[[
    [zoneId] =
    {
        { instanceIdInDatabase, csArgs (to be unpacked) }
    },
--]]

xi.instance.lookup =
{
    [xi.zone.ILRUSI_ATOLL] =
    {
        -- Assault: Golden Salvage
        -- Assault: Lamia No.13
        -- Assault: Extermination
        -- Assault: Demolition Duty
        -- Assault: Searat Salvation
        -- Assault: Apkallu Seizure
        -- Assault: Lost and Found
        -- Assault: Deserter
        -- Assault: Desperately Seeking Cephalopods
        -- Assault: Bellerophon's Bliss
    },

    [xi.zone.PERIQIA] =
    {
        -- Assault: Seagull Grounded
        -- Assault: Requiem
        -- Assault: Saving Private Ryaaf
        -- Assault: Shooting Down the Baron
        -- Assault: Stop the Bloodshed
        -- Assault: Defuse the Threat
        -- Assault: Operation: Snake Eyes
        -- Assault: Wake the Puppet
        -- Assault: The Price is Right
    },

    [xi.zone.THE_ASHU_TALIF] =
    {
        -- Against All Odds (COR AF)
        -- Assault: Royal Painter Escort
        -- Assault: Scouting the Ashu Talif
        -- Assault: Targeting the Captain
        -- The Black Coffin (TOAU 15)
        -- Testing the Waters (TOAU 34)
        -- Legacy of the Lost (TOAU 35)
    },

    [xi.zone.LEBROS_CAVERN] =
    {
        -- Assault: Excavation Duty
        -- Assault: Lebros Supplies
        -- Assault: Troll Fugitives
        -- Assault: Evade and Escape
        -- Assault: Siegemaster Assassination
        -- Assault: Apkallu Breeding
        -- Assault: Wamoura Farm Raid
        -- Assault: Egg Conservation
        -- Assault: Operation: Black Pearl
        -- Assault: Better Than One
    },

    [xi.zone.MAMOOL_JA_TRAINING_GROUNDS] =
    {
        -- Assault: Imperial Agent Rescue
        -- Assault: Preemptive Strike
        -- Assault: Sagelord Elimination
        -- Assault: Breaking Morale
        -- Assault: The Double Agent
        -- Assault: Imperial Treasure Retrieval
        -- Assault: Blitzkrieg
        -- Assault: Marids in the Mist
        -- Assault: Azure Ailments
        -- Assault: The Susanoo Shuffle
    },

    [xi.zone.LEUJAOAM_SANCTUM] =
    {
        -- Assault: Leujaoam Cleansing
        -- Assault: Orichalcum Survey
        -- Assault: Escort Professor Chanoix
        -- Assault: Shanarha Grass Conservation
        -- Assault: Counting Sheep
        -- Assault: Supplies Recovery
        -- Assault: Azure Experiments
        -- Assault: Imperial Code
        -- Assault: Red Versus Blue
        -- Assault: Bloody Rondo
    },

    [xi.zone.ZHAYOLM_REMNANTS] =
    {
        -- Salvage
    },

    [xi.zone.ARRAPAGO_REMNANTS] =
    {
        -- Salvage
    },

    [xi.zone.BHAFLAU_REMNANTS] =
    {
        -- Salvage
    },

    [xi.zone.SILVER_SEA_REMNANTS] =
    {
        -- Salvage
    },

    [xi.zone.NYZUL_ISLE] =
    {
        -- Path of Darkness
        -- Nashmeira's Plea
        -- Waking the Colossus / Divine Interference
        -- Forging a New Myth
    },

    [xi.zone.EVERBLOOM_HOLLOW] =
    {
        -- Doomvoid - King Arthro
        -- Doomvoid - Lambton Worm
        -- Honor Under Fire
        -- Bonds That Never Die
        -- A Nation on the Brink
        -- Dungeons and Dancers
        -- Campaign Ops
        -- Brave Dawn I (San d'Oria)
        -- Brave Dawn II (San d'Oria)
        -- Brave Dawn III (San d'Oria)
        -- Granite Rose I (San d'Oria)
        -- Granite Rose II (San d'Oria)
        -- Granite Rose III (San d'Oria)
        -- Pit Spider I (San d'Oria)
        -- Pit Spider II (San d'Oria)
        -- Pit Spider III (San d'Oria)
        -- Moblin Maze Mongers
    },

    [xi.zone.RUHOTZ_SILVERMINES] =
    {
        -- Moblin Maze Mongers
        -- Doomvoid - Lambton Worm
        -- Doomvoid - Guivre
        { 8600, { 0,  0, 19 } }, -- Light in the Darkness (WOTG Bastok Quest 3)
        -- { 0, { 0,  0, 36 } }, -- Fire in the Hole (WOTG Bastok Quest 6)
        -- { 0, { 0,  0, 34 } }, -- Seeing Blood-red (SCH AF3)
        -- { 0, { 0, 23,  0 } }, -- Distorter of Time
        -- Campaign Ops
        -- Brave Dawn I (Bastok)
        -- Brave Dawn II (Bastok)
        -- Brave Dawn III (Bastok)
        -- By Light of Fire I (Bastok)
        -- Granite Rose I (Bastok)
        -- Granite Rose II (Bastok)
        -- Granite Rose III (Bastok)
        -- Pit Spider I (Bastok)
        -- Pit Spider II (Bastok)
    },

    [xi.zone.GHOYUS_REVERIE] =
    {
        -- Doomvoid - Lambton Worm
        -- Doomvoid - Serket
        -- A Feast for Gnats
        -- A Manifest Problem
        -- In a Haze of Glory
        -- Sins of the Mothers
        -- Campaign Ops
        -- Brave Dawn I (Windurst)
        -- Brave Dawn II (Windurst)
        -- Brave Dawn III (Windurst)
        -- Granite Rose I (Windurst)
        -- Granite Rose II (Windurst)
        -- Pit Spider I (Windurst)
        -- Pit Spider II (Windurst)
    },

    [xi.zone.MAQUETTE_ABDHALJS_LEGION_A] =
    {
        -- Hall of An
        -- Hall of Ki
        -- Hall of Im
        -- Hall of Muru
        -- Hall of Mul
    },

    [xi.zone.RALA_WATERWAYS_U] =
    {
        -- {  0, 0 }, -- Endeavoring to Awaken
        -- {  1, 0 }, -- Endeavoring to Awaken
        -- -- Blank
        -- {  3, 0 }, -- Behind the Sluices
        -- {  4, 0 }, -- Stonewalled
        -- {  5, 0 }, -- The Gates
        -- {  6, 0 }, -- Saved by the Bell
        -- {  7, 0 }, -- Quiescence
        -- {  8, 0 }, -- The Charlatan
        -- {  9, 0 }, -- Yggdrasil Beckons
        -- { 10, 0 }, -- Yggdrasil Beckons
        -- { 11, 0 }, -- Watery Grave
        -- { 12, 0 }, -- Mistress of Ceremonies
        -- { 13, 0 }, -- A Barrel of Laughs
        -- { 14, 0 }, -- Sinister Reign
        -- { 15, 0 }, -- The Ygnas Directive 6
        -- { 16, 0 }, -- Skirmishes
        -- { 17, 0 }, -- Fractures
        -- { 18, 0 }, -- Alluvion skirmishes
        -- { 19, 0 }, -- The Silent Forest
        -- { 20, 0 }, -- Wind of Eternity
    },

    [xi.zone.YORCIA_WEALD_U] =
    {

    },

    [xi.zone.CIRDAS_CAVERNS_U] =
    {

    },

    [xi.zone.OUTER_RAKAZNAR_U] =
    {

    },

    [xi.zone.DYNAMIS_SAN_DORIA_D] =
    {

    },

    [xi.zone.DYNAMIS_BASTOK_D] =
    {

    },

    [xi.zone.DYNAMIS_WINDURST_D] =
    {

    },

    [xi.zone.DYNAMIS_JEUNO_D] =
    {

    },
}

xi.instance.onTrade = function(player, npc, trade)
end

xi.instance.onTrigger = function(player, npc, instanceZoneID, csid)
    local zoneLookup = xi.instance.lookup[instanceZoneID]

    -- TODO: Extract player eligibility

    local instanceId = zoneLookup[1][1]
    player:setLocalVar("INSTANCE_ID", instanceId)

    player:startEvent(csid, unpack(zoneLookup[1][2]))
end

xi.instance.onEventUpdate = function(player, csid, option)
    local instanceId = player:getLocalVar("INSTANCE_ID")
    player:createInstance(instanceId)
end

xi.instance.onEventFinish = function(player, csid, option)
end

local function setInstanceLastTimeUpdateMessage(instance, players, remainingTimeLimit, text)
    local message = 0
    local lastTimeUpdate = instance:getLastTimeUpdate()

    if lastTimeUpdate == 0 and remainingTimeLimit < 600 then
        message = 600
    elseif lastTimeUpdate == 600 and remainingTimeLimit < 300 then
        message = 300
    elseif lastTimeUpdate == 300 and remainingTimeLimit < 60 then
        message = 60
    elseif lastTimeUpdate == 60 and remainingTimeLimit < 30 then
        message = 30
    elseif lastTimeUpdate == 30 and remainingTimeLimit < 10 then
        message = 10
    end

    if message ~= 0 then
        for i, player in pairs(players) do
            if remainingTimeLimit >= 60 then
                player:messageSpecial(text.TIME_REMAINING_MINUTES, remainingTimeLimit / 60)
            else
                player:messageSpecial(text.TIME_REMAINING_SECONDS, remainingTimeLimit)
            end
        end
        instance:setLastTimeUpdate(message)
    end
end

xi.instance.updateInstanceTime = function(instance, elapsed, text)
    local players = instance:getChars()
    local remainingTimeLimit = (instance:getTimeLimit()) * 60 - (elapsed / 1000)
    local wipeTime = instance:getWipeTime()

    if remainingTimeLimit < 0 or (wipeTime ~= 0 and (elapsed - wipeTime) / 1000 > 180) then
        instance:fail()
        return
    end

    if wipeTime == 0 then
        local wipe = true
        for i, player in pairs(players) do
            if player:getHP() ~= 0 then
                wipe = false
                break
            end
        end
        if wipe then
            for i, player in pairs(players) do
                player:messageSpecial(text.PARTY_FALLEN, 3)
            end
            instance:setWipeTime(elapsed)
        end
    else
        for i, player in pairs(players) do
            if player:getHP() ~= 0 then
                instance:setWipeTime(0)
                break
            end
        end
    end
    setInstanceLastTimeUpdateMessage(instance, players, remainingTimeLimit, text)
end
