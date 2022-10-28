
local isLoading = true
local enableReduction = false;

local function SBTweaksPocketKitten_Login()
    -- print("Login!")
    player = getPlayer()
    pocketkitten = player:getInventory():getItemFromType("SBTweaks.PocketKitten");
    if pocketkitten then
        -- print(">> Equipped-1")
        enableReduction = pocketkitten:isEquipped()
    end 
    isLoading = false;
end
Events.OnGameTimeLoaded.Add(SBTweaksPocketKitten_Login);

local function SBTweaksPocketKitten_ClothingUpdate(player)
    -- print("Clothing update")
    if isLoading == true then return end;
    pocketkitten = player:getInventory():getItemFromType("SBTweaks.PocketKitten")
    if pocketkitten ~=nil then 
        enableReduction = pocketkitten:isEquipped()
    else
        enableReduction = false
    end
end
Events.OnClothingUpdated.Add(SBTweaksPocketKitten_ClothingUpdate)

local function SBTweaksPocketKitten_ReduceBoredom()
    if enableReduction == false then return end;
    -- print("Reduce Boredom")
    player = getPlayer()
    bodyDamage = player:getBodyDamage()
    bodyDamage:setBoredomLevel(bodyDamage:getBoredomLevel() - 12);
    bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - 12);
end
Events.EveryHours.Add(SBTweaksPocketKitten_ReduceBoredom)
