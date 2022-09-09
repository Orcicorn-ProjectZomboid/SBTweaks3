require("ImportedMods/Mod_ItemTweaker.lua");

-- By default the Dr Hyde books are consumed when read. This is because they're from an RP 
-- server where the Admin just gives out the books.  This checks to make sure that the spawning
-- mod is enabled. If so, we make the books not consume so that you are not restricted by
-- loot respawn rules to get them if you die. 
if getActivatedMods():contains("DrHyde1VaccineBooks") then
    TweakItem("LabBooks.BkLaboratoryEquipment1", "ReplaceOnUse", "LabBooks.BkLaboratoryEquipement1");
    TweakItem("LabBooks.BkLaboratoryEquipment2", "ReplaceOnUse", "LabBooks.BkLaboratoryEquipment2");
    TweakItem("LabBooks.BkLaboratoryEquipment3", "ReplaceOnUse", "LabBooks.BkLaboratoryEquipment3");
    TweakItem("LabBooks.BkVirologyCourses1", "ReplaceOnUse", "LabBooks.BkVirologyCourses1");
    TweakItem("LabBooks.BkVirologyCourses2", "ReplaceOnUse", "LabBooks.BkVirologyCourses2");
    TweakItem("LabBooks.BkChemistryCourse", "ReplaceOnUse", "LabBooks.BkChemistryCourse");
end
