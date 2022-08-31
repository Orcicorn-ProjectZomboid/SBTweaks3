require("ImportedMods/Mod_ItemTweaker.lua");

-- BASE GAME: Reduce Some Weight
TweakItem("Base.Log", "Weight", 4.5);
TweakItem("Base.Plank", "Weight", 1.5);
TweakItem("Base.MetalBar", "Weight", 0.5);
TweakItem("Base.MetalPipe", "Weight", 0.5);
TweakItem("Base.SheetMetal", "Weight", 1);

-- BASE GAME: Add Eraser to Pencil
TweakItem("Base.Pencil", "Tags", "Write;Pencil;Eraser");

-- BASE GAME: Chance some Item Attachments
TweakItem("Base.Katana", "AttachmentType", "Knife");
TweakItem("Base.LeadPipe", "AttachmentType", "Knife");
TweakItem("Base.MetalBar", "AttachmentType", "Knife");
TweakItem("Base.MetalPipe", "AttachmentType", "Knife");

-- BASE GAME: Blow Torch can be used to start fire
TweakItem("Base.BlowTorch", "Tags", "StartFire");

-- BASE GAME: Cigarettes Light from BlowTorch
TweakItem("Base.Cigarettes", "RequireInHandOrInventory", "Lighter/Matches/BlowTorch");

-- BASE GAME: Make Flashlights not consume batteries
TweakItem("Base.Torch", "UseDelta", 0);
TweakItem("Base.HandTorch", "UseDelta", 0);

-- BASE GAME: Ham Radio's Use Way less battery (Default 0.010)
TweakItem("Radio.HamRadio1", "UseDelta", 0.001);
TweakItem("Radio.HamRadio2", "UseDelta", 0.001);
TweakItem("Radio.HamRadioMakeShift", "UseDelta", 0.001);

-- BASE GAME: Buff lights and matches
TweakItem("Base.Lighter", "UseDelta", 0.01);
TweakItem("Base.Lighter", "ticksPerEquipUse", 1500);
TweakItem("Base.Matches", "UseDelta", 0.01);

-- BASE GAME: NEAR INFINITE LIGHT BULBS
TweakItem("Base.LightBulb","ConditionMax",2100000000);
TweakItem("Base.LightBulbRed","ConditionMax",2100000000);
TweakItem("Base.LightBulbGreen","ConditionMax",2100000000);
TweakItem("Base.LightBulbBlue","ConditionMax",2100000000);
TweakItem("Base.LightBulbYellow","ConditionMax",2100000000);
TweakItem("Base.LightBulbCyan","ConditionMax",2100000000);
TweakItem("Base.LightBulbMagenta","ConditionMax",2100000000);
TweakItem("Base.LightBulbOrange","ConditionMax",2100000000);
TweakItem("Base.LightBulbPurple","ConditionMax",2100000000);
TweakItem("Base.LightBulbPink","ConditionMax",2100000000);

-- BASE GAME: Reduce weight of Hair Dye
TweakItem("Base.HairDyeBlack", "Weight", 0.5);
TweakItem("Base.HairDyeBlonde", "Weight", 0.5);
TweakItem("Base.HairDyeBlue", "Weight", 0.5);
TweakItem("Base.HairDyeGinger", "Weight", 0.5);
TweakItem("Base.HairDyeGreen", "Weight", 0.5);
TweakItem("Base.HairDyeLightBrown", "Weight", 0.5);
TweakItem("Base.HairDyePink", "Weight", 0.5);
TweakItem("Base.HairDyeRed", "Weight", 0.5);
TweakItem("Base.HairDyeWhite", "Weight", 0.5);
TweakItem("Base.HairDyeYellow", "Weight", 0.5);

