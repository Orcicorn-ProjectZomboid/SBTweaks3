-- *******************************************
-- ** STATISTICS *****************************
-- *******************************************
--  Fatigue is saved from 0.00 to 1.00 (0 awake, 1 dead asleep)
--  Script trigers every 10 minutes, so 6 Triggers in 1 game hour
--  Our server, 1 Game hour = 6 RL Minutes
-- --------------------------------------------
--  Set default required sleep in hours (requiredSleepHours)
--  Set Wakeful to half as much time
--  Set Sleepyhead to twice as much time
-- ********************************************

local function SBTweaksSleep()
    local player = getPlayer()

    if player:isAsleep() then
        -- Configuration Settings
        local requiredSleepHours = 4;           -- Hours of Sleep Required
        local maxSleepHours = 8;                -- Max hours of sleep allowed
        local modifierWakeful = 0.5;            -- If Trait Wakeful, multiply config by this
        local modifierSleepy = 1.5;             -- If trait Sleepyhead, multiply config by this

        -- Gather information about our player
        local playerStats = player:getStats();
        local fatigue = playerStats:getFatigue();
        -- local lastHourSlept = player:getLastHourSleeped();

        -- Calculate the reduction (Fatigue / (HoursRequired * Events))
        local reduction = (1.0 / (requiredSleepHours * 6));

        -- Check traits and adjust our values as needed
        if player:HasTrait("NeedsLessSleep") then 
            reduction = (reduction * modifierWakeful); 
            -- maxSleepHours = (maxSleepHours *modifierWakeful);
        end
        if player:HasTrait("NeedsMoreSleep") then 
            reduction = (reduction * modifierSleepy);
            -- maxSleepHours = (maxSleepHours * modifierSleepy);
        end;

        -- Reduce their fatigue
        playerStats:setFatigue(fatigue - reduction);

        -- If you've been asleep for longer than allowed, time to get up
        -- if (player:getHoursSurvived() - lastHourSlept) >= maxSleepHours then 
        --     player:forceAwake();
        -- end

    end
end
Events.EveryTenMinutes.Add(SBTweaksSleep);
