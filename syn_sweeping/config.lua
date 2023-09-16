Config = {}
Config.keys = {
    ["G"] = 0x760A9C6F,
    ["DOWN"] = 0x05CA7C52,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["B"] = 0x4CC0E2FE,
    ["E"] = 0xCEFD9220,
    ["Q"] = 0xDE794E3E,

}

Config.cleancompany = {
    blackwatersweep = {
        Pos = {x= -840.61, y=-1359.88, z=43.5, h=100.0}, -- location 
	blipsprite = -699499938, -- blip sprite 
        showblip = true, -- show blip or not 
        Name = 'Philanthropist Society', -- blip name 
        npcmodel = "CS_PrincessIsabeau",
    },
}
--SWEEPING ANIMATION -- WORLD_HUMAN_BROOM_WORKING
Config.cleanmissions = {
    blackwatersweep = {
        materialpickup = {x= -840.14, y=-1348.91, z=44.2},
        reward = 12, -- depending on tasks done and if the player failed skill checks
        workspots = {
        	{x= -869.09, y=-1331.09, z=43.81, wa= 'WORLD_HUMAN_BROOM_WORKING'}, --Gunsmith
		{x= -853.73, y=-1359.39, z=43.4, wa= 'WORLD_HUMAN_BROOM_WORKING'}, --Corner of Stables
        	{x= -854.43, y=-1375.37, z=43.4, wa= 'WORLD_HUMAN_BROOM_WORKING'}, --Lumber Store
        	{x= -843.13, y=-1373.69, z=43.4, wa= 'WORLD_HUMAN_BROOM_WORKING'}, --Wood Shop
		{x= -806.68, y=-1325.52, z=43.4, wa= 'WORLD_HUMAN_BROOM_WORKING'}, --Saloon
        }
    },

}

Config.CleanLanguage = {
constructionmenu = "Press G to talk",
construction = "Philanthropy",
startjob = "Start Working",
trust = "Exp: ",
marked = "Go to the marked location",
pickup = "Dustbin Pickup / Dropoff",
pressgtopickup = "Press G To Pickup",
dosomework = "Cleaning Location",
startconst = "Press G to start Cleaning",
finishedtasks = "Finished cleaning for the day, head back to the Manager",
finishwork = "Clock Out",
messedup = "You make a mess and have to start over",
paid = "You get paid $ ",
nowork = "Your work wasn't sufficient to be paid for.",
}
