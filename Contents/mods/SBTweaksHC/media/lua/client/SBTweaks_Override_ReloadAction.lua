require "TimedActions/ISReloadWeaponAction.lua"

--[[
	*****************************************************************************************
		THIS FILE OVERWRITES THE BASE GAME'S RELOAD SPEED CALCULATIONS
	*****************************************************************************************
	What I changed and why I changed it:

	By default the base speeds are 0.07 per level. So a level 0 player
	reloads with a speed of 1.0 while a level 10 player reloads at a speed of 1.7
	It is a significant difference but that doesn't seem to be an awful lot for someone who made
	it all the way up to reloading 10.

	My changes double that so that level 0 is 1.0 while level 10 is 2.4. It doesn't seem like much
	but when you see it in-game it is significantly improved and visually obvious that you're better at this

	Additionally I've fixed the logic surrounding the way Ammo Straps are handled. TL;DR in vanilla the ammo
	strap only works if you click reload WHILE holding a gun in your primary hand. No gun, no strap bonus. The
	problem with that is more often than not I find myself with the weapon on my back while triggering reloads
	and thus the strap is useless.  So now we're going to approach it a little differently.

	If you have a strap equipped, I'll give you a reload bonus. Simple as that regardless of which of the two straps
	you have equipped are.  HOWEVER the strap bonus is going to get weaker the better at reloading your get. My
	theory here is that if you are a complete newbie, having all your bullets setup in order and easily accessible is
	going to be a huge help to you. However if you're a professional it isn't going to matter near as much as you are
	already well versed in reloading and probably pretty nimble.

	The difference is pretty minor but it just makes the ammo strap for more appealing to newbies than to experienced players.
	Everyone still benefits from it, but you won't feel like YOU ABSOLUTELY MUST WEAR THIS once you're above level 5 reloading.

	All in all that's the changes. I left the panic penalty in place as well as the driving penalties. They seem reasonable
	and they make sense in the universe.
]]--

function ISReloadWeaponAction.setReloadSpeed(character, rack)
 	local baseReloadSpeed = 1;
	local strapFound = false
	local perkLevel = character:getPerkLevel(Perks.Reloading)

	-- Calculate speed based on Skill Levels
	 if rack then
		-- Racking weapon. Buff increases SLIGHTLY based on level
		baseReloadSpeed = baseReloadSpeed + (perkLevel * 0.03);
	else
		-- Reloading is increased a lot more based on level
		-- but reloading is negatively affected by Panic as well
		baseReloadSpeed = baseReloadSpeed + (perkLevel * 0.14);
		baseReloadSpeed = baseReloadSpeed - (character:getMoodles():getMoodleLevel(MoodleType.Panic) * 0.08);
	end

	-- So question is simple, Do you have 1 of the known ammo straps equipped?
	strapShells = character:getInventory():getItemFromType("Base.AmmoStrap_Shells")
	strapBullets = character:getInventory():getItemFromType("Base.AmmoStrap_Bullets")
	if strapShells and strapShells:isEquipped() then strapFound = true end
	if strapBullets and strapBullets:isEquipped() then strapFound = true end

	-- Looks like the strap is equippped, now lets give that strap a reload bonus
	-- Theory here is that the lower your skill level, the more beneficial the ammo strap is.
	-- If you're a newbie and suddenly your ammo is organized, that's amazing and will help you alot
	-- however if you're an expert, you're already pretty nimble so the benefit is far less.
	if strapFound == true then
		strapBonus = 0.2 - (character:getPerkLevel(Perks.Reloading)/100)
		-- If you're good at this (Greater than level 5, the bonus is weaker)
		if perkLevel > 5 then
			strapBonus = strapBonus - 0.05
		end
		baseReloadSpeed = baseReloadSpeed * (1+strapBonus);
	end

	-- If you're the driver in a car, you're clearly pre-occupied so your reload speed
	-- is reduced as well. It'll be 80% of whatever speed we've calculated up to this point
	if character:getVehicle() and character:getVehicle():getDriver() == character then
		baseReloadSpeed = baseReloadSpeed * 0.8;
	end
	
	-- And away we go with your new reload speed bonuses that actually work
    -- print("Base Speed is " .. baseReloadSpeed)
	character:setVariable("ReloadSpeed", baseReloadSpeed * GameTime.getAnimSpeedFix());
end
