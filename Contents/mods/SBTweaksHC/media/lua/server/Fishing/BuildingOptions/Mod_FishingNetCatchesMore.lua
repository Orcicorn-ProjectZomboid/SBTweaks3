require "Fishing/BuildingObjects/FishingNet.lua"

fishingNet.checkTrap = function(player, trap, hours)
    -- the fishnet can broke !
    local fishCaught = false;
   if hours > 15 and ZombRand(10) == 0 then
       getSoundManager():PlayWorldSound("getFish", false, player:getSquare(), 1, 20, 1, false)
       player:playSound("CheckFishingNet");
       trap:getSquare():transmitRemoveItemFromSquare(trap);
       player:getInventory():AddItem("Base.BrokenFishingNet");
       return;
   end
    if hours > 20 then
        hours = 20;
    end

    -- Add loot to the fishing trap (or attempt to atleast)
    for i=1,hours do
        -- Vanilla (25% to get Baitfish)
        if ZombRand(4) == 0 then
            player:getInventory():AddItem("Base.BaitFish");
            fishCaught = true;
        end
        -- MODDED
        --> 10% chance of crayfish
        if ZombRand(10) == 0 then
            player:getInventory():AddItem("Base.Crayfish");
            fishCaught = true;
        end
        --> 5% chance of Shrimp
        if ZombRand(20) == 0 then
            player:getInventory():AddItem("Base.Shrimp");
            fishCaught = true;
        end
        -- 2% Chance of an Oyster
        if ZombRand(50) == 0 then
            player:getInventory():AddItem("Base.Oysters");
            fishCaught = true;
        end
        -- 1% Chance of Squid
        if ZombRand(80) == 0 then
            player:getInventory():AddItem("Base.Squid");
            fishCaught = true;
        end
        
    end
    if fishCaught then
        fishCaught = false;
        player:getXp():AddXP(Perks.Fishing, 1);
    end
    fishingNet.doTimestamp(trap);
end
