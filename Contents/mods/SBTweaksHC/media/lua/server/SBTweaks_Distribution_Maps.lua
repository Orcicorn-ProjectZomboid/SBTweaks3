require 'Items/ProceduralDistributions'
require 'Items/SuburbsDistributions'
require 'Vehicles/VehicleDistributions'

-- Procedural Distributions
table.insert(ProceduralDistributions.list["CrateMaps"].items, "Base.MapWorldMap");
table.insert(ProceduralDistributions.list["CrateMaps"].items, 5);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.MapWorldMap");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 2);
table.insert(ProceduralDistributions.list["GasStorageMechanics"].items, "Base.MapWorldMap");
table.insert(ProceduralDistributions.list["GasStorageMechanics"].items, 2);
table.insert(ProceduralDistributions.list["Hiker"].items, "Base.MapWorldMap");
table.insert(ProceduralDistributions.list["Hiker"].items, 1);
table.insert(ProceduralDistributions.list["MagazineRackMaps"].items, "Base.MapWorldMap");
table.insert(ProceduralDistributions.list["MagazineRackMaps"].items, 5);
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, "Base.MapWorldMap");
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, 2);

-- Zombie Distributions
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.MapWorldMap");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.MapWorldMap");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.001);

-- Vehicle Distributions
table.insert(VehicleDistributions.GloveBox.junk, "Base.MapWorldMap");
table.insert(VehicleDistributions.GloveBox.junk, 2);
table.insert(VehicleDistributions.SurvivalistGlovebox.junk, "Base.MapWorldMap");
table.insert(VehicleDistributions.SurvivalistGlovebox.junk, 2);
