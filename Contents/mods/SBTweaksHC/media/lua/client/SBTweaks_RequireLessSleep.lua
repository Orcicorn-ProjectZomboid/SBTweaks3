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
        local requiredSleepHours = 2;           -- Hours of Sleep Required
        -- local maxSleepHours = 8;                -- Max hours of sleep allowed
        local modifierWakeful = 0.5;            -- If Trait Wakeful, multiply config by this
        local modifierSleepy = 1.5;             -- If trait Sleepyhead, multiply config by this

        -- Gather information about our player
        local playerStats = player:getStats();
        local fatigue = playerStats:getFatigue();
        local endurance = playerStats:getEndurance();
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

        -- Adjust the Player's values
        if fatigue > 0 then
            -- Reduce Fatigue, we're sleeping
            if fatigue - reduction >= 0 then
                playerStats:setFatigue(fatigue - reduction);
            else
                playerStats:setFatigue(0);
            end
        end
        if endurance + reduction <= 1 then
            -- Increase Endurance
            playerStats:setEndurance(endurance + reduction);
        end

        -- If you've been asleep for longer than allowed, time to get up
        -- if (player:getHoursSurvived() - lastHourSlept) >= maxSleepHours then 
        --     player:forceAwake();
        -- end

    end
end
Events.EveryTenMinutes.Add(SBTweaksSleep);

-- ********************************************************** --
-- JUST SLEEP:  Ignore "Recently Slept" or "Not Tired enough"
-- However, if in pain or panic, require sleeping aid or pain medication
--  See /media/lua/client/ISUI/ISWorldObjectContextMenu.lua for Original
-- ********************************************************** --
ISWorldObjectContextMenu.doSleepOption = function(context, bed, player, playerObj)
	-- Avoid player sleeping inside a car from the context menu, new radial menu does that now
	if(playerObj:getVehicle() ~= nil) then return end
	if(bed and bed:getSquare():getRoom() ~= playerObj:getSquare():getRoom()) then return end
    local text = getText(bed and "ContextMenu_Sleep" or "ContextMenu_SleepOnGround")
    local sleepOption = context:addOption(text, bed, ISWorldObjectContextMenu.onSleep, player);
    local tooltipText = nil

    -- Removed check for if sleep is needed/not tired enough

    -- Sleeping pills counter those sleeping problems
    if playerObj:getSleepingTabletEffect() < 2000 then
        -- CHANGE: Can't sleep if in pain unless sleeping pills
        if playerObj:getMoodles():getMoodleLevel(MoodleType.Pain) >= 2 then
            sleepOption.notAvailable = true;
            tooltipText = getText("ContextMenu_PainNoSleep");
        -- UNCHANGED: In panic
        elseif playerObj:getMoodles():getMoodleLevel(MoodleType.Panic) >= 1 then
            sleepOption.notAvailable = true;
            tooltipText = getText("ContextMenu_PanicNoSleep");
        -- REMOVED: Check if recently slept
        end
    end

    if bed then
        local bedType = bed:getProperties():Val("BedType") or "averageBed";
        local bedTypeXln = getTextOrNull("Tooltip_BedType_" .. bedType)
        if bedTypeXln then
            if tooltipText then
                tooltipText = tooltipText .. " <BR> " .. getText("Tooltip_BedType", bedTypeXln)
            else
                tooltipText = getText("Tooltip_BedType", bedTypeXln)
            end
        end
    end

    if tooltipText then
        local sleepTooltip = ISWorldObjectContextMenu.addToolTip();
        sleepTooltip:setName(getText("ContextMenu_Sleeping"));
        sleepTooltip.description = tooltipText;
        sleepOption.toolTip = sleepTooltip;
    end
end
