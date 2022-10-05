function SBTweaksToeTagsCheckInventory(_iSInventoryPage, _state)
    local page = _iSInventoryPage;
    local state = _state;
    if state == "end" then
        local player = getPlayer();
        for i,v in ipairs(_iSInventoryPage.backpacks) do
            if v.inventory:getParent() then
                local type = v.inventory:getType()
                local container = v.inventory:getParent()
                if type == "inventorymale" or type == "inventoryfemale" then 
                    if v.inventory:contains("Base.ToeTag") then
                        HaloTextHelper:update()
                        HaloTextHelper.addText(player, getText("IGUI_ToeTag_Discover"), HaloTextHelper.getColorWhite());
                        container:setHighlighted(true);
                        container:setHighlightColor(1, 1, 1, 0.50);
                    end
                end
            end
        end
    end
end

Events.OnRefreshInventoryWindowContainers.Add(SBTweaksToeTagsCheckInventory);