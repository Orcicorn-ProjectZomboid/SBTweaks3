-- Adjust how strong fire is against zombies
-- Adjust the multiplier to increase or decrease the damage zombies take
-- For example default damage is 0.0038, so if we set the multiplier to 2, they'd
-- take 2x the amount of damage.  Health is 1.0 and sometimes 1.5, so setting the multiplier
-- to 10 means they'll take 0.038 damage a ticket, so the zombie dies after 3-5 ticks
Events.OnGameStart.Add(function()
    local defaultValue = 0.0038
    local multiplier = 10;          -- Increase/Decrease the damage taking from fire
    local expectedFireKillRate = (defaultValue * multiplier)
    Events.OnZombieUpdate.Add(function(zombie)
        if zombie:getFireKillRate() ~= expectedFireKillRate then
            zombie:setFireKillRate(expectedFireKillRate)
        end
    end)
end)
