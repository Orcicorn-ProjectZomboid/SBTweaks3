
local laststate_waswearing = false;
local isLoading = true;

-- Produce a message above your head
local function SBTweaksAFKRing_HaloMessage(message, colored)
    if colored ~= true then
        color = HaloTextHelper.getColorWhite()
    else
        color = HaloTextHelper.getColorGreen()
    end
    HaloTextHelper.addText(getSpecificPlayer(0), message, color);
    HaloTextHelper.update()
end

-- Send a chat message
local function SBTweaksAFKRing_Announcements(message)
    if not isClient() then return end
    processGeneralMessage(message)
end

-- Disable Ghostmode and make annoucements
local function SBTweaksAFKRing_DisableAFK(player, ring, announce)
    -- print("Ghost Mode disabled")
    if ring:isEquipped() then
        ring:Unwear();
        ring:getContainer():setDrawDirty(true);
        return;
    end
    player:setGhostMode(false)
    -- player:setSneaking(false)
    ISTimedActionQueue.clear(player)
    SBTweaksAFKRing_HaloMessage(getText("IGUI_SBTweaks_HaloAFKStop"), false)
    if announce then
        SBTweaksAFKRing_Announcements(getText("IGUI_SBTweaks_ChatAFKStop"))
    end
end

-- Enable ghost mode & ui interactions
local function SBTweaksAFKRing_EnableAFK(player, ring, announce)
    -- print("Ghost Mode enabled")
    player:setGhostMode(true)
    player:setPrimaryHandItem(nil)
    player:setSecondaryHandItem(nil)
    ISTimedActionQueue.add(ISGhostRingAFK:new(player, ring))
    SBTweaksAFKRing_HaloMessage(getText("IGUI_SBTweaks_HaloAFKStart"), true)
    if announce then 
        SBTweaksAFKRing_Announcements(getText("IGUI_SBTweaks_ChatAFKStart"))
    end
end

-- If player is driving, remove the ring, that's cheating!
local function SBTweaksAFKRing_Driving(player, vehicle, args)
    if player:isDriving() then
        afkring = player:getInventory():getItemFromType("SBTweaks.AFKRing");
        if afkring and afkring:isEquipped() then
            SBTweaksAFKRing_DisableAFK(player, afkring, false)
        end
    end
end

-- Disable ghost mode if you are logging in
local function SBTweaksAFKRing_Login()   
    player = getPlayer()
    afkring = player:getInventory():getItemFromType("SBTweaks.AFKRing");
    if afkring and afkring:isEquipped() then
        SBTweaksAFKRing_DisableAFK(player, afkring, false)
    end
    isLoading = false 
end

-- Walk/Run/Sprint/Sneak
local function SBTweaksAFKRing_PlayerMove(player) 
    -- print("Moving")
    if player:isGhostMode() then
        -- print("Player is Ghost Mode")
        afkring = player:getInventory():getItemFromType("SBTweaks.AFKRing");
        -- Failsafe incase you're in admin mode using ghost cheat
        if afkring == nil then return end 
        if not afkring:isEquipped() then return end
        -- print("Moving in Ghost Mode using the ring")
        SBTweaksAFKRing_DisableAFK(player, afkring, true)
    end
end

local function SBTweaksAFKRing_OnAttack(character, weapon)
    -- print("on attack")
    if not instanceof(character, "IsoPlayer") then return end
    if not character:isLocalPlayer() then return end
    afkring = player:getInventory():getItemFromType("SBTweaks.AFKRing");
    if afkring and afkring:isEquipped() then
        -- print("ring is equipped while attacking")
        SBTweaksAFKRing_DisableAFK(player, afkring, false)
    end
end

-- Equip/Unequip Clothing or Sweat/Blood/Water clothing items
local function SBTweaksAFKRing_ClothingUpdated(player)
    if isLoading == true then return end;
    -- print("Clothing updated")
    afkring = player:getInventory():getItemFromType("SBTweaks.AFKRing")
    if afkring and afkring:isEquipped() then
        if laststate_waswearing == false then
            -- print("Clothing equipped")
            laststate_waswearing = true;
            SBTweaksAFKRing_EnableAFK(player, afkring, true)
        end
    elseif afkring ~= nil then
        if laststate_waswearing == true then
            -- print("Clothing removed")
            laststate_waswearing = false;
            SBTweaksAFKRing_DisableAFK(player, afkring, true)
        end
    end
end

Events.OnGameTimeLoaded.Add(SBTweaksAFKRing_Login)                  -- Game/Server loaded
Events.OnClothingUpdated.Add(SBTweaksAFKRing_ClothingUpdated)       -- Clothing Changed
Events.OnPlayerMove.Add(SBTweaksAFKRing_PlayerMove);                -- Player has moved on their own
Events.OnPlayerUpdate.Add(SBTweaksAFKRing_Driving)                  -- If player is driving
Events.OnWeaponSwing.Add(SBTweaksAFKRing_OnAttack);                 -- If you try to attack zombies