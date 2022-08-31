-- When a BaitFish/Tackle is used, it can attract ALL FISH
-- Vanilla only allows Pike to be caught by Bait Fish
-- CREDIT: Mod: LittleBaitFishCatchesAll 2841799542
--         Modified to include all fishing tackle
for i, fish in ipairs(Fishing.fishes) do
    table.insert(fish.lure, "BaitFish");
    table.insert(fish.lure, "FishingTackle");
    table.insert(fish.lure, "FishingTackle2");
end