-- BASE GAME: Paint now has 10 Uses per bucket
TweakItem("Base.PaintBlack", "UseDelta", 0.1);
TweakItem("Base.PaintBlue", "UseDelta", 0.1);
TweakItem("Base.PaintBrown", "UseDelta", 0.1);
TweakItem("Base.PaintCyan", "UseDelta", 0.1);
TweakItem("Base.PaintGreen", "UseDelta", 0.1);
TweakItem("Base.PaintGrey", "UseDelta", 0.1);
TweakItem("Base.PaintLightBlue", "UseDelta", 0.1);
TweakItem("Base.PaintLightBrown", "UseDelta", 0.1);
TweakItem("Base.PaintOrange", "UseDelta", 0.1);
TweakItem("Base.PaintPink", "UseDelta", 0.1);
TweakItem("Base.PaintPurple", "UseDelta", 0.1);
TweakItem("Base.PaintRed", "UseDelta", 0.1);
TweakItem("Base.PaintTurquoise", "UseDelta", 0.1);
TweakItem("Base.PaintWhite", "UseDelta", 0.1);
TweakItem("Base.PaintYellow", "UseDelta", 0.1);

-- BASE GAME: Plaster and Concrete Lasts 10 uses per bucket
TweakItem("Base.BucketPlasterFull", "UseDelta", 0.1);
TweakItem("Base.BucketConcreteFull", "UseDelta", 0.1);

-- BASE GAME: Fire Extinguishers should last longer (10 instead of 5 uses)
TweakItem("Base.Extinguisher", "UseDelta", 0.1);

-- BASE GAME: Add New Spices to Recipes
TweakItem("Base.Basil", "EvolvedRecipe", "Soup:1;Stew:1;Stir fry:1;Roasted Vegetables:1;Salad:1;Burger:1;PastaPan:1;RicePan:1;PastaPot:1;RicePot:1;Taco:1;Burrito:1");
TweakItem("Base.Chives", "EvolvedRecipe", "Soup:1;Stew:1;Stir fry:1;Roasted Vegetables:1;Burger:1;Salad:1;PastaPan:1;RicePan:1;PastaPot:1;RicePot:1;Taco:1;Burrito:1;Omelette:1");
TweakItem("Base.Cilantro", "EvolvedRecipe", "Soup:1;Stew:1;Stir fry:1;Roasted Vegetables:1;Burger:1;Salad:1;PastaPan:1;RicePan:1;PastaPot:1;RicePot:1;Taco:1;Burrito:1;Omelette:1");
TweakItem("Base.Oregano", "EvolvedRecipe", "Soup:1;Stew:1;Stir fry:1;Roasted Vegetables:1;Burger:1;Salad:1;PastaPan:1;RicePan:1;PastaPot:1;RicePot:1;Taco:1;Burrito:1;Omelette:1");
TweakItem("Base.Parsley", "EvolvedRecipe", "Soup:1;Stew:1;Pie:1;Stir fry:1;Roasted Vegetables:1;Burger:1;Salad:1;PastaPan:1;RicePan:1;PastaPot:1;RicePot:1;Taco:1;Burrito:1;Omelette:1");
TweakItem("Base.Rosemary", "EvolvedRecipe", "Soup:1;Stew:1;Pie:1;Stir fry:1;Roasted Vegetables:1;Burger:1;Salad:1;PastaPan:1;RicePan:1;PastaPot:1;RicePot:1;Taco:1;Burrito:1;Omelette:1");
TweakItem("Base.Sage", "EvolvedRecipe", "Soup:1;Stew:1;Pie:1;Stir fry:1;Roasted Vegetables:1;Burger:1;Salad:1;PastaPan:1;RicePan:1;PastaPot:1;RicePot:1;Taco:1;Burrito:1;Omelette:1");
TweakItem("Base.Thyme", "EvolvedRecipe", "Soup:1;Stew:1;Pie:1;Stir fry:1;Roasted Vegetables:1;Burger:1;Salad:1;PastaPan:1;RicePan:1;PastaPot:1;RicePot:1;Taco:1;Burrito:1;Omelette:1;HotDrinkTea:1");
TweakItem("Base.BouillonCube", "EvolvedRecipe", "Soup:1;Stew:1;RicePot:1");

