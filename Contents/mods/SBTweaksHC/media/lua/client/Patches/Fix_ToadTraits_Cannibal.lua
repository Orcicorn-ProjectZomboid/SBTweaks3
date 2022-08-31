-- Default is <=25, <=50 but since we use skill recovery journal
-- it's pointless. So slight tweaks on the stress levels based on bodies
-- Then seperate the blood box out to be any body over 10
function ZombPatty_OnCreate(items, result, player)
    local stats = player:getStats();
    local times = player:getModData().iTimesCannibal or 0;
    local isFresh = false;
    local FreshOneChanceIn = 5;
    local tooltiptext = "";

    -- First and foremost lets determine if this zombie is fresh or gross and moldy
    if ZombRand(FreshOneChanceIn) == 1 then isFresh = true end

    -- Depending on your experience you react differently to the act of
    -- butchering/skinning a dead human zombie
    if times <= 5 then
        -- I hate this. Stressful
        stats:setStress(stats:getStress() + 0.2);
        tooltiptext = getText("UI_cannibal_early");
    elseif times <= 10 then
        -- It's getting "better" but still stress
        stats:setStress(stats:getStress() + 0.1);
        result:setUnhappyChange(10);
        tooltiptext = getText("UI_cannibal_familiar");
    elseif times <= 25 then
        -- Don't mind doing this. No Stress
        result:setTooltip(getText("UI_cannibal_comfortable"));
        result:setUnhappyChange(-10);
    else
        -- I actually enjoy this. Less Stress and a blood bag too!
        stats:setStress(stats:getStress() - 0.1);
        tooltiptext = getText("UI_cannibal_comfortable");
        result:setUnhappyChange(-10);
        if isFresh then
            player:getInventory():AddItem("MoreTraits.BloodBox");
        else
            player:getInventory():AddItem("MoreTraits.BloodBoxBad");
        end
    end

    -- Here's the meat you requested. is it fresh or rotten?
    result:setRotten(isFresh);
    if isFresh then
        result:setAge(0);
        result:setTooltip(tooltiptext);
    else
        result:setAge(50);
    end
    result:updateAge();

    -- Keep track of your zombie cannibal experiences
    player:getModData().iTimesCannibal = times + 1;
end