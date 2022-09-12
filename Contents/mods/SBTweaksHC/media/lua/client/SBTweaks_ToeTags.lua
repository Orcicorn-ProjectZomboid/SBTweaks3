function CreateToeTag(player)
    -- Only do it if you're a player and you're the player who died
    if not instanceof(player, "IsoPlayer") then
        return
    end
    if not player:isLocalPlayer() then
        return
    end

    -- Collect some Information about this dead player
    local gameTime = getGameTime();
    local playerInfected = player:getBodyDamage():getInfectionLevel() > 0

    -- Populate the Item name "[Hours Survived] Character Name"
    local itemName = "[" .. string.format("%08.2f", player:getHoursSurvived()) .. "] " .. player:getFullName();

    -- Populate the Tooltip details
    -- Died date, survived length, Human Player Name, Kill Count, was infected?
    local details = "Died: " .. gameTime:getMonth() .. "/" .. gameTime:getDay() .. "/" .. gameTime:getYear() ..
                    " at " .. string.format("%02d", gameTime:getHour()) .. ":" .. string.format("%02d",gameTime:getMinutes()) .. "\n" ..
                    "Survived: " .. player:getTimeSurvived() .. "\n" ..
                    "Player: " .. player:getUsername() .. "\n" .. 
                    "Kills: " .. player:getZombieKills();
    if playerInfected then 
        details = details .. "\n\nInfected with Knox virus"
    end 

    -- Add the Toe tag to inventory
    inventory = player:getInventory();
    item = inventory:AddItem("Base.PlayerToeTag")
    item:setWeight(0);
    
    -- Apply the Custom Name & tooltip information
    item:setName(itemName);
    item:addPage(1, details)

    -- Lock the item with an unobtainable name so it can't be used as paper
    item:setLockedBy("GrimReaper#" .. getGametimeTimestamp());
end

Events.OnCharacterDeath.Add(CreateToeTag)
-- Events.OnWeaponSwing.Add(CreateToeTag)
