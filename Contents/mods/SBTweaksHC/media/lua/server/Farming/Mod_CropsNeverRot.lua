-- MOD: Crops Never Rot (2728416041)
if isClient() then return end;

local function overrideRottenThis()
	function SPlantGlobalObject:rottenThis()
		self.nextGrowing = self.nextGrowing + 48.0
		self.nbOfGrow = self.nbOfGrow - 1
	end
end

overrideRottenThis()
Events.EveryHours.Add(overrideRottenThis)
