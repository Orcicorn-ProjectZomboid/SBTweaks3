require('NPCs/MainCreationMethods')

local function SBTweaksTraitsInit()
    -- If ToadTraits installed, then remove Super Immune as it's insanely over powered
    if getActivatedMods():contains("ToadTraits") then
        TraitFactory.getTrait("superimmune"):setRemoveInMP(true);
    end

    -- Add Lucky/Unlucky back if it's missing (Personal mods utilize it)
    TraitFactory.getTrait("Lucky"):setRemoveInMP(false);
    TraitFactory.getTrait("Unlucky"):setRemoveInMP(false);
end

Events.OnGameBoot.Add(SBTweaksTraitsInit)