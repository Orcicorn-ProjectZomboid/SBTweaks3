require("ImportedMods/Mod_ItemTweaker.lua");

-- MOD: Arsenal Gunfighter (Chainsaw & Ammo)
if getActivatedMods():contains("Arsenal(26)GunFighter") then
    TweakItem("Base.FlameFuel", "Count", 25);
    TweakItem("Base.P21_Chainsaw", "MaxAmmo", 200);
    TweakItem("Base.P21_Chainsaw", "JamGunChance", 0.01);
end

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

-- MOD: More Traits
if getActivatedMods():contains("ToadTraits") then
    TweakItem("MoreTraits.PackerBag", "IconsForTexture", "BagPacker;BagPacker_Camo;BagPacker_Alien");
    TweakItem("MoreTraits.PapierMacheSword", "AttachmentType", "Knife");
    TweakItem("MoreTraits.AntiqueKatana", "AttachmentType", "Knife");
    TweakItem("MoreTraits.BloodyCrowbar", "AttachmentType", "Knife");
end

-- MOD: GreenFire Fix Custom Sounds for Lighters in non-pipe situations
if getActivatedMods():contains("jiggasGreenfireMod") then
    TweakItem("Greenfire.Joint", "CustomEatSound", "");
    TweakItem("Greenfire.HalfJoint", "CustomEatSound", "");
    TweakItem("Greenfire.KiefJoint", "CustomEatSound", "");
    TweakItem("Greenfire.HalfKiefJoint", "CustomEatSound", "");
    TweakItem("Greenfire.HashJoint", "CustomEatSound", "");
    TweakItem("Greenfire.HalfHashJoint", "CustomEatSound", "");
    TweakItem("Greenfire.CannaCigar", "CustomEatSound", "");
    TweakItem("Greenfire.HalfCannaCigar", "CustomEatSound", "");
    TweakItem("Greenfire.PreCannaCigar", "CustomEatSound", "");
    TweakItem("Greenfire.HalfPreCannaCigar", "CustomEatSound", "");
    TweakItem("Greenfire.DelCannaCigar", "CustomEatSound", "");
    TweakItem("Greenfire.HalfDelCannaCigar", "CustomEatSound", "");
    TweakItem("Greenfire.ResCannaCigar", "CustomEatSound", "");
    TweakItem("Greenfire.HalfResCannaCigar", "CustomEatSound", "");
    TweakItem("Greenfire.Blunt", "CustomEatSound", "");
    TweakItem("Greenfire.HalfBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.MixedBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.HalfMixedBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.KiefBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.HalfKiefBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.HashBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.HalfHashBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.SpaceBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.HalfSpaceBlunt", "CustomEatSound", "");
    TweakItem("Greenfire.GFCigarette", "CustomEatSound", "");
    TweakItem("Greenfire.BluntCigar", "CustomEatSound", "");
    TweakItem("Greenfire.HalfBluntCigar", "CustomEatSound", "");
    TweakItem("Greenfire.GFCigar", "CustomEatSound", "");
    TweakItem("Greenfire.HalfCigar", "CustomEatSound", "");
end

-- MOD: Paw Low Loot
if getActivatedMods():contains("PLLoot") then
    TweakItem("Base.RogueSword", "AttachmentType", "Knife");
    TweakItem("Base.TKSwordHalf", "AttachmentType", "Knife");
end

-- MOD: Madax's Melee Weapons (2492565135)
if getActivatedMods():contains("Max") then
    TweakItem("MWPWeapons.fiskarcurvedmachete", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.albtacticalkatana", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.syntheticsword", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.defender18machete", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.zhunterhookmachete", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.gothsamuraisword", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.crtkkukrimachete", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.britishp1856pioneers", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.sogfaritantomachete", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.korekmachete", "AttachmentType", "Knife");
    TweakItem("MWPWeapons.taigamachete", "AttachmentType", "Knife");
end

-- MOD: Simple Remote Door Controllers
if getActivatedMods():contains("RDC_Z777") then
    print("Hello world")
    TweakItem("Base.Remote Door Control Receiver", "Weight", 2.0);
    TweakItem("Base.Simple Remote Door Control Receiver", "Weight", 2.0);
end
