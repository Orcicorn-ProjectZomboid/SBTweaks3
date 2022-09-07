-- -- MOD: Farming Never Rot (1415491388)

-- -- pull in the original farming code
-- require "Farming/SFarmingSystem"
-- -- store farming code
-- local Original_SFarmingSystem_growPlant = SFarmingSystem.growPlant;
-- -- this will be added to growplant function
-- function SFarmingSystem:growPlant(luaObject, ...)
-- 	-- match seeded check, add check for growth stage before rot and force it to stay at stage.
-- 	if luaObject.state == "seeded" and luaObject.nbOfGrow > 6 then
-- 		luaObject.nbOfGrow = 6;
-- 	end
-- 	return Original_SFarmingSystem_growPlant(self, luaObject, ...);
-- end


-- Old Way of doing it
-- if isClient() then return end;

-- -- Disables Crops going rotten by checking every hour if a plant is about to go rotten
-- -- if it is, give it another 48 hours before it hits the next growth stage of rotten
-- -- SOURCE: https://steamcommunity.com/sharedfiles/filedetails/?id=2728416041
-- local function overrideRottenThis()
-- 	function SPlantGlobalObject:rottenThis()
-- 		self.nextGrowing = self.nextGrowing + 48.0
-- 	end
-- end

-- overrideRottenThis()

-- Events.EveryHours.Add(overrideRottenThis)
