require "Items/Distributions"
require 'Items/SuburbsDistributions'
require 'Items/ProceduralDistributions'
require 'Vehicles/VehicleDistributions'

-- Paw Low Loot Fantasy: 2279084780
-- SLIGHTLY increase the grimoire spawn rates
if getActivatedMods():contains("PLLootF") then
    table.insert(ProceduralDistributions["list"]["OfficeDeskHome"].items, "Base.grimoireclosed");
    table.insert(ProceduralDistributions["list"]["OfficeDeskHome"].items, 0.0001);
    table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "Base.grimoireclosed");
    table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, 0.001);
    table.insert(ProceduralDistributions["list"]["BedroomDresser"].items, "Base.grimoireclosed");
    table.insert(ProceduralDistributions["list"]["BedroomDresser"].items, 0.0001);
    table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "Base.grimoireclosed");
    table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, 0.0001);
    table.insert(SuburbsDistributions["all"]["bin"].items, "Base.grimoireclosed");
    table.insert(SuburbsDistributions["all"]["bin"].items, 0.0001);
    table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.grimoireclosed");
    table.insert(SuburbsDistributions["all"]["postbox"].items, 0.0001);
end
