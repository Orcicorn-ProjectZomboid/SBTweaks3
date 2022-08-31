
--[[
	The default GunFighter Fill_LiquidAmmo only reloads 30 fuel at a time. This takes forever
	SBTweaks_Recipes_GunFighter.txt adds a new recipe to reload 5 Gas at a time and then calls
	Fill_LiquidAmmo2 which translates that 5 gas into 200 ammo.

	SBTweaks.lua has already adjusted the chainsaw to have a max of 200 ammo to make it last longer
]]--

function Fill_LiquidAmmo2(items, result, player)
	local	Gun
	local	Fill
	local	Rate = 0

	for i=0,items:size() - 1 do
		if	(instanceof(items:get(i),"HandWeapon")) or (items:get(i):getDisplayCategory() == "GunMag") then
			Gun = items:get(i)
		else	Fill = items:get(i)
		end
	end

	if	string.find(Fill:getType(), "Propane") then
		Rate = 50
	elseif	string.find(Fill:getType(), "Petrol") then
		Rate = 200
	elseif	string.find(Fill:getType(), "Water") then
		Rate = 10
	end

	if (instanceof(result,"HandWeapon")) then
	--	======= TRANSFER CONDITION & MODE ======
		result:setCondition(Gun:getCondition());
		if	Gun:isRoundChambered() == true then
			result:setRoundChambered(true);
		end
	end

	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount() + Rate);
	if result:getCurrentAmmoCount() > result:getMaxAmmo() then
		result:setCurrentAmmoCount(result:getMaxAmmo())
		if	Rate == 10 then
			Sound = player:getEmitter():playSound("OverFill")
		elseif	Rate == 1 then
			Sound = player:getEmitter():playSound("waterSplash")
		end
	end

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end
