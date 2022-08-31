require("ImportedMods/Mod_ItemTweaker.lua");

-- MOD: AuthenticZ: Miner hat does not consume battery
if getActivatedMods():contains("Authentic Z - Current") then
    TweakItem("AuthenticZClothing.Authentic_MinerLightbulb", "Weight", 0.1)
    TweakItem("AuthenticZClothing.Authentic_MinerLightbulb", "UseDelta", 0)
    TweakItem("AuthenticZClothing.BunnyEars", "ChanceToFall", 0);
    TweakItem("AuthenticZClothing.BunnyEars", "FabricType", "Cotton");
    TweakItem("AuthenticZClothing.CigarAZ", "ChanceToFall", 0);
    TweakItem("AuthenticZClothing.AuthenticCigaretteHolder", "ChanceToFall", 0);
    TweakItem("AuthenticZClothing.Authentic_MilitaryFlashlightGrey", "UseDelta", 0);
    TweakItem("AuthenticZClothing.Authentic_MilitaryFlashlightGreen", "UseDelta", 0); 
end
