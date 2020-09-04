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
--[[
function CAITesting:SpawnAIUnitWanderer()
    --Start an iteration finding each entity with this name
    --If you've named everything with a unique name, this will return your entity on the first go
    local spawnVectorEnt = Entities:FindByName(nil, "spawn_loc_test")

    -- GetAbsOrigin() is a function that can be called on any entity to get its location
    local spawnVector = spawnVectorEnt:GetAbsOrigin()

    -- Spawn the unit at the location on the neutral team
    spawnedUnit = CreateUnitByName("npc_dota_creature_kobold_tunneler", spawnVector, true, nil, nil, DOTA_TEAM_NEUTRALS)
    if spawnedUnit:AddNewModifier(nil, nil, "modifier_ai", { aggroRange = 600, leashRange = 600 }) then
        print( "Loading modifier_ai Game Mode." )
    else
        print("not working" .. GameRules:GetGameTime())
    end
    -- make this unit passive
    --spawnedUnit:SetIdleAcquire(true)

    -- finally, insert the unit into the table
    --table.insert(self.UnitThinkerList, spawnedUnit)
end ]]
--[[
function CAITesting:SpawnAIUnitlane()
    --Start an iteration finding each entity with this name
    --If you've named everything with a unique name, this will return your entity on the first go
    local spawnVectorEnt = Entities:FindByName(nil, "test_2")

    -- GetAbsOrigin() is a function that can be called on any entity to get its location
    local spawnVector = spawnVectorEnt:GetAbsOrigin()
     Timers:CreateTimer(5, function()
        -- Spawn the unit at the location on the neutral team
        spawnedUnit = CreateUnitByName("npc_dota_creature_gnoll_assassin", spawnVector, true, nil, nil, DOTA_TEAM_NEUTRALS)
        --spawnedUnit:AddNewModifier(nil, nil, "modifier_ai", { aggroRange = 600, leashRange = 600 })
    end)

    -- make this unit passive
    --spawnedUnit:SetIdleAcquire(true)

    -- finally, insert the unit into the table
    --table.insert(self.UnitThinkerList, spawnedUnit)
end]]

function CAITesting:SpawnAIUnitlane()
    print( "test spawn function" )
    -- Wait one frame to do logic on a spawned unit
    local spawnVectorEnt = Entities:FindByName(nil, "test_2")
    local spawnVector = spawnVectorEnt:GetAbsOrigin()

    if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        --print( "Template addon script is running." )
                    
    Timers:CreateTimer(10, function()
        print( "test CreateTimer function" )
        
        spawnedUnit = CreateUnitByName("npc_dota_creature_gnoll_assassin", spawnVector, true, nil, nil, DOTA_TEAM_NEUTRALS)
        
        --thisEntity.nodraw_on_death = true
        --destination_reached = false
    print( "test spawn function" )
        local waypoint = Entities:FindByName(nil, "path_1")
    end)

    elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
        return nil
    end
        return 1
  end