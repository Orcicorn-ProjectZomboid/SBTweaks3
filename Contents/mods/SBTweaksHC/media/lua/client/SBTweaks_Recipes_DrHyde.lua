-- Flasks shouldn't be consumed on portal kit creations
function SBTweaks_DrHydeFlaskFix(items, result, player)
    player:getInventory():AddItem("LabItems.LabFlask");
end
