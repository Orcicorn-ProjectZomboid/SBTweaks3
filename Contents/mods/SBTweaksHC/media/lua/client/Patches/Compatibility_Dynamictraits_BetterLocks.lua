-- We use "Better Lockpicking" and "Dynamic Traits".  "Better Lock picking" does all it's checking
-- against the base game's profession "burglar" to see if you get any of the free recipes and perks.
-- HOWEVER "Dynamic traits" also adds in a "Burglar" trait. This is confusing for players as you assume they're
-- the same but they are not. DynamicTraits "Burglar" is sneaking/lightfooted.  This function below will check
-- to see if you have the DT.Burglar trait and give you the Burglar recipes. None of the profession bonuses though
function GiveBetterLockpickingRecipesToDynamicTraitsBurglarPlayers(id, player)
    -- Give Existing players the missing Better Lockpicking recipes
    if player:HasTrait("Burglar") then
        player:learnRecipe("Lockpicking");
        player:learnRecipe("Alarm check");
        player:learnRecipe("Create BobbyPin");
    end
end
Events.OnCreatePlayer.Add(GiveBetterLockpickingRecipesToDynamicTraitsBurglarPlayers);

-- When the Game/Server Boots. Give the free recipes to the Burglar trait so that
-- if DynamicTraits procs it for you, you get the recipes right away
function GiveBetterLockPickingRecipesToDynamicTraitsBurglar(player)
    TraitFactory.getTrait("Burglar"):getFreeRecipes():add("Lockpicking");
    TraitFactory.getTrait("Burglar"):getFreeRecipes():add("Alarm check");
    TraitFactory.getTrait("Burglar"):getFreeRecipes():add("Create BobbyPin");
end
Events.OnGameBoot.Add(GiveBetterLockPickingRecipesToDynamicTraitsBurglar)