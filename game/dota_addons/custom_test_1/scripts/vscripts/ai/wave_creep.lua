function Spawn(keys)
  print( "test spawn function" )
  -- Wait one frame to do logic on a spawned unit
  Timers:CreateTimer(.1, function()
    print( "test CreateTimer function" )
	--thisEntity.nodraw_on_death = true
  --destination_reached = false
  print( "test spawn function" )
  --  local map = thisEntity.map
   -- local waypoints = {}
	--local particleName = "particles/creep_effects/spawn_effect.vpcf"
    --local particle = ParticleManager:CreateParticle( particleName, PATTACH_ABSORIGIN_FOLLOW, thisEntity)
	  --ParticleManager:SetParticleControl(particle, 0, thisEntity:GetOrigin())
    --ParticleManager:SetParticleControl(particle, 3, thisEntity:GetOrigin())
	
    --for i=1,4 do
      local waypointName = "path_1"
      local waypoint = Entities:FindByName(nil, waypointName) 
     --table.insert(waypoints, waypoint)
     --for k,v in ipairs(waypoints) do    print(k,v) end
      ExecuteOrderFromTable({
        UnitIndex = thisEntity:entindex(),
        OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
        TargetIndex = 0, --Optional.  Only used when targeting units
        AbilityIndex = 0, --Optional.  Only used when casting abilities
        Position = waypoint:GetAbsOrigin(), --Optional.  Only used when targeting the ground
        Queue = true
      --})
    --end

    --thisEntity.waypoints = waypoints
    --thisEntity.goal = waypoints[1]:GetAbsOrigin()

    --Timers:CreateTimer(function() return thisEntity:AIThink() end)
  end)
end


function thisEntity:AIThink()
  if self:IsNull() then return end
  if not self:IsAlive() then return end

  if not self.goal then
    return
  end

  if self:ArrivedAtGoal() then
    self:UpdateGoal()
  end
  return .1
end

function thisEntity:ArrivedAtGoal()
  local distanceToGoal = GridNav:FindPathLength(self:GetAbsOrigin(), self.goal)
  if distanceToGoal < 50 then
    return true
  else
    return false
  end
end

function thisEntity:UpdateGoal()
  local nextGoal = table.remove(self.waypoints, 1)
  if nextGoal then
    self.goal = nextGoal:GetAbsOrigin()
  else
    self.goal = nil
  end
  
end