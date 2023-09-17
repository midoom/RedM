--Added code from OnyxEye on vorp core discord to reference locations
--Moved the bounty board outside of valentine's sheriff office

Config = {}

Config.HuntingMessage = 'Press [ENTER] to start Call to Arms '
Config.KillingMessage = 'Kill all the enemies to win the money'
Config.KillingMessage2 = 'Kill all the enemies in Round 2 to advance..'
Config.KillingMessage3 = 'Kill all the enemies in Round 3 to advance..'
Config.ObjectivesKilledMessage = 'You managed to defeat the bandits'
Config.ObjectivesKilledMessage2 = 'Wave 1 complete : Get Ready for Wave 2'
Config.ObjectivesKilledMessage3 = 'Wave 2 complete : Get Ready for Wave 3'
Config.DeadMessage = "You have lost the fight"
Config.Price = 20.0
Config.Xp =30

Config.Locations = {
    { ["x"] = -1421.74, ["y"] = -2322.52, ["z"] = 43.11} --Theives Landing
}

Config.Coordenates = {
    coords = {
        {x = -1406.04, y = -2320.89, z = 42.09},
        {x = -1406.41, y = -2319.03, z = 42.09},
        {x = -1403.48, y = -2390.64, z = 42.51},
         {x = -1406.04, y = -2320.89, z = 42.52},
         {x = -1403.95, y = -2289.54, z = 42.52},
         {x = -1406.48, y = -2308.08, z = 42.05},
		 {x = -1443.34, y = -2317.35, z = 42.34},
		 {x = -1443.44, y = -2315.04, z = 42.69},
	
	},
	 coords2 = { 
		{x = -1403.48, y = -2390.64, z = 42.51},
		{x = -1403.95, y = -2289.54, z = 42.52},
		 {x = -1406.04, y = -2320.89, z = 42.09},
		 {x = -1403.48, y = -2390.64, z = 42.51},
		{x = -1403.95, y = -2289.54, z = 42.52},
		 {x = -1406.04, y = -2320.89, z = 42.09},
		 {x = -1442.96, y = -2289.53, z = 42.11},
		 {x = -1442.96, y = -2289.53, z = 42.11},
    },
	coords3 = { 
		{x = -1403.48, y = -2390.64, z = 42.51},
		{x = -1403.95, y = -2289.54, z = 42.52},
		 {x = -1406.04, y = -2320.89, z = 42.09},
		 {x = -1442.96, y = -2289.53, z = 42.11},
		 {x = -1442.96, y = -2289.53, z = 42.11},
		 {x = -1440.94, y = -2277.61, z = 42.47},
		 {x = -1426.59, y = -2279.99, z = 42.48},
		 {x = -1442.56, y = -2289.43, z = 42.11},
		 {x = -1440.44, y = -2277.31, z = 42.47},
		 {x = -1426.59, y = -2279.69, z = 42.48},
		 {x = -1427.09, y = -2278.90, z = 42.11},
		 {x = -1415.83, y = -2253.81, z = 42.98}
    }
}

Config.weapons = {
	{hash = 0x772C8DD6},
	{hash = 0x169F59F7},
	{hash = 0xDB21AC8C},
	{hash = 0x6DFA071B},
	{hash = 0xF5175BA1},
	{hash = 0xD2718D48},
	{hash = 0x797FBF5},
	{hash = 0x772C8DD6},
	{hash = 0x7BBD1FF6},
	{hash = 0x63F46DE6},
	{hash = 0xA84762EC},
	{hash = 0xDDF7BC1E},
	{hash = 0x20D13FF},
	{hash = 0x1765A8F8},
	{hash = 0x657065D6},
	{hash = 0x8580C63E}, 
	{hash = 0x95B24592},       
	{hash = 0x31B7B9FE},       
	{hash = 0x88A8505C},       
	{hash = 0x1C02870C},       
	{hash = 0x28950C71},     
	{hash = 0x6DFA071B}
}
               
Config.models = {
	
	{hash = "A_M_M_BiVFancyDRIVERS_01"},
	{hash = "G_M_M_UniCornwallGoons_01"},
	{hash = "A_M_M_GriSurvivalist_01"},
	{hash = "A_M_M_huntertravelers_cool_01"},
	{hash = "A_M_M_BynFancyDRIVERS_01"},
	{hash = "A_M_M_RkrFancyTravellers_01"},
	{hash = "A_M_M_BiVRoughTravellers_01"},
	{hash = "A_M_M_SkpPrisoner_01"},
	{hash = "A_M_M_SmHThug_01"},
	{hash = "G_M_M_UniAfricanAmericanGang_01"},
	{hash = "G_M_M_UniBanditos_01"},
	{hash = "A_M_M_GRIFANCYDRIVERS_01"},
	{hash = "A_M_M_RANCHERTRAVELERS_COOL_01"},
	{hash = "G_M_M_UniDuster_03"},
	{hash = "MP_ASN_SDPOLICESTATION_MALES_01"},
	{hash = "MP_G_M_M_ARMYOFFEAR_01"},
	{hash = "MP_G_F_M_ARMYOFFEAR_01"},
	{hash = "MP_G_M_M_UNICRIMINALS_07"},
	{hash = "S_M_M_Army_01"},
	
	
	{hash = "G_M_M_UniCriminals_01"}
	
}
