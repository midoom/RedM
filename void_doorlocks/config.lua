Config = {}
Config.useitems = true --if true you can open doors using authorizedItems (authorizedJobs will be neglected)
						--if false you will open doors using Alt button and authorizedJobs


Config.DoorList = {
-- Double doors Example
--	{
--		authorizedJobs = { 'job' },
--		authorizedItem = 'itemname',
--		canlockbreak = false,
--		object = 2155710627,
--		object2 = 1920184275,
--		objCoords  = vector3(2686.21, -1359.97, 48.23),
--		textCoords  = vector3(2686.21, -1359.97, 48.23),
--		objYaw = 130.0,
--		objYaw2 = -230.0,
--		locked = true,
--		distance = 1.0
--	},
-- Double doors Example END
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- centre penitencier sous sol
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1281919024,
		objCoords  = vector3(3366.871, -681.5262, 41.66911),
		textCoords  = vector3(3366.871, -681.5262, 41.66911),
		name = "Prison",
		locked = true,
		objYaw = 49.99995803833,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal', 'docteur_v', 'docteur_rh', 'docteur_bw' }, --Valentine Sheriff Front Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1988748538,
		objCoords  = vector3(-276.04, 802.73, 118.41),
		textCoords  = vector3(-275.02, 802.84, 119.43),
		name = "Bureau du Sheriff Valentine",
		locked = true,
		objYaw = 10.0,
		distance = 1.5
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Valentine Sheriff Back Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 395506985,
		objCoords  = vector3(-275.85, 812.02, 118.41),
		textCoords  = vector3(-277.06, 811.83, 119.38),
		name = "Bureau du Sheriff Valentine",
		objYaw = -170.0,
		locked = true,
		distance = 1.5
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Valentine Cells (Rear Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1508776842,
		objCoords  = vector3(-270.7664, 810.0265, 118.3958),
		textCoords  = vector3(-270.5664, 808.9285, 119.19),
		name = "Celulle Valentine",
		objYaw = -80.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Valentine Cells (Main Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 535323366,		
		objCoords  = vector3(-275.03, 809.27, 118.36),
		textCoords  = vector3(-274.89, 808.03, 119.39),
		name = "Isolement Valentine",
		objYaw = -80.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal'}, -- Valentine Cells (Left Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 295355979,
		objCoords  = vector3(-273.47, 809.96, 118.36),
		textCoords  = vector3(-272.23, 810.1, 119.39),
		name = "Celulle Valentine",
		objYaw = 10.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Valentine Cells (Right Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 193903155,
		objCoords  = vector3(-272.06, 808.25, 118.36),
		textCoords  = vector3(-273.3, 808.12, 119.39),
		name = "Celulle Valentine",
		objYaw = -170.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_v' }, -- Valentine Bank (Gate to Hallway)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2343746133,
		objCoords  = vector3(-301.94, 771.75, 117.72),
		textCoords  = vector3(-303.02, 771.60, 118.47),
		name = 'Banque Valentine',
		objYaw = -170.0,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'docteur_v', 'banquier_v' }, -- Valentine Bank (Teller Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1340831050,
		objCoords  = vector3(-311.75, 774.67, 117.72),
		textCoords  = vector3(-310.48, 774.92, 118.70),
		name = 'Banque Valentine',
		objYaw = 10.05,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_v' }, -- Valentine Bank (Office Door - Teller Room)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3718620420,
		objCoords  = vector3(-311.06, 770.12, 117.7),
		textCoords  = vector3(-309.97, 770.20, 118.70),
		name = 'Banque Valentine',
		objYaw = 10.36,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_v' }, -- Valentine Bank (Office Door - Hallway)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 334467483,
		objCoords  = vector3(-302.93, 767.6, 117.69),
		textCoords  = vector3(-302.97, 768.61, 118.70),
		name = 'Banque Valentine',
		objYaw = 100.0,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = {  'marshal', 'banquier_v' }, -- Valentine Vault Door bank
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 576950805,
		objCoords  = vector3(-307.76, 766.34, 117.7),
		textCoords  = vector3(-306.60, 766.65, 118.70),
		name = 'Banque Valentine',
		objYaw = -170.0,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_v' }, -- Valentine Bank (Rear Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2307914732,
		objCoords  = vector3(-301.51, 762.98, 117.73),
		textCoords  = vector3(-300.59, 763.20, 118.70),
		name = 'Banque Valentine',
		objYaw = 10.0,
		locked = false,
		distance = 3.0
	},
 	{
		authorizedJobs = { 'marshal' }, -- Valentine Other Saloon (Rear Left Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1013933832,
		objCoords  = vector3(-238.9688873291,774.22943115234,117.14748382568),
		textCoords  = vector3(-238.9688873291,774.22943115234,117.14748382568),
		name = 'Saloon Valentine',
		objYaw = 290.0,
		locked = true,
		distance = 3.0
	}, 
	{
		authorizedJobs = { 'marshal', 'armurier_v' }, -- Valentine armurier (Rear Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2042647667,
		objCoords  = vector3(-276.65576171875,776.60430908203,118.54555511475),
		textCoords  = vector3(-276.65576171875,776.60430908203,118.54555511475),
		name = 'Armurerie Valentine',
		objYaw = 179.99998474121,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Fort Wallace Jail Cell
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 4248740658,
		objCoords  = vector3(346.23724365234,1468.9339599609,178.72691345215),
		textCoords  = vector3(346.23724365234,1468.9339599609,178.72691345215),
		name = 'Cellule Fort Wallace',
		objYaw = 215.19097900391,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal' }, -- Fort Wallace Weapons Shelter Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1223148325,
		objCoords  = vector3(363.3249, 1488.73, 179.6615),
		textCoords  = vector3(363.3249, 1488.73, 179.6615),
		name = 'Armurerie Fort Wallace',
		objYaw = 104.99097442627,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_rh', 'marshal', 'docteur_rh', 'banquier_rh' }, -- Rhodes Bank Main Doors
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3317756151,
		object2 = 3088209306,
		objCoords  = vector3(1296.2719726563,-1299.0120849609,76.03963470459),
		textCoords  = vector3(1295.363, -1298.380, 77.04),
		name = 'Banque Rhodes',
		objYaw = 139.53230285645,
		objYaw2 = 319.59982299805,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_rh' }, -- Rhodes Bank Teller Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1634148892,
		objCoords  = vector3(1295.7341308594,-1305.4748535156,76.033004760742),
		textCoords  = vector3(1295.7341308594,-1305.4748535156,76.033004760742),
		name = 'Banque Rhodes',
		objYaw = 139.99998474121,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_rh' }, -- Rhodes Bank Hallway Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2058564250,
		objCoords  = vector3(1285.1475830078,-1303.1185302734,76.040069580078),
		textCoords  = vector3(1285.1475830078,-1303.1185302734,76.040069580078),
		name = 'Banque Rhodes',
		objYaw = 320.0,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_rh' }, -- Rhodes Bank Vault Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3483244267,
		objCoords  = vector3(1282.5363769531,-1309.3159179688,76.036422729492),
		textCoords  = vector3(1282.5363769531,-1309.3159179688,76.036422729492),
		name = 'Banque Rhodes',
		objYaw = 230.05541992188,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_rh'}, -- Rhodes Bank Rear Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3142122679,
		objCoords  = vector3(1278.8559570313,-1310.4030761719,76.039642333984),
		textCoords  = vector3(1278.8559570313,-1310.4030761719,76.039642333984),
		name = 'Banque Rhodes',
		objYaw = 319.73440551758,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_rh' }, -- Rhodes Bank Rear Door Gate
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 559643844,
		objCoords  = vector3(1279.419, -1311.433, 76.03201),
		textCoords  = vector3(1279.419, -1311.433, 76.03201),
		name = 'Banque Rhodes',
		objYaw = 140.0,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Rhodes Sheriff Front Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 349074475,
		objCoords  = vector3(1359.71, -1305.97, 76.76),
		textCoords  = vector3(1358.42, -1305.71, 77.72),
		name = "Bureau du Sheriff Rhodes",
		objYaw = 160.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Rhodes Sheriff Back Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1614494720,
		objCoords  = vector3(1359.12, -1297.56, 76.78),
		textCoords  = vector3(1358.51, -1298.95,77.78),
		name = "Bureau du Sheriff Rhodes",
		objYaw = -110.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Rhodes Jail Cell
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1878514758,
		objCoords  = vector3(1357.26, -1301.58, 77.76),
		textCoords  = vector3(1357.26, -1301.58, 77.76),
		name = "Celulle Rhodes",
		objYaw = 70.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Main Doors
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1595076728,
		object2 = 1439227364,
		objCoords  = vector3(1012.2030029297,-1762.0412597656,46.599708557129),
		textCoords  = vector3(1011.147, -1761.94, 47.60),
		name = "Manoir de Braitwaite",
		objYaw = 359.84088134766,
		objYaw2 = 359.78961181641,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Rear Main Doors
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1620578985,
		object2 = 3222102077,
		objCoords  = vector3(1010.4942016602,-1779.3802490234,46.609394073486),
		textCoords  = vector3(1011.13, -1779.31, 47.60),
		name = "Manoir de Braitwaite",
		objYaw = 0.0,
		objYaw2 = 0.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Right Side Double Doors (Front)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1299101427,
		object2 = 530930529,
		objCoords  = vector3(1000.0399169922,-1765.6871337891,46.62434387207),
		textCoords  = vector3(1000.09, -1765.00, 47.58),
		name = "Manoir de Braitwaite",
		objYaw = 270.0,
		objYaw2 = 269.99993896484,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Right Side Double Doors (Middle)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 785447352,
		object2 = 23338719,
		objCoords  = vector3(1000.0394897461,-1769.2019042969,46.623123168945),
		textCoords  = vector3(1000.25, -1768.49, 47.62),
		name = "Manoir de Braitwaite",
		objYaw = 270.0,
		objYaw2 = 269.99993896484,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Right Side Double Doors (Rear)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1606293329,
		object2 = 1913469935,
		objCoords  = vector3(1000.0346679688,-1773.2373046875,46.626728057861),
		textCoords  = vector3(1000.29, -1772.52, 47.58),
		name = "Manoir de Braitwaite",
		objYaw = 270.18923950195,
		objYaw2 = 269.72958374023,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Left Side Double Doors (Door 1)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1970779164,
		object2 = 2276841624,
		objCoords  = vector3(1022.5345458984,-1765.7020263672,46.624011993408),
		textCoords  = vector3(1022.56, -1765.02, 47.66),
		name = "Manoir de Braitwaite",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Left Side Double Doors (Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2630222520,
		object2 = 2919540021,
		objCoords  = vector3(1022.5319213867,-1769.2026367188,46.623615264893),
		textCoords  = vector3(1022.29, -1768.59, 47.58),
		name = "Manoir de Braitwaite",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Left Side Double Doors (Door 3)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 606588923,
		object2 = 248030525,
		objCoords  = vector3(1022.5319213867,-1774.5867919922,46.624011993408),
		textCoords  = vector3(1022.58, -1773.90, 47.65),
		name = "Manoir de Braitwaite",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Left Side Double Doors (Door 4)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3330577590,
		object2 = 825059846,
		objCoords  = vector3(1022.5319213867,-1777.7064208984,46.624011993408),
		textCoords  = vector3(1022.59, -1776.98, 47.65),
		name = "Manoir de Braitwaite",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Main Double Doors Top (Front)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 4142860936,
		object2 = 473912616,
		objCoords  = vector3(1012.2028808594,-1762.0411376953,51.012351989746),
		textCoords  = vector3(1011.10, -1761.94, 52.05),
		name = "Manoir de Braitwaite",
		objYaw = 359.71206665039,
		objYaw2 = 0.30076456069946,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Main Double Doors Top Right (Door 1)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2443210508,
		object2 = 2744488746,
		objCoords  = vector3(1005.6744995117,-1761.9895019531,51.060958862305),
		textCoords  = vector3(1006.35, -1762.05, 52.09),
		name = "Manoir de Braitwaite",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Main Double Doors Top Right Side (Door 1)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3195947259,
		object2 = 1799856783,
		objCoords  = vector3(1000.0388183594,-1763.5151367188,51.063438415527),
		textCoords  = vector3(999.90, -1764.20, 52.08),
		name = "Manoir de Braitwaite",
		objYaw = 270.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Main Double Doors Top Right Side (Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1518993684,
		object2 = 426802898,
		objCoords  = vector3(1000.0388183594,-1767.8270263672,51.060958862305),
		textCoords  = vector3(1000.14, -1768.50, 52.05),
		name = "Manoir de Braitwaite",
		objYaw = 270.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Main Double Doors Top Right Side (Door 3)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2645129384,
		object2 = 2420104661,
		objCoords  = vector3(1000.009765625,-1774.8167724609,51.060527801514),
		textCoords  = vector3(1000.18, -1775.58, 52.05),
		name = "Manoir de Braitwaite",
		objYaw = 270.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Main Double Doors Top Left (Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 121494125,
		object2 = 3046979385,
		objCoords  = vector3(1002.5340576172,-1761.9896240234,51.060958862305),
		textCoords  = vector3(1001.85, -1761.86, 52.08),
		name = "Manoir de Braitwaite",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Left Side Double Doors Top Left (Door 1)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1909255102,
		object2 = 3386579929,
		objCoords  = vector3(1022.5201416016,-1767.8416748047,51.044216156006),
		textCoords  = vector3(1022.22, -1768.52, 52.04),
		name = "Manoir de Braitwaite",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Left Side Double Doors Top Left (Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3879050174,
		object2 = 409697833,
		objCoords  = vector3(1022.520324707,-1776.1264648438,51.04598236084),
		textCoords  = vector3(1022.77, -1775.44, 52.05),
		name = "Manoir de Braitwaite",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'masterhouse' }, -- Braithwaite Manor Left Side Double Doors Top Left (Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3879050174,
		objCoords  = vector3(1022.520324707,-1776.1264648438,51.04598236084),
		textCoords  = vector3(1022.77, -1775.44, 52.05),
		name = "Manoir de Braitwaite",
		objYaw = 90.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Saint Denis Jail Cell
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3921310299,
		objCoords  = vector3(1115.868, -1989.719, 54.37629),
		textCoords  = vector3(1115.55, -1988.85, 55.35629),
		name = "Cellule Saint Denis",
		objYaw = 115.415,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Saint Denis Jail Cell
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1995743734,
		objCoords  = vector3(2499.75, -1309.87, 47.95),
		textCoords  = vector3(2499.75, -1309.87, 48.95),
		name = "Cellule Saint Denis",
		objYaw = 180.35,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Saint Denis Jail Cell
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2515591150,
		objCoords  = vector3(2503.63, -1309.87, 47.95),
		textCoords  = vector3(2503.63, -1309.87, 48.95),
		name = "Cellule Saint Denis",
		objYaw = 180.35,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Saint Denis Jail Cell
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3365520707,
		objCoords  = vector3(2498.5, -1307.85, 47.95),
		textCoords  = vector3(2498.5, -1307.85, 48.95),
		name = "Cellule Saint Denis",
		objYaw = -360.35,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'docteur_v', 'docteur_rh', 'docteur_bw' }, -- Saint Denis Doctor Surgery Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1289094734,
		objCoords  = vector3(2727.434, -1229.163, 49.3678),
		textCoords  = vector3(2727.434, -1229.163, 49.3678),
		name = "Cabinet médical Saint Denis",
		objYaw = 270.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'docteur_v', 'docteur_rh', 'docteur_bw' }, -- Saint Denis Doctor/Pharmacy
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 586229709,
		objCoords  = vector3(2723.953125,-1227.0920410156,49.367786407471),
		textCoords  = vector3(2723.953125,-1227.0920410156,49.367786407471),
		name = "Cabinet médical Saint Denis",
		objYaw = 270.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'docteur_v', 'docteur_rh', 'docteur_bw' }, -- Saint Denis Doctor Back Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1104407261,
		objCoords  = vector3(2725.1469726563,-1221.6247558594,49.367805480957),
		textCoords  = vector3(2725.1469726563,-1221.6247558594,49.367805480957),
		name = "Cabinet médical Saint Denis",
		objYaw = 0.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'marshal', 'docteur_v', 'docteur_rh', 'docteur_bw' }, -- Saint Denis Pharmacy Front Doors
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3723126486,
		object2 = 79213682,
		objCoords  = vector3(2715.9943847656,-1230.2332763672,49.371280670166),
		textCoords  = vector3(2716.2651367188, -1229.3813476563, 50.36576461792),
		name = "Pharmacie Saint Denis",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Annesburg Jail Cell (Right)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1502928852,
		objCoords  = vector3(2904.2734375,1314.3405761719,43.935844421387),
		textCoords  = vector3(2904.791, 1315.474, 44.96082),
		name = "Cellule Annesburg",
		objYaw = 69.264205932617,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Annesburg Jail Cell (Left)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1657401918,
		objCoords  = vector3(2902.9602050781,1310.8717041016,43.935844421387),
		textCoords  = vector3(2903.478, 1312.005, 44.96082),
		name = "Cellule Annesburg",
		objYaw = 69.264205932617,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Annesburg Sheriff Front Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2212368673,
		objCoords  = vector3(2911.140625,1309.8092041016,43.928840637207),
		textCoords  = vector3(2911.140625,1309.8092041016,43.928840637207),
		name = "Cellule Annesburg",
		objYaw = 69.545677185059,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Armadillo Sheriff Front Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 66424668,
		objCoords  = vector3(-3624.6982421875,-2605.4157714844,-14.351517677307),
		textCoords  = vector3(-3624.6982421875,-2605.4157714844,-14.351517677307),
		name = "Cellule Armadillo",
		objYaw = 115.00002288818,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Armadillo Jail Cell Door (Right)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 4235597664,
		objCoords  = vector3(-3619.1481933594,-2604.2065429688,-14.351593017578),
		textCoords  = vector3(-3618.697, -2605.369, -13.3268),
		name = "Cellule Armadillo",
		objYaw = 295.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Armadillo Jail Cell Door (Left)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 4016307508,
		objCoords  = vector3(-3620.9931640625,-2600.2490234375,-14.351593017578),
		textCoords  = vector3(-3620.542, -2601.411, -13.3268),
		name = "Cellule Armadillo",
		objYaw = 295.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Armadillo Bank
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3101287960,
		objCoords  = vector3(-3666.0139160156,-2620.8779296875,-14.569600105286),
		textCoords  = vector3(-3666.0139160156,-2620.8779296875,-14.569600105286),
		name = "Banque Armadillo",
		objYaw = 0.0,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Armadillo Bank (Teller Gate)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3550475905,
		objCoords  = vector3(-3661.1369628906,-2627.3623046875,-14.586261749268),
		textCoords  = vector3(-3661.1369628906,-2627.3623046875,-14.586261749268),
		name = "Banque Armadillo",
		objYaw = 180.0,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Armadillo Bank (Back Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1366165179,
		objCoords  = vector3(-3663.1545410156,-2638.9812011719,-14.571752548218),
		textCoords  = vector3(-3663.1545410156,-2638.9812011719,-14.571752548218),
		name = "Banque Armadillo",
		objYaw = 0.0,
		locked = false,
		distance = 3.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Tumbleweed Jail Main Entrance
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2735269038,
		objCoords  = vector3(-5527.6767578125,-2930.4975585938,-2.3662209510803),
		textCoords  = vector3(-5527.6767578125,-2930.4975585938,-2.3662209510803),
		name = "Isoloir Tumbleweed",
		objYaw = 205.0,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Tumbleweed Jail Cell Main
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 831345624,
		objCoords  = vector3(-5529.9135742188,-2925.0739746094,-2.3601191043854),
		textCoords  = vector3(-5529.463, -2926.236, -1.33514),
		name = "Cellule Tumbleweed",
		objYaw = 295.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Tumbleweed Jail Cell Front
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2677989449,
		objCoords  = vector3(-5531.462890625,-2921.751953125,-2.3601191043854),
		textCoords  = vector3(-5531.012, -2922.914, -1.33514),
		name = "Cellule Tumbleweed",
		objYaw = 295.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'ranger' }, -- Tumbleweed Jail Cell Front
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2984805596,
		objCoords  = vector3(-5532.9072265625,-2918.6538085938,-2.3601191043854),
		textCoords  = vector3(-5532.457, -2919.816, -1.33514),
		name = "Cellule Tumbleweed",
		objYaw = 295.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'indien' }, -- Strawberry Jail Front Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1821044729,
		objCoords  = vector3(-1806.6751708984,-350.31280517578,163.6475982666),
		textCoords  = vector3(-1806.6751708984,-350.31280517578,163.6475982666),
		name = "Cellule Strawberry",
		objYaw = 245.07702636719,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'indien' }, -- Strawberry Jail Rear Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1514359658,
		objCoords  = vector3(-1812.6691894531,-345.08489990234,163.6475982666),
		textCoords  = vector3(-1812.6691894531,-345.08489990234,163.6475982666),
		name = "Isoloir Strawberry",
		objYaw = 244.99990844727,
		locked = true,
		distance = 3.0
	},
	{
		authorizedJobs = { 'indien' }, -- Strawberry Jail Cell
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 902070893,
		objCoords  = vector3(-1814.58, -353.71, 161.43),
		textCoords  = vector3(-1814.58, -353.71, 161.43),
		name = "Cellule Strawberry",
		objYaw = -115.0,
		locked = true,
		distance = 1.5
	},
	{
		authorizedJobs = { 'indien' }, -- Strawberry Jail Cell
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1207903970,
		objCoords  = vector3(-1811.40, -352.19, 161.39),
		textCoords  = vector3(-1811.40, -352.19, 161.39),
		name = "Cellule Strawberry",
		objYaw = -26.0,
		locked = true,
		distance = 1.5
	},
--[[ 	{
		authorizedJobs = { 'docteur_bw', 'sheriff_bw', 'banquier_bw', 'palefrenier_bw', 'tavernier_bw' }, -- Blackwater Bathroom saloon
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked 
		object = 815031507,
		objCoords  = vector3(-824.1289, -1322.801, 42.68617),
		textCoords  = vector3(-824.1289, -1321.801, 43.66617),
		name = "Bain",
		objYaw = 90.0,
		locked = true,
		distance = 1.0
	}, ]]
	{
		authorizedJobs = { 'sheriff_bw', 'marshal' }, -- Blackwater Sheriff Back Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2810801921,
		objCoords  = vector3(-769.14, -1268.75, 42.06),
		textCoords  = vector3(-769.14, -1269.75, 44.04),
		name = "Bureau du Sheriff Blackwater",
		objYaw = -90.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Blakwater jail sheriff
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked 
		object = 2514996158,
		objCoords  = vector3(-765.75, -1263.47, 42.06),
		textCoords  = vector3(-765.75, -1263.47, 44.3),
		name = "Cellule Blackwater",
		objYaw = 90.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Blakwater jail sheriff
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked 
		object = 2167775834,
		objCoords  = vector3(-763.53, -1263.71, 42.06),
		textCoords  = vector3(-763.53, -1263.71, 44.3),
		name = "Cellule Blackwater",
		objYaw = -90.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'sheriff_v', 'sheriff_rh', 'sheriff_bw', 'marshal' }, -- Blackwater Sheriff Front Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3410720590,
		object2 = 3821185084,
		objCoords  = vector3(-757.05, -1268.49, 42.06),
		textCoords  = vector3(-757.05, -1269.34, 44.04),
		name = "Bureau du Sheriff Blackwater",
		objYaw = 90.41,
		objYaw2 = 90.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'docteur_v', 'docteur_rh', 'docteur_bw', 'marshal' }, -- Valentine Doctors Office (Front Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3588026089,
		objCoords  = vector3(-282.81, 803.85, 118.39),
		textCoords  = vector3(-283.81, 803.85, 119.39),
		name = "Cabinet médical Valentine",
		objYaw = -170.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'docteur_v', 'docteur_rh', 'docteur_bw', 'marshal' }, -- Valentine Doctors Office (Middle Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 4067537969,
		objCoords  = vector3(-286.64199829102,809.78454589844,118.42121887207),
		textCoords  = vector3(-287.65, 809.76, 119.39),
		name = "Cabinet médical Valentine",
		objYaw = 190.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'docteur_v', 'marshal' }, -- Valentine Doctors Office (Back Room Back Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3439738919,
		objCoords  = vector3(-281.18, 815.41, 118.39),
		textCoords  = vector3(-281.18, 816.2, 119.39),
		name = "Cabinet médical Valentine",
		objYaw = 99.663230895996,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'docteur_v', 'docteur_rh', 'docteur_bw', 'marshal' }, -- Valentine Doctors Office (Back Room Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 925575409,
		objCoords  = vector3(-290.72, 813.29, 118.41),
		textCoords  = vector3(-289.8, 813.29, 119.39),
		name = "Cabinet médical Valentine",
		objYaw = 10.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'armurier_v', 'marshal' }, -- Valentine Gunshop Rear Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = -1669881355,
		objCoords  = vector3(1326.038, -1326.383, 76.92236),
		textCoords  = vector3(1326.038, -1326.383, 76.92236),
		name = "Armurerie Valentine",
		objYaw = 16.29368591309,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_rh' }, -- Saint Denis Bank Vault Door
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1751238140,
		objCoords  = vector3(2643.301, -1300.427, 51.255841),
		textCoords  = vector3(2643.301, -1300.427, 51.255841),
		objYaw = 159.90571594238,
		name = "Banque Saint Denis ",
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'marshal', 'banquier_rh' }, -- Saint Denis Bank Manager Double Doors
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1634115439,
		object2 = 965922748,
		objCoords  = vector3(2646.983, -1300.896, 51.245381),
		textCoords  = vector3(2648.03, -1300.46, 52.24),
		name = "Banque Saint Denis",
		objYaw = 204.7395324707,
		objYaw2 = 204.58697509766,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'banquier_rh', 'marshal' }, -- Saint Denis North Double Doors bank
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2089945615,
		object2 = 2817024187,
		objCoords  = vector3(2640.176, -1286.343, 51.24601),
		textCoords  = vector3(2641.05, -1285.57, 52.26),
		name = "Banque Saint Denis",
		objYaw = 204.83293151855,
		objYaw2 = 205.17900085449,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'banquier_rh', 'marshal' }, -- Saint Denis West Double Doors bank
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2158285782,
		object2 = 1733501235,
		objCoords  = vector3(2637.798, -1298.037, 51.24601),
		textCoords  = vector3(2637.92, -1299.12, 52.24),
		name = "Banque Saint Denis",
		objYaw = 294.84509277344,
		objYaw2 = 294.71026611328,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government Main Doors
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2712742172,
		object2 = 1401130182,
		objCoords  = vector3(2402.515, -1095.564, 46.42542),
		textCoords  = vector3(2401.52, -1095.60, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 179.99998474121,
		objYaw2 = 0.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government West Side (Door 1)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 463894517,
		object2 = 1440476271,
		objCoords  = vector3(2387.719, -1092.577, 46.42515),
		textCoords  = vector3(2387.66, -1093.29, 47.44),
		name = "Résidence Gouvernementale",
		objYaw = 270.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government West Side (Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 4251106158,
		object2 = 895396725,
		objCoords  = vector3(2387.719, -1090.261, 46.42515),
		textCoords  = vector3(2387.66, -1090.86, 47.44),
		name = "Résidence Gouvernementale",
		objYaw = 270.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government West Side (Door 3)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2430556805,
		object2 = 260726717,
		objCoords  = vector3(2387.719, -1087.927, 46.42515),
		textCoords  = vector3(2387.66, -1088.75, 47.44),
		name = "Résidence Gouvernementale",
		objYaw = 270.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government West Side (Door 4)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 515307058,
		object2 = 2191834640,
		objCoords  = vector3(2387.718, -1085.609, 46.42515),
		textCoords  = vector3(2387.66, -1086.25, 47.44),
		name = "Résidence Gouvernementale",
		objYaw = 270.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernment' }, -- Saint Denis Government West Side (Door 5)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 957998097,
		objCoords  = vector3(2387.85, -1083.439, 46.43348),
		textCoords  = vector3(2387.57, -1082.439, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 90.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government Rear (Door 1 - Left to Right)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 64755943,
		object2 = 1282026246,
		objCoords  = vector3(2406.744, -1071.16, 46.42515),
		textCoords  = vector3(2406.04, -1071.13, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government Rear (Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1072042494,
		object2 = 1881469563,
		objCoords  = vector3(2403.08, -1071.16, 46.42515),
		textCoords  = vector3(2403.64, -1071.03, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government Rear (Door 3)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 4081383617,
		object2 = 3851050316,
		objCoords  = vector3(2402.107, -1071.16, 46.42515),
		textCoords  = vector3(2401.38, -1071.03, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government Rear (Door 4)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 4171676960,
		object2 = 714041173,
		objCoords  = vector3(2399.788, -1071.16, 46.42515),
		textCoords  = vector3(2399.11, -1071.03, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government Rear (Door 5)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3301481377,
		object2 = 4111629364,
		objCoords  = vector3(2397.47, -1071.16, 46.42515),
		textCoords  = vector3(2396.77, -1071.03, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government East Side (Door 1)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2049189737,
		object2 = 1214137310,
		objCoords  = vector3(2415.255, -1094.434, 46.42515),
		textCoords  = vector3(2415.65, -1093.79, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government East Side (Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1462821251,
		object2 = 883203179,
		objCoords  = vector3(2415.255, -1091.952, 46.42515),
		textCoords  = vector3(2415.44, -1091.29, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government East Side (Door 3)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1123170566,
		object2 = 287888768,
		objCoords  = vector3(2415.255, -1089.466, 46.42515),
		textCoords  = vector3(2415.64, -1088.81, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government East Side (Door 4)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 534737645,
		object2 = 4263849849,
		objCoords  = vector3(2415.251, -1086.98, 46.42515),
		textCoords  = vector3(2415.24, -1086.29, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 90.0,
		objYaw2 = 90.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government East Side (Door 5)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 681362779,
		object2 = 981199129,
		objCoords  = vector3(2415.545, -1084.083, 46.42515),
		textCoords  = vector3(2416.13, -1084.02, 47.42),
		name = "Résidence Gouvernementale",
		objYaw = 0.0,
		objYaw2 = 0.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (South)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3763675028,
		object2 = 3191069522,
		objCoords  = vector3(2402.516, -1095.562, 51.43517),
		textCoords  = vector3(2401.29, -1095.73, 52.42),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 0.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (West - Door 1)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1837549341,
		object2 = 1181972723,
		objCoords  = vector3(2387.941, -1092.599, 51.43631),
		textCoords  = vector3(2387.78, -1093.28, 52.44),
		name = "Résidence Gouvernementale",
		objYaw = 90.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (West - Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1359679014,
		object2 = 2612896650,
		objCoords  = vector3(2387.855, -1090.252, 51.43631),
		textCoords  = vector3(2387.66, -1090.95, 52.47),
		name = "Résidence Gouvernementale",
		objYaw = 90.0,
		objYaw2 = 270.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (East - Door 1)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2456557508,
		object2 = 1863994303,
		objCoords  = vector3(2415.77, -1084.083, 51.4253),
		textCoords  = vector3(2416.49, -1084.05, 52.45),
		name = "Résidence Gouvernementale",
		objYaw = 0.0,
		objYaw2 = 0.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (Rear - Door 1 - Left to Right)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3024919785,
		object2 = 993734236,
		objCoords  = vector3(2406.743, -1071.105, 51.42515),
		textCoords  = vector3(2405.91, -1071.00, 52.43),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (Rear - Door 2)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3738400142,
		object2 = 3431780609,
		objCoords  = vector3(2404.425, -1071.105, 51.42515),
		textCoords  = vector3(2403.82, -1070.82, 52.43),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (Rear - Door 3)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2189442277,
		object2 = 1881184294,
		objCoords  = vector3(2402.107, -1071.105, 51.42515),
		textCoords  = vector3(2401.45, -1071.30, 52.42),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (Rear - Door 4)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3130699033,
		object2 = 2833320358,
		objCoords  = vector3(2399.788, -1071.105, 51.42515),
		textCoords  = vector3(2399.11, -1071.06, 52.43),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'marshal', 'gouvernement' }, -- Saint Denis Government 2nd Floor (Rear - Door 5)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3745412704,
		object2 = 3448492795,
		objCoords  = vector3(2397.474, -1071.105, 51.42515),
		textCoords  = vector3(2396.72, -1071.08, 52.43),
		name = "Résidence Gouvernementale",
		objYaw = 180.0,
		objYaw2 = 180.0,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'armurier_rh', 'marshal' }, -- Saint Denis Weapon Shop (Front Doors)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3283200993,
		object2 = 1057071735,
		objCoords  = vector3(2720.815, -1283.54, 48.63758),
		textCoords  = vector3(2720.40, -1282.44, 49.63),
		name = "Armurerie Saint Denis",
		objYaw = 115.0,
		objYaw2 = 295.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'armurier_rh', 'marshal' }, -- Saint Denis Weapon Shop (Rear Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 841127028,
		objCoords  = vector3(2710.566, -1291.204, 48.6323),
		textCoords  = vector3(2710.68, -1290.21, 49.63),
		name = "Armurerie Saint Denis",
		objYaw = 115.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = {'armurier_rh', 'marshal' }, -- Saint Denis Weapon Shop (Top Rear Door)
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1180868565,
		objCoords  = vector3(2711.438, -1293.084, 59.45848),
		textCoords  = vector3(2711.92, -1293.65, 60.45),
		name = "Armurerie Saint Denis",
		objYaw = 295.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = {'armurier_rh', 'marshal' }, -- Porte avant armurie rhodes
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 393076024,
		objCoords  = vector3(1326.00, -1319.73, 77.89),
		textCoords  = vector3(1326.00, -1319.73, 77.89),
		name = "Porte Armurerie Rhodes",
		objYaw = 320.0,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'armurier_rh', 'marshal' }, -- Porte arriere droite armurie rhodes
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 934926308,
		objCoords  = vector3(1320.70, -1324.35, 77.88),
		textCoords  = vector3(1320.70, -1324.35, 77.88),
		name = "Porte Armurerie Rhodes",
		objYaw = 75.65,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'armurier_rh', 'marshal' }, -- Porte arriere gauche armurie rhodes
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 743565308,
		objCoords  = vector3(1331.02, -1329.06, 77.93),
		textCoords  = vector3(1331.02, -1329.06, 77.93),
		name = "Porte Armurerie Rhodes",
		objYaw = 74.646,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'armurier_rh', 'marshal' }, -- Porte interieur armurier rhodes
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1410133961,
		objCoords  = vector3(1324.19, -1323.83, 77.89),
		textCoords  = vector3(1324.19, -1323.83, 77.89),
		name = " Porte Interieur Armurerie Rhodes",
		objYaw = 255.0,
		locked = true,
		distance = 2.0
	},
	-- {
	-- 	authorizedJobs = { 'docteur_v', 'docteur_rh', 'docteur_bw', 'marshal' },
	-- 	authorizedItem = 'cle_docteur_rh', 'key',
	-- 	canlockbreak = true, -- if the door is able to be lock breaked
	-- 	object = -1866470762,
	-- 	objCoords  = vector3(1370.19, -1310.168, 76.95),
	-- 	textCoords  = vector3(1369.0, -1309.550, 77.95),
	-- 	name = "Cabinet médical Rhodes",
	-- 	objYaw = 149.361,
	-- 	locked = true,
	-- 	distance = 2.0
	-- },
	{
		authorizedJobs = { 'salooner_rh' }, -- ENTRER DOUBLE PORTES SALOON RHODES
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 834296435,
		object2 = 1124531468,
		objCoords  = vector3(1352.77, -1376.66, 80.50),
		textCoords  = vector3(1352.77, -1376.66, 80.50), 
		name = "Entrer Saloon Rhodes",
		objYaw = 149.361,
		objYaw2 = 149.361,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'salooner_rh' }, -- ENTRER DOUBLE PORTES BALCON SALOON RHODES
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1469250492,
		object2 = 678501753,
		objCoords  = vector3(1353.08, -1376.84, 84.37), 
		textCoords  = vector3(1353.08, -1376.84, 84.37),
		name = "Entrer Balcon Saloon Rhodes",
		objYaw = 80.147,
		objYaw2 = 80.147,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'salooner_rh' }, -- ENTRER DOUBLE PORTE ARRIERE SALOON RHODES BALCON
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3434364936,
		object2 = 3215894013,
		objCoords  = vector3(1337.13, -1372.02, 84.29),
		textCoords  = vector3(1337.13, -1372.02, 84.29),
		name = "Entrer Balcon Saloon Rhodes Chambre",
		objYaw = 260.20,
		objYaw2 = 258.20,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'salooner_rh' },  -- PORTE CHAMBRE 
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2046695029,
		objCoords  = vector3(1331.67, -1368.87, 80.48),
		textCoords  = vector3(1331.67, -1368.87, 80.48),
		name = "Porte Saloon Rhodes Chambre",
		objYaw = 169.361,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'salooner_rh' },  -- PORTE CHAMBRE 2
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2812328251,
		objCoords  = vector3(1334.93, -1378.25, 80.48),
		textCoords  = vector3(1334.93, -1378.25, 80.48),
		name = "Porte Saloon Rhodes Chambre 2",
		objYaw = 214.999,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'salooner_rh' }, -- doubles portes cote droite
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3392483841,
		object2 = 3728169477,
		objCoords  = vector3(1335.26, -1378.90, 80.49),
		textCoords  = vector3(1335.26, -1378.90, 80.49),
		name = "Saloon Rhodes",
		objYaw = 149.361,
		objYaw2 = 149.361,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'salooner_rh' }, --  portes arriere
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3047627494,
		objCoords  = vector3(1330.39, -1367.70, 80.50),
		textCoords  = vector3(1330.39, -1367.70, 80.50),
		name = "Saloon Rhodes",
		objYaw = 149.361,
		locked = true,
		distance = 2.0
	},
	------------------ GUARMA GRILLE
	{
		authorizedJobs = { 'milice' }, -- Grille guarma
		authorizedItem = 'key',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1572865,
		objCoords  = vector3(1282.421, -6862.069, 42.48259),
		textCoords  = vector3(1282.421, -6862.069, 42.48259),
		name = "Douane",
		objYaw = 249.361,
		locked = true,
		distance = 2.0
	},
	{
        authorizedJobs = { 'ranger' }, -- Garde chasse Lake
        authorizedItem = 'key',
        canlockbreak = true, -- if the door is able to be lock breaked
        object = 2933656395,
        objCoords  = vector3(338.54, -670.71, 42.78),
        textCoords  = vector3(339.2535, -669.9486, 42.52114),
        name = "Garde chasse",
        objYaw = 329.958,
        locked = true,
        distance = 2.0
    },
    {
        authorizedJobs = { 'ranger' }, -- Garde chasse Lake
        authorizedItem = 'key',
        canlockbreak = true, -- if the door is able to be lock breaked
        object = 3238637478,
        objCoords  = vector3(347.44, -666.94, 42.74),
        textCoords  = vector3(346.10, -667.990, 42.74),
        name = "Garde chasse",
        objYaw = 239.803,
        locked = true,
        distance = 2.0
    },
	{
		authorizedJobs = { 'palefrenier_rh' }, -- doubles portes cote droite
		authorizedItem = 'cle_palefrenier_rh',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2311550261,
		object2 = 2311550261,
		objCoords  = vector3(1458.09, -1371.72, 78.85),
		textCoords  = vector3(1458.09, -1371.72, 78.85),
		name = "Porte Ecurie",
		objYaw = 153.9866,
		objYaw2 = 334.83,
		locked = true,
		distance = 1.0
	},
	{
		authorizedJobs = { 'docteur_rh' }, -- doubles portes cote droite
		authorizedItem = 'cle_docteur_rh',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 1601285,
		objCoords  = vector3(1370.2086181640625, -1310.0941162109375, 76.97604370117188),
		textCoords  = vector3(1369.813, -1309.61, 77.971),
		name = "Porte Docteur",
		objYaw = 153.9866,
		locked = false,
		distance = 2.0
	},
	{
		authorizedJobs = { 'saloon_bw' }, -- portes cote gauche
		authorizedItem = 'cle_saloon_bw',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2320881007,
		objCoords  = vector3(-809.79528808594,-1327.6036376953,42.687381744385),
		textCoords  = vector3(-810.374, -1327.73, 43.670),
		name = "Porte Saloon Blacwater gauche",
		objYaw = 179.61363220214844,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'saloon_bw' }, -- porte entrer saloon
		authorizedItem = 'cle_saloon_bw',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3311897912,
		object2 = 3526207172,
		objCoords  = vector3(-810.40985107422,-1320.7019042969,42.674785614014),
		textCoords  = vector3(-810.139, -1319.58, 43.668),
		name = "Entrer du Saloon Blackwater",
		objYaw = 89.70842742919922,
		objYaw2 = -89.96759796142578,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'saloon_bw' }, -- portes cote droite
		authorizedItem = 'cle_saloon_bw',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 2452247196,
		objCoords  = vector3(-810.45855712891,-1312.28515625,42.68346786499),
		textCoords  = vector3(-809.785, -1313.02, 43.668),
		name = "Porte Saloon Blackwater droite",
		objYaw = -90.35111236572266,
		locked = true,
		distance = 2.0
	},
	{
		authorizedJobs = { 'ranger_bw' }, -- portes cote droite
		authorizedItem = 'cle_ranger_bw',
		canlockbreak = true, -- if the door is able to be lock breaked
		object = 3268076220,
		objCoords  = vector3(-1976.1311035156,-1665.6566162109,117.19026947021),
		textCoords  = vector3(-1976.1311035156,-1665.6566162109,117.19026947021),
		name = "Porte Ranger",
		objYaw = 144.99996948242188,
		locked = true,
		distance = 2.0
	},
}