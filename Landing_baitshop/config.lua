Config = {}

Config.NoInv = "Vous avez pas de poisson a vendre"
Config.NoMoney = "Vous avez pas assez d argent"
Config.Shoptext = 'Appuyer sur ~e~[E]~q~ pour VENDRE ou ~e~[G]~q~ pour ACHETER'
Config.Selltext = 'Vous avez vendu '
Config.Buytext = "Vous avez achete "
Config.Coords = {
	vector3(-1402.87,-2317.21,43.73),
	vector3(-757.442,-1361.02,43.728),
}

Config.Blips = {
	{x = -1402.87, y = -2317.21, z = 43.73},
	{x = -757.442, y = -1361.02, z = 43.728},
}

Config.FenceShop = {
	{
		['Text'] = "$1 - Appat a base de PAIN",
		['SubText'] = "Pas top mais peu toujours servir",
		['Desc'] = "Appat a base de PAIN",
		['Param'] = {
			['Price'] = 1,
			['Tipo'] = "p_baitBread01x",
			['Mens'] = "Appat a base de PAIN"
		}
	},
	{
		['Text'] = "$1 - Appat a base de FROMAGE",
		['SubText'] = "Les poissons adores l'odeur de se morceau de fromage",
		['Desc'] = "Appat a base de FROMAGE",
		['Param'] = {
			['Price'] = 1,
			['Tipo'] = "p_baitCheese01x",
			['Mens'] = "Appat a base de FROMAGE"
		}
	},
	{
		['Text'] = "$3 - Leurre de peche",
		['SubText'] = "Interressant pour du gros",
		['Desc'] = "Leurre qui imite un Poisson",
		['Param'] = {
			['Price'] = 3,
			['Tipo'] = "p_FinisdFishlure01x",
			['Mens'] = "Leurre qui imite un Poisson"
		}
	},
	{
		['Text'] = "$3 - Leurre de peche SPECIAL",
		['SubText'] = "Les poissons ni voit que du feu..",
		['Desc'] = "Leurre de peche SPECIAL",
		['Param'] = {
			['Price'] = 3,
			['Tipo'] = "p_finisdfishlurelegendary01x",
			['Mens'] = "Leurre SPECIAL qui imite un Poisson"
		}
	}
}

