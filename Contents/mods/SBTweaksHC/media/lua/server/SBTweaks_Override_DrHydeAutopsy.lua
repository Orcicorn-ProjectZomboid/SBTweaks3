require 'functions/LabModengine'

-- Override the Tooltip for the DrHyde Autopsy so that it properly checks
-- and shows the Journal of Research as it is improperly configured in the base mod.
function LabRecipes.CreateCorpseAutopsyTooltip(option, inventory, notFresh, notZombie, notOrgans)
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	option.toolTip = tooltip;
	tooltip.description = tooltip.description..string.format("%s:  <%s> %s12 %s <LINE> <RGB:1,1,1>", getText("ContextMenu_LabCorpseAge"), notFresh and "RED" or "GREEN", notFresh and ">" or "<", getText("ContextMenu_LabHrs"));
	tooltip.description = tooltip.description..string.format("%s:  <%s> %s <LINE> <RGB:1,1,1>", getText("ContextMenu_LabWasZombie"), notZombie and "RED" or "GREEN", notZombie and getText("ContextMenu_LabNo") or getText("ContextMenu_LabYes"));
	tooltip.description = tooltip.description..string.format("%s:  <%s> %s <LINE> <RGB:1,1,1>", getText("ContextMenu_LabAutopsyDone"), notOrgans and "RED" or "GREEN", notOrgans and getText("ContextMenu_LabYes") or getText("ContextMenu_LabNo"));
	tooltip.description = tooltip.description..getText("ContextMenu_LabMustHaveItems");
	local ok = true;
	ok = LabRecipes.CreateCheckTooltip(option, inventory, "Base", {"Hat_DustMask","Hat_SurgicalMask_Blue", "Hat_SurgicalMask_Green","Hat_BandanaMaskRed","Hat_BandanaMaskDesert","Hat_GasMask","DrHyde.GasMaskCEDA","DrHyde.GasMaskDCD"}, 1, true) and ok;
	ok = LabRecipes.CreateCheckTooltip(option, inventory, "Base", {"Scalpel"}, 1, true) and ok;
	ok = LabRecipes.CreateCheckTooltip(option, inventory, "Base", {"Tweezers"}, 1) and ok;
	-- The Journal Of research is in the LabItems container, not Base
    -- ok = LabRecipes.CreateCheckTooltip(option, inventory, "Base", {"JournalOfResearch"}, 1) and ok;
	ok = LabRecipes.CreateCheckTooltip(option, inventory, "LabItems", {"JournalOfResearch"}, 1) and ok;
	option.notAvailable = notFresh or notZombie or notOrgans or not(ok);
end
