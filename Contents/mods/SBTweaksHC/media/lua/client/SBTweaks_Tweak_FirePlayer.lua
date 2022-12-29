-- Adjust the fire damage sustained by players
-- Adjust the "Multiplier" to change how much damage a player takes from fire
-- For example 1.0 means take regular amount of damage per tick from fire
-- While 2.0 means takes double damage or 0 means take no damage
-- Setting to 0.5 reduces the amount of damage a player takes by 50%
Events.OnGameStart.Add(function()
    local multiplier = 0.5;                 -- set the fire rate here
	local p = getSpecificPlayer(0)
	p:setFireKillRate(p:getFireKillRate() * multiplier)
end)
