-- Overpower the GreenFire Mod's recipe code for opening packs of cigarettes
-- By default it generates a "GFCigarette" instead of Base Cigarettes which is annoying
function GF_GiveGFCigs(items, result, player)
	local times = 1;
	for i=1, times do
		player:getInventory():AddItem("Base.Cigarettes");
	end
end
