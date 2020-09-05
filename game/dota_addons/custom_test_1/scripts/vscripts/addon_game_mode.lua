-- Generated from template

if custom_test1 == nil then
	custom_test1 = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

require("CAITesting")
require("game_setup")
require("libraries/timers")

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = custom_test1()
	GameRules.AddonTemplate:InitGameMode()
	CAITesting:SpawnAIUnitlane()
end

function custom_test1:InitGameMode()
    print( "Template addon is loaded." )
    
	GameSetup:init()  
	

    GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
    
end

-- Evaluate the state of the game
function custom_test1:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
		
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end