-- Give back the saucepan when you strain the cheese
function SBTweaks_GiveBackSaucePan(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("Base.Saucepan");
end

function SBTweaks_GiveBackBottle(items, result, player)
    player:getInventory():AddItem(result);
    player:getInventory():AddItem("Base.WaterBottleEmpty");
end
