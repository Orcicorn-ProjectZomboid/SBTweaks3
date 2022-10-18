FitnessExercises = {};

FitnessExercises.exercisesType = {
	burpees = {
		type = "burpees",
		name=getText("IGUI_Burpees"),
		tooltip=getText("IGUI_Burpees_Tooltip"),
		stiffness="legs,arms,chest", -- where we gonna build stiffness (can be a list separated by "," can be legs, arms or abs)
		metabolics = Metabolics.FitnessHeavy,
		xpMod = 25, -- few less xp as it gives xp for 3 body parts
	};
    squats = {
		type = "squats",
		name=getText("IGUI_Squats"),
		tooltip=getText("IGUI_Squats_Tooltip"),
		stiffness="legs", -- where we gonna build stiffness (can be a list separated by "," can be legs, arms or abs)
		metabolics = Metabolics.Fitness,
		xpMod = 50,
	};
    situp = {
		type = "situp",
		name=getText("IGUI_SitUps"),
		tooltip=getText("IGUI_SitUps_Tooltip"),
		stiffness="abs",
		metabolics = Metabolics.Fitness,
		xpMod = 50,
	};
    pushups = {
		type = "pushups",
		name=getText("IGUI_PushUps"),
		tooltip=getText("IGUI_PushUps_Tooltip"),
		stiffness="arms,chest",
		metabolics = Metabolics.Fitness,
		xpMod = 35,
	};
	bicepscurl = {
		type = "bicepscurl",
		name=getText("IGUI_BicepsCurl"),
		tooltip=getText("IGUI_PushUps_Tooltip"),
		item = "Base.DumbBell",
		prop="switch", -- switch is special, as i have 2 anim, one for left hand and one for right, i'll switch every X repeat the hand used
		stiffness="arms",
		metabolics = Metabolics.FitnessHeavy,
		xpMod = 50,
	};
    dumbbellpress = {
		type = "dumbbellpress",
		name=getText("IGUI_DumbbellPress"),
		tooltip=getText("IGUI_PushUps_Tooltip"),
		item = "Base.DumbBell",
		prop="switch",
		stiffness="arms",
		metabolics = Metabolics.FitnessHeavy,
		xpMod = 55,
	};
	barbellcurl = {
		type = "barbellcurl",
		name=getText("IGUI_BarbellCurl"),
		tooltip=getText("IGUI_BarbellCurl_Tooltip"),
		item = "Base.BarBell",
		prop="twohands", -- prop is where we gonna put our item, 2 hand, primary or switch (one hand, then the other every X times)
		stiffness="arms,chest",
		metabolics = Metabolics.FitnessHeavy,
		xpMod = 75,
	};
}