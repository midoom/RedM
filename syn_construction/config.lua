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

Config.constructioncompany = {
    blackwater = {
        Pos = {x = -835.059, y = -1259.07, z = 43.617, h = 98.205}, -- location
		blipsprite = 2107754879, -- blip sprite 
        showblip = true, -- show blip or not 
        Name = 'Blackwater Construction', -- blip name 
        npcmodel = "U_M_M_CKTManager_01",
    },
    val = {
        Pos = {x= -339.6, y=796.82, z=116.6, h = 150.07}, -- location 
		blipsprite = 2107754879, -- blip sprite 
        showblip = true, -- show blip or not 
        Name = 'Valentine Construction', -- blip name 
        npcmodel = "U_M_M_CKTManager_01",
    },
}

Config.missions = {
    blackwater = {
        materialpickup = {x= -841.58, y=-1260.55, z=43.48},
        reward = 1, -- depending on tasks done and if the player failed skill checks
        workspots = {
            {x= -839.8, y=-1272.8, z=43.4, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -859.38, y=-1245.66, z=43.48, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -828.18, y=-1276.55, z=43.66, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -841.38, y=-1240.8, z=43.59, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
        }
    },
    val = {
        materialpickup = {x= -338.27, y=820.2, z=117.52},
        reward = 1, 
        workspots = {
            {x= -361.40, y=792.8, z=116.19, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -324.77, y=809.84, z=117.40, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -294.33, y=826.015, z=119.7, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -301.95, y=845.45, z=119.88, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},

            {x= -313.52, y=737.87, z=117.9, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -266.80, y=742.8, z=117.44, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -234.89, y=771.425, z=117.88, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},
            {x= -232.97, y=748.85, z=117.74, wa= 'PROP_HUMAN_REPAIR_WAGON_WHEEL_ON_SMALL'},

        }
    },

}

Config.Language = {
constructionmenu = "Appuyer sur G",
construction = "Construction",
startjob = "Commencer le travaille",
trust = "Trust: ",
marked = "Aller a l'emplacement marque",
pickup = "Ramasser le matériel",
pressgtopickup = "Appuyer sur G pour prendre votre materiel",
dosomework = "Lieu de travail",
startconst = "Appuyer sur G pour commencer la construction",
finishedtasks = "Terminé votre travail pour la journée, retournez voir le contremaître",
finishwork = "Arreter de travailler",
messedup = "Vous avez rate la tâche",
paid = "Vous avez été payé $ ",
nowork = "Vous n'avez pas fait assez de travail pour être payé",
}



------------exports["syn_minigame"]:taskBar(1200,7)