Config.Chatarra = {
	
	{
		['Text'] = "$5 - Poisson Lune (Petit)",
		['SubText'] = "",
		['Desc'] = "Poisson Lune (Petit)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishbluegil_01_sm",
			['Mens'] = "Poisson Lune (Petit)"
		}
	},
	{
		['Text'] = "$10 - Poisson Lune (Moyen)",
		['SubText'] = "",
		['Desc'] = "Poisson Lune (Moyen)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishbluegil_01_ms",
			['Mens'] = "Poisson Lune (Moyen)"
		}
	},
	{
		['Text'] = "$5 - Barbotte Jaune (Petit)",
		['SubText'] = "",
		['Desc'] = "Barbotte Jaune (Petit)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishbullheadcat_01_sm",
			['Mens'] = "Barbotte Jaune (Petit)"
		}
	},
	{
		['Text'] = "$10 - Barbotte Jaune (Moyen)",
		['SubText'] = "",
		['Desc'] = "Barbotte Jaune (Moyen)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishbullheadcat_01_ms",
			['Mens'] = "Barbotte Jaune (Moyen)"
		}
	},
	{
		['Text'] = "$5 - Brochet Maillé (Petit)",
		['SubText'] = "",
		['Desc'] = "Brochet Maillé (Petit)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishchainpickerel_01_sm",
			['Mens'] = "Brochet Maillé (Petit)"
		}
	},
	{
		['Text'] = "$10 - Brochet Maillé (Moyen)",
		['SubText'] = "",
		['Desc'] = "Brochet Maillé (Moyen)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishchainpickerel_01_ms",
			['Mens'] = "Brochet Maillé (Moyen)"
		}
	},
	{
		['Text'] = "$20 - Barbue de rivière (Extra)",
		['SubText'] = "",
		['Desc'] = "Barbue de rivière (Extra))",
		['Param'] = {
			['Price'] = 20,
			['Tipo'] = "a_c_fishchannelcatfish_01_xl",
			['Mens'] = "Barbue de rivière (Extra)"
		}
	},
	{
		['Text'] = "$15 - Barbue de rivière (Grand)",
		['SubText'] = "",
		['Desc'] = "Barbue de rivière (Grand)",
		['Param'] = {
			['Price'] = 15,
			['Tipo'] = "a_c_fishchannelcatfish_01_lg",
			['Mens'] = "Barbue de rivière (Grand)"
		}
	},
	{
		['Text'] = "$10 - Esturgeon jaune (Grand)",
		['SubText'] = "",
		['Desc'] = "Esturgeon jaune (Grand)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishlakesturgeon_01_lg",
			['Mens'] = "Esturgeon jaune (Grand)"
		}
	},
	{
		['Text'] = "$5 - Ecrevisse",
		['SubText'] = "",
		['Desc'] = "Ecrevisse",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "animal_crawfish",
			['Mens'] = "Ecrevisse"
		}
	},
	{
		['Text'] = "$15 - Perche noire (Grand)",
		['SubText'] = "",
		['Desc'] = "Perche noire (Grand)",
		['Param'] = {
			['Price'] = 15,
			['Tipo'] = "a_c_fishlargemouthbass_01_lg",
			['Mens'] = "Perche noire (Grand)"
		}
	},
	{
		['Text'] = "$10 - Perche noire (Moyen)",
		['SubText'] = "",
		['Desc'] = "SmallMouthBass Medium",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishlargemouthbass_01_ms",
			['Mens'] = "Perche noire (Moyen)"
		}
	},
	{
		['Text'] = "$10 - Lépisosté osseux (Grand)",
		['SubText'] = "",
		['Desc'] = "Lépisosté osseux (Grand)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishlongnosegar_01_lg",
			['Mens'] = "Lépisosté osseux (Grand)"
		}
	},
	{
		['Text'] = "$10 - Maskinongé (Grand)",
		['SubText'] = "",
		['Desc'] = "Maskinongé (Grand)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishmuskie_01_lg",
			['Mens'] = "Maskinongé (Grand)"
		}
	},
	{
		['Text'] = "$10 - Brochet (Grand)",
		['SubText'] = "",
		['Desc'] = "Brochet (Grand)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishnorthernpike_01_lg",
			['Mens'] = "Brochet (Grand)"
		}
	},
	{
		['Text'] = "$10 - Perche (Moyen)",
		['SubText'] = "",
		['Desc'] = "Perche (Moyen)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishperch_01_ms",
			['Mens'] = "Perche (Moyen)"
		}
	},
	{
		['Text'] = "$5 - Perche (Petit)",
		['SubText'] = "",
		['Desc'] = "Perche (Petit)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishsmallmouthbass_01_ms",
			['Mens'] = "Perche (Petit)"
		}
	},
	{
		['Text'] = "$15 - Truite arc-en-ciel (Grand)",
		['SubText'] = "",
		['Desc'] = "Truite arc-en-ciel (Grand)",
		['Param'] = {
			['Price'] = 15,
			['Tipo'] = "a_c_fishrainbowtrout_01_lg",
			['Mens'] = "Truite arc-en-ciel (Grand)"
		}
	},
	{
		['Text'] = "$10 - Truite arc-en-ciel (Moyen)",
		['SubText'] = "",
		['Desc'] = "Truite arc-en-ciel (Moyen)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishrainbowtrout_01_ms",
			['Mens'] = "Truite arc-en-ciel (Moyen)"
		}
	},
	{
		['Text'] = "$10 - Crapet de roche (Moyen)",
		['SubText'] = "",
		['Desc'] = "Crapet de roche (Moyen)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishrockbass_01_ms",
			['Mens'] = "Crapet de roche (Moyen)"
		}
	},
	{
		['Text'] = "$5 - Crapet de roche (Petit)",
		['SubText'] = "",
		['Desc'] = "Crapet de roche (Petit)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishrockbass_01_sm",
			['Mens'] = "Crapet de roche (Petit)"
		}
	},
	{
		['Text'] = "$15 - Saumon rouge (Grand)",
		['SubText'] = "",
		['Desc'] = "Saumon rouge (Grand)",
		['Param'] = {
			['Price'] = 15,
			['Tipo'] = "a_c_fishsalmonsockeye_01_lg",
			['Mens'] = "Saumon rouge (Grand)"
		}

	},
	{
		['Text'] = "$10 - Saumon rouge (Moyen-Grand)",
		['SubText'] = "",
		['Desc'] = "Saumon rouge (Moyen-Grand)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishsalmonsockeye_01_ml",
			['Mens'] = "Saumon rouge (Moyen-Grand)"
		}

	},
	{
		['Text'] = "$5 - Saumon rouge (Petit)",
		['SubText'] = "",
		['Desc'] = "Saumon rouge (Petit)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishsalmonsockeye_01_ms",
			['Mens'] = "Saumon rouge (Petit)"
		}

	},
	{
		['Text'] = "$10 - Achigan à petite bouche (Grand)",
		['SubText'] = "",
		['Desc'] = "Achigan à petite bouche (Grand)",
		['Param'] = {
			['Price'] = 10,
			['Tipo'] = "a_c_fishsmallmouthbass_01_lg",
			['Mens'] = "Achigan à petite bouche (Grand)"
		}
	},
	{
		['Text'] = "$5 - Achigan à petite bouche (Moyen)",
		['SubText'] = "",
		['Desc'] = "Achigan à petite bouche (Moyen)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishsmallmouthbass_01_ms",
			['Mens'] = "Achigan à petite bouche (Moyen)"
		}
	},
	{
		['Text'] = "$5 - Brochet d Amérique (Petit)",
		['SubText'] = "",
		['Desc'] = "Brochet d Amérique (Petit)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishredfinpickerel_01_sm",
			['Mens'] = "Brochet d Amérique (Petit)"
		}
	},
	{
		['Text'] = "$10 - Brochet d Amerique (Moyen)",
		['SubText'] = "",
		['Desc'] = "Brochet d Amerique (Moyen)",
		['Param'] = {
			['Price'] = 5,
			['Tipo'] = "a_c_fishbluegil_01_sm",
			['Mens'] = "Brochet d Amerique (Moyen)"
		}
	}
}