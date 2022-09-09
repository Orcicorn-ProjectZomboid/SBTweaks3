require 'Items/ProceduralDistributions'

if getActivatedMods():contains("betterLockpicking") then
    -- Book Lockpicking 1
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "SBTweaks.BookLockpicking1");
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 5);
    table.insert(ProceduralDistributions.list["CrateBooks"].items, "SBTweaks.BookLockpicking1");
    table.insert(ProceduralDistributions.list["CrateBooks"].items, 3);
    table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "SBTweaks.BookLockpicking1");
    table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 1);
    table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "SBTweaks.BookLockpicking1");
    table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 1);
    table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "SBTweaks.BookLockpicking1");
    table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 1);

    -- Book Lockpicking 2
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "SBTweaks.BookLockpicking2");
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 4);
    table.insert(ProceduralDistributions.list["CrateBooks"].items, "SBTweaks.BookLockpicking2");
    table.insert(ProceduralDistributions.list["CrateBooks"].items, 3);
    table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "SBTweaks.BookLockpicking2");
    table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 1);

    -- Book Lockpicking 3
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "SBTweaks.BookLockpicking3");
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 1);
    table.insert(ProceduralDistributions.list["CrateBooks"].items, "SBTweaks.BookLockpicking3");
    table.insert(ProceduralDistributions.list["CrateBooks"].items, 2);

    -- Book Lockpicking 4
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "SBTweaks.BookLockpicking4");
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 0.5);
    table.insert(ProceduralDistributions.list["CrateBooks"].items, "SBTweaks.BookLockpicking4");
    table.insert(ProceduralDistributions.list["CrateBooks"].items, 1);

    -- Book Lockpicking 5
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "SBTweaks.BookLockpicking5");
    table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 0.25);
    table.insert(ProceduralDistributions.list["CrateBooks"].items, "SBTweaks.BookLockpicking5");
    table.insert(ProceduralDistributions.list["CrateBooks"].items, 0.5);

end