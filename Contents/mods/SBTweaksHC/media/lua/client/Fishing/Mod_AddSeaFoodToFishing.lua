-- Integration of multiple fishing mods to suit our needs

--Crayfish
local crayfish = {};
crayfish.item = "Base.Crayfish";
crayfish.lure = {};
table.insert(crayfish.lure, "Worm");
table.insert(crayfish.lure, "Cricket");
table.insert(crayfish.lure, "Grasshopper");
table.insert(crayfish.lure, "Cockroach");
table.insert(crayfish.lure, "FishingTackle");
table.insert(crayfish.lure, "FishingTackle2");
table.insert(crayfish.lure, "BaitFish");
table.insert(fishes, crayfish);

--Shrimp
local shrimp = {};
shrimp.item = "Base.Shrimp";
shrimp.lure = {};
table.insert(shrimp.lure, "Worm");
table.insert(shrimp.lure, "Cricket");
table.insert(shrimp.lure, "Grasshopper");
table.insert(shrimp.lure, "Cockroach");
table.insert(fishes, shrimp);

--Squid
local squid = {};
squid.item = "Base.Squid";
squid.lure = {};
table.insert(squid.lure, "Worm");
table.insert(squid.lure, "Cricket");
table.insert(squid.lure, "Grasshopper");
table.insert(squid.lure, "Cockroach");
table.insert(squid.lure, "FishingTackle");
table.insert(squid.lure, "FishingTackle2");
table.insert(squid.lure, "BaitFish");
table.insert(fishes, squid);

--Oysters
local oysters = {};
oysters.item = "Base.Oysters";
oysters.lure = {};
table.insert(oysters.lure, "Cricket");
table.insert(oysters.lure, "Grasshopper");
table.insert(oysters.lure, "Cockroach");
table.insert(fishes, oysters);
