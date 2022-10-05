ISRenameEverything = {};

require "ISInventoryPaneContextMenu"
ISRenameEverything.createMenu = function(player, context, items)
	local canBeRenamed = nil;

	for i, v in ipairs(items) do
		local item = v;
		
		if not instanceof(v, "InventoryItem") then
			item = v.items[1];
		end
		
		canBeRenamed = item;
	end

	if canBeRenamed then
		context:addOption(getText("ContextMenu_renameButton"), canBeRenamed, ISRenameEverything.onRenameItem, player);
	end
end

ISRenameEverything.onRenameItem = function(item, player)
    local modal = ISTextBox:new(0, 0, 280, 180, getText("ContextMenu_label"), item:getName(), nil, ISRenameEverything.onRenameItemClick, player, getSpecificPlayer(player), item);
    modal:initialise();
    modal:addToUIManager();
end

function ISRenameEverything:onRenameItemClick(button, player, item)
    if button.internal == "OK" then
        if button.parent.entry:getText() and button.parent.entry:getText() ~= "" then
            item:setName(button.parent.entry:getText());
            local pdata = getPlayerData(player:getPlayerNum());
            pdata.playerInventory:refreshBackpacks();
            pdata.lootInventory:refreshBackpacks();
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(ISRenameEverything.createMenu);
