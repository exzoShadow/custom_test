CAITesting = class({})
LinkLuaModifier ( "modifier_ai", LUA_MODIFIER_MOTION_NONE)

function CAITesting:Init()
    print( "Loading AI Testing Game Mode." )
    -- SEEDING RNG IS VERY IMPORTANT
    math.randomseed(Time())

    -- Set up a table to hold all the units we want to spawn
    --self.UnitThinkerList = {}

    -- Spawn some units
    for i = 1,5 do
        --self:SpawnAIUnitWanderer()
        self:SpawnAIUnitlane()
    end
    

    -- Set the unit thinker function
    --GameRules:GetGameModeEntity():SetThink( "OnUnitThink", self, "UnitThink", 1 )
end


function CAITesting:SpawnAIUnitlane()
local waypoint = Entities:FindByName( nil, "path1")
local spawnPoint = Entities:FindByName( nil, "test_1")
local spawnPointOrigin = spawnPoint:GetAbsOrigin()

Timers:CreateTimer(function()

  local unit = CreateUnitByName("npc_dota_creature_gnoll_assassin", spawnPointOrigin, false, nil, nil, DOTA_TEAM_NEUTRALS)
  unit:SetInitialGoalEntity(waypoint)

  return 10.0
end)
end