-- BASE GAME: Add Fruits to Pie
TweakItem("Base.Lemon", "EvolvedRecipe", "Pie:10;Cake:10;FruitSalad:10;Pancakes:10;Waffles:10;Muffin:10");
TweakItem("Base.BerryBlack", "EvolvedRecipe", "Pie:10;Cake:10;FruitSalad:10;Pancakes:10;Waffles:10;Muffin:10");
TweakItem("Base.BerryBlue", "EvolvedRecipe", "Pie:10;Cake:10;FruitSalad:10;Pancakes:10;Waffles:10;Muffin:10")
TweakItem("Base.Peach", "EvolvedRecipe", "Pie:6;Cake:6;FruitSalad:6;Pancakes:6;Waffles:6;Muffin:6");
TweakItem("Base.Pineapple", "EvolvedRecipe", "Pie:10;Cake:10;FruitSalad:10;Pancakes:10;Waffles:10;Muffin:10");
TweakItem("Base.Cherry", "EvolvedRecipe", "Pie:3;Cake:3;FruitSalad:3;Pancakes:3;Waffles:3;Muffin:3");
TweakItem("Base.Grapes", "EvolvedRecipe", "Pie:15;Cake:15;FruitSalad:15;Pancakes:15;Waffles:15;Muffin:15");
TweakItem("Base.Orange", "EvolvedRecipe", "Pie:8;Cake:8;FruitSalad:8;Pancakes:8;Waffles:8;Muffin:8");
TweakItem("Base.Apple", "EvolvedRecipe", "Pie:8;Cake:8;FruitSalad:8;Pancakes:8;Waffles:8;Muffin:8");
TweakItem("Base.Banana", "EvolvedRecipe", "Pie:10;Cake:10;FruitSalad:10;Pancakes:10;Waffles:10;Muffin:10");

-- BASE GAME: Add Canned Items to Pie (e.g.: Sheppard's Pie)
TweakItem("Base.CannedCornedBeefOpen", "EvolvedRecipe", "Pie:15;Stew:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:10;Sandwich Baguette:10;Salad:10;Roasted Vegetables:15;PastaPot:15;PastaPan:15;RicePot:15;RicePan:15");
TweakItem("Base.CannedCornOpen", "EvolvedRecipe", "Pie:15;Soup:15;Stew:15;Stir fry Griddle Pan:15;Stir fry:15;Burger:8;Salad:15;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15");
TweakItem("Base.CannedPeasOpen", "EvolvedRecipe", "Pie:15;Omelette:7;Soup:15;Stew:15;Stir fry Griddle Pan:15;Stir fry:15;Roasted Vegetables:15;RicePot:15;RicePan:15");
TweakItem("Base.CannedFruitCocktailOpen", "EvolvedRecipe", "Pie:15;Cake:15;FruitSalad:15;Pancakes:15;Waffles:15;Muffin:15");
TweakItem("Base.CannedPeachesOpen", "EvolvedRecipe", "Pie:15;Cake:15;FruitSalad:15;Pancakes:15;Waffles:15;Muffin:15");
TweakItem("Base.CannedPineappleOpen", "EvolvedRecipe", "Pie:15;Cake:15;FruitSalad:15;Pancakes:15;Waffles:15;Muffin:15");

-- BASE GAME: Gravy is a spice for evolved recipes
TweakItem("Base.Gravy", "Spice", "true");
TweakItem("Base.Gravy", "EvolvedRecipe", "Stew:7;Pie:7;Stir fry:7;Stir fry Griddle Pan:7;Roasted Vegetables:7;Sandwich:7;Sandwich Baguette:7;Burger:7;PastaPan:7;RicePan:7;PastaPot:7;RicePot:7;Taco:7;Burrito:7;Waffles:7;Omelette:7;Muffin:7");

-- BASE GAME: Add Happiness to new Spices
TweakItem("Base.Basil", "UnhappyChange", -5);
TweakItem("Base.Chives", "UnhappyChange", -5);
TweakItem("Base.Cilantro", "UnhappyChange", -5);
TweakItem("Base.Oregano", "UnhappyChange", -5);
TweakItem("Base.Parsley", "UnhappyChange", -5);
TweakItem("Base.Rosemary", "UnhappyChange", -5);
TweakItem("Base.Sage", "UnhappyChange", -5);
TweakItem("Base.Thyme", "UnhappyChange", -5);
