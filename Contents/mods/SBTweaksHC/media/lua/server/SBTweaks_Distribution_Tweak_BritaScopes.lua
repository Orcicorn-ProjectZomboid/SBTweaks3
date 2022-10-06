-- Remove Night Vision / Thermal Scopes that Don't work in Brita
if getActivatedMods():contains("Brita") then
    RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Sight_Thermal" , nil, true);
    RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Sight_Thermal_AK" , nil, true);
    RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Sight_PVS4" , nil, true);
end
