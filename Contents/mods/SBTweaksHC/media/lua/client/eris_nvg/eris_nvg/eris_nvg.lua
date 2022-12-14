require "TimedActions/ISUnequipAction"
-- eris_nvg - night vision goggles
-- item artwork: Lith
-- chucking: chuckleberry "chuck" finn

-- DIRTY OVERWRITE:  Done so that we can tweak the battery
-- length while waiting for Chuckleberry to update sandbox options.
-- as well as adjust some overlays for terminator glasses

--	Line 20:		Added reference to red overlay
--	Line 169:		Increased battery durability
--	Line 225, 231	Toggle on Red overlay if terminator glasses used

local eris_nvg = {
	batteryManagers = {},
	numActiveNVG = 0,
	activeNVG = {},
	playerScreenBounds = {},
	brightnessOverlay = getTexture("media/textures/overlayBrightness.png"),
	brightnessOverlayRed = getTexture("media/textures/overlayBrightnessRed.png"),
}


eris_nvg.doCheck = function(_plObj)
	for itemID, batteryManager in pairs(eris_nvg.batteryManagers) do
		batteryManager:update()
	end
end


appliedNVGChuckedTypes = appliedNVGChuckedTypes or {}
function applyNVGchucked_ModuleType(moduleDotTypeString)
	appliedNVGChuckedTypes = appliedNVGChuckedTypes or {}
	appliedNVGChuckedTypes[moduleDotTypeString] = true
	print("MOD: nightVisionChucked: applying to: "..moduleDotTypeString)
end

local function getNVGTypes()
	local SM = getScriptManager()
	local allItems = SM:getAllItems()

	for i=0, allItems:size()-1 do
		---@type Item
		local itemScript = allItems:get(i)
		local itemScriptModuleDotType = itemScript:getFullName()

		if itemScript and tostring(itemScript:getType()) == "Clothing" then

			if itemScriptModuleDotType=="nvgoggles" or itemScriptModuleDotType=="nvgoggles41" then
				itemScript:DoParam("DisplayCategory = Helmet")
			end

			if itemScript:getTags() and itemScript:getTags():contains("NVGchucked") then
				appliedNVGChuckedTypes[itemScriptModuleDotType] = true
			end
		else
			if appliedNVGChuckedTypes[itemScriptModuleDotType] == true then
				print("WARNING: nightVisionChucked: \""..itemScriptModuleDotType.."\" not clothing; removed from applied types.")
				appliedNVGChuckedTypes[itemScriptModuleDotType] = nil
			end
		end
	end
end
Events.OnGameStart.Add(getNVGTypes)


eris_nvg.doMenu = function(_plID, _context, _items)
	local isWearing
	local itemObj
	local itemID
	local plObj = getPlayer(_plID)
	for i, items in ipairs(_items) do
		if not instanceof(items, "InventoryItem") then itemObj = items.items[1] else itemObj = items end
		if itemObj then
			if eris_nvg.isInPlayerInventory(nil, plObj, itemObj) and appliedNVGChuckedTypes[itemObj:getFullType()] then
				itemID = eris_nvg.getItemID(itemObj)
				if not eris_nvg.batteryManagers[itemID] then eris_nvg.initialiseNVG(itemID, plObj, itemObj) end
				isWearing = eris_nvg.isWearing(nil, plObj, itemObj)
				if isWearing then eris_nvg.batteryManagers[itemID]:doActionMenu(_context) end
				eris_nvg.batteryManagers[itemID]:doPowerLevelMenu(_context)
				eris_nvg.batteryManagers[itemID]:doBatteryMenu(_context)
			end
		end
	end
end


eris_nvg.isActive = function(_, _plObj, _itemObj)
	return _plObj:isWearingNightVisionGoggles() or false
end


eris_nvg.isWearing = function(_, _plObj, _itemObj)
	return _itemObj:getBodyLocation() or false
	--return _plObj:getClothingItem_Head() == _itemObj or false
end


eris_nvg.isInPlayerInventory = function(_, _plObj, _itemObj)
	return _itemObj:getContainer() == _plObj:getInventory() or false
end


eris_nvg.isValid = function(_, _plObj, _itemObj)
	if _plObj and _itemObj then
		return eris_nvg.isWearing(_, _plObj, _itemObj) or false
	else
		return nil
	end
	return false
end


eris_nvg.onActivate = function(_, _plObj, _itemObj, _manager)
	_plObj:setWearingNightVisionGoggles(true)
	eris_nvg.activeNVG[_plObj:getDisplayName() .. _plObj:getPlayerNum()] = _manager
	eris_nvg.numActiveNVG = eris_nvg.numActiveNVG + 1
	eris_nvg.updateScreenBounds()
	Events.OnPreUIDraw.Add(eris_nvg.doBrightnessOverlay)
end


eris_nvg.onBatteryDead = function(_, _plObj, _itemObj, _manager)
	eris_nvg.onDeactivate(_, _plObj, _itemObj, _manager)
	-- eris_nvg.batteryManagers[_itemObj:getType() .. _itemObj:getID()] = nil
end


eris_nvg.onDeactivate = function(_, _plObj, _itemObj, _manager)
	_plObj:setWearingNightVisionGoggles(false)
	eris_nvg.activeNVG[_plObj:getDisplayName() .. _plObj:getPlayerNum()] = nil
	eris_nvg.numActiveNVG = eris_nvg.numActiveNVG - 1 if eris_nvg.numActiveNVG < 0 then eris_nvg.numActiveNVG = 0 end
	eris_nvg.updateScreenBounds()
	Events.OnPreUIDraw.Remove(eris_nvg.doBrightnessOverlay)
