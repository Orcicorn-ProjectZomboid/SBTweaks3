-- Mod: InsectIngredients (2773824553)
-- Add insects to evolved recipes as meat

local ItemsToTweak = {
    "Base.Cockroach",
    "Base.Cricket",
    "Base.Grasshopper",
    "Base.Worm",
    "Base.AmericanLadyCaterpillar",
    "Base.BandedWoolyBearCaterpillar",
    "Base.Centipede",
    "Base.Centipede2",
    "Base.Maggots",
    "Base.Millipede",
    "Base.Millipede2",
    "Base.MonarchCaterpillar",
    "Base.Pillbug",
    "Base.SawflyLarva",
    "Base.SilkMothCaterpillar",
    "Base.SwallowtailCaterpillar",
    "Base.Termites",
}

Events.OnGameBoot.Add(function()
    for n,i in pairs(ItemsToTweak) do
        local item = ScriptManager.instance:getItem(i)
        if item then
            item:DoParam("FoodType = Meat")
            local hc = -(item:getHungerChange())
            local hc2 = math.ceil(hc/2)
            local hc3 = math.ceil(hc/3)
            item:DoParam("EvolvedRecipe = Soup:"..hc..";Stew:"..hc..";Pie:"..hc..";Stir fry Griddle Pan:"..hc..";Stir fry:"..hc..";Sandwich:"..hc3.."|Cooked;Sandwich Baguette:"..hc3.."|Cooked;Burger:"..hc2.."|Cooked;Salad:"..hc2.."|Cooked;Roasted Vegetables:"..hc..";RicePot:"..hc..";RicePan:"..hc..";PastaPot:"..hc..";PastaPan:"..hc)
        end
    end
end)
