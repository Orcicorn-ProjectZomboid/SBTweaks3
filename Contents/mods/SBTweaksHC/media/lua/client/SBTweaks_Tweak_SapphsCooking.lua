-- MOD: Sapph's Cooking (Weird issues with Units in Recipes)
--      The "Units" in a reicpe "Item;X," doesn't seem to be 
--      accumalative. So when a recipe calls for 24 units of diced carrots
--      and carrots are only 8 hunger units, it fails to work.  The numbers
--      below match the highest requested amount + 1.  It's dumb but a temporary
--      work around.
if getActivatedMods():contains("sapphcooking") then
    TweakItem("SapphCooking.DicedCarrots", "HungerChange", -25);
    TweakItem("SapphCooking.DicedBroccoli", "HungerChange", -19);
    TweakItem("SapphCooking.DicedTomato", "HungerChange", -49);
end