end

local ISUnequipAction_perform = ISUnequipAction.perform
function ISUnequipAction:perform()
	--self.item:
	if self.item and appliedNVGChuckedTypes[self.item:getFullType()] and eris_nvg.isActive(nil, self.character) then
		eris_nvg.onDeactivate(nil, self.character)
	end
	ISUnequipAction_perform(self)
end

local ISClothingExtraAction_perform = ISClothingExtraAction.perform
function ISClothingExtraAction:perform()
	ISClothingExtraAction_perform(self)
	if self.item and appliedNVGChuckedTypes[self.item:getFullType()] and eris_nvg.isActive(nil, self.character) then
		eris_nvg.onDeactivate(nil, self.character)
	end
end

-- --------------------------------------------------------- --
-- THIS IS THE ONLY PART THAT IS DIFFERENT FROM THE DEFAULT  --
-- --------------------------------------------------------- --
--  Default sets "runtime = 6" which is about 12h of playtime
--  I've changed it to 12 which is about 24h of playtime
--  before you have to change the battery.
--
--  A request has been made to Chuckleberry to add a sandbox
--  option for this so we don't have to do this kind of
--  dirty overwriting
-- --------------------------------------------------------- --
eris_nvg.initialiseNVG = function(_itemID, _plObj, _itemObj)
	local nvgObj = {
		plObj = _plObj,
		itemObj = _itemObj,
		runtime = 12,
		target = nil,
		adjustablePower = true,
		itemWeightNoBattery = 0.7,
		itemWeightWithBattery = 1.2,
		isValid = eris_nvg.isValid,
		isActive = eris_nvg.isActive,
		onActivate = eris_nvg.onActivate,
		onDeactivate = eris_nvg.onDeactivate,
		onBatteryDead = eris_nvg.onBatteryDead,
	}
	eris_nvg.batteryManagers[_itemID] = eris_uiBattery:new(nvgObj)
	eris_nvg.batteryManagers[_itemID]:initialise()
end
-- --------------------------------------------------------- --

eris_nvg.getItemID = function(_itemObj)
	return _itemObj:getType() .. _itemObj:getID()
end

	-- eris_nvg.initInvInfo()
eris_nvg.initInvInfo = function()
	local nvBar
	for i, item in ipairs(appliedNVGChuckedTypes) do
		nvBar = {
			id = item,
			label = getTextOrNull("IGUI_invpanel_Remaining") or "Remaining: ",
			itemTest = function(_itemObj, _id) return _itemObj:getFullType() == _id end,
			getValue = function(_itemObj) return _itemObj:getModData()["uiBattery_batteryLevel"] end,
			setValue = function(_itemObj, _value) _itemObj:getModData()["uiBattery_batteryLevel"] = _value end,
		}
		-- eris_invBar.registerItem(nvBar.id, nvBar.label, nvBar.itemTest, nvBar.getValue, nvBar.setValue, true, true)
	end
end


eris_nvg.init = function()
	eris_nvg.updateScreenBounds()
	Events.OnClothingUpdated.Add(eris_nvg.doCheck)
	Events.OnFillInventoryObjectContextMenu.Add(eris_nvg.doMenu)

	for type,_ in pairs(appliedNVGChuckedTypes) do
		eris_inventoryBar.registerItem(type, "uiBattery_batteryLevel", getTextOrNull("IGUI_invpanel_Remaining") or "Remaining: ")
		eris_inventoryTooltip.registerItem(type, "uiBattery_batteryLevel", getTextOrNull("IGUI_invpanel_Remaining") or "Remaining: ")
	end

	eris_nvg.initInvInfo()
end


Events.OnGameStart.Add(eris_nvg.init)


eris_nvg.doBrightnessOverlay = function()
	local nvgItem
	local bounds, powerLevel
	local overlayImage = eris_nvg.brightnessOverlay
	for plID, manager in pairs(eris_nvg.activeNVG) do
		if manager then
			bounds = eris_nvg.playerScreenBounds[plID]
			powerLevel = manager:getPowerLevel()
			if bounds and powerLevel and eris_nvg.brightnessOverlay then
				-- If you're wearing terminator glasses, change the overlay to red
				if manager:getItem():getType() == "glasses_terminator" then 
					overlayImage = eris_nvg.brightnessOverlayRed;
				end
				UIManager.DrawTexture(overlayImage, bounds.x, bounds.y, bounds.w, bounds.h, 1 - powerLevel)
			end
		end
	end
end


eris_nvg.updateScreenBounds = function()
	local plID
	local player, playerNum
	local x, y, w, h
	local playerList = IsoPlayer.getPlayers()
	if playerList then
		for i = 0, playerList:size() - 1 do
			player = playerList:get(i)
			if player then
				playerNum = player:getPlayerNum()
				plID = player:getDisplayName() .. playerNum
				eris_nvg.playerScreenBounds[plID] = {
					x = getPlayerScreenLeft(playerNum),
					y = getPlayerScreenTop(playerNum),
					w = getPlayerScreenWidth(playerNum),
					h = getPlayerScreenHeight(playerNum),
				}
				-- print("updating player " ..i)
				-- for k, v in pairs(eris_nvg.playerScreenBounds[plID]) do
					-- print(k, v)
				-- end
			end
		end
	end
end


Events.OnCreatePlayer.Add(eris_nvg.updateScreenBounds)
Events.OnResolutionChange.Add(eris_nvg.updateScreenBounds)