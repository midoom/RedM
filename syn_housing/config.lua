Config = {}

Config.vorp = true -- dont change 

Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["ENTER"] = 0xC7B5340A,
    ["DOWN"] = 0x05CA7C52,
    ["SHIFT"] = 0x8FFC75D6,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
    ["RIGHTBRACKET"] = 0xA5BDCD3C,
    ["LEFTBRACKET"] = 0x430593AA,
    ["BACKSPACE"] = 0x156F7119,
    ["ALT"] = 0x8AAA0AD4,
    ["CTRL"] = 0xDB096B85,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
}
Config.metadata = true -- set to true when using meta data inventory update 


Config.debug = false -- script is not supposed to be restarted on live server. put this to true if u want to restart script
Config.taxledger = true -- taxes will be taken from a special ledger that only allows players to deposit their tax amount and nothing more, use this to avoid houses that never go on sale because players put alot of money in their tax ledger and left the server
Config.renderdistance = 50
Config.timedupdate = 30 -- update db every 30 minutes
Config.bucketblock = 9959
-- this script requires syn_instancebucket to work correctly. 
Config.anticrashloop = true -- redm has an issue with exiting routing bucket. turn this to true if u have trouble crashing when exiting motel rooms
Config.furnitureitems = true -- turn to true if you want furniture to be items instead of having a buy furniture menu
Config.maxhouses = 1  -- max number of houses player can own (motels excluded)

Config.command = "createhouse" -- command to createhouses
Config.synsociety = true -- turn true only if using syn_society. make sure realestate job is registered in society config and in relevant databases, this is used to deposit money into the mentioned society
Config.synsocietyjob ="realestate" -- you can use this to allow for job creation by people with this job(does not require syn society)
Config.synsocietyjobrank = 2 -- minimum job rank to allow deletion of created houses (houses on sale can be deleted, owned houses cannot)(does not require syn society)
Config.sellpercentage = { -- percentages below will by multiplyed by sale price and result will be given to relevant party as mentioned below. make sure the total percentages amount does not go over 1
-- anything less than 1 the remaining money gets deleted from server. this is good to fight inflation of currency 
seller = 0.5, -- person selling the house agent or player, set to 0 if you dont want money to go to people. this also stops people from receving money for selling their homes.
society = 0.3, -- realestate society only use if syn_society is toggled on above and you own syn society. set to 0 if you dont want money to go to society
} -- in this case 50% of sale price goes to seller, 30% goes to society, 20% gets deleted from the server and goes to no one.

Config.teleporterhouses = { -- use your own mlos to make teleporter homes the ones below are just examples
    ["Penthouse"] = {location = {x=2816.0, y=-1232.49, z=21.18}},
    ["Gunsmith"] = {location = {x=-757.9, y=-1315.6, z=23.73}},
    ["Office"] = {location = {x=-790.6, y=-1352.1, z=23.67}},
    ["News Office"] = {location = {x=2623.98, y=-1338.3, z=50.16}},
    ["Law Office"] = {location = {x=-291.2, y=782.9, z=98.5}},
    ["Lodge"] = {location = {x=-1439.45, y=-2275.24, z=44.0}},
    ["Bar"] = {location = {x=-1408.99, y=-2318.08, z=23.6}},
    ["Breakroom"] = {location = {x=-278.6, y=811.0, z=122.6}},
}

Config.Locations = { -- money for houses bought goes here. sellers have it to collected from here. 
    Valentine = {	   -- you can add more job centers by copy pasting this 
        Pos = {x=-180.54, y=634.79, z=114.08}, -- location of job center 
        blipsprite = -1656531561, -- blip sprite for job center
		Name = 'Sold Home Ledger', -- blip name 
    },
}

Config.motellocation = { 
    Valentine = {
        PosEntrance = {x=-322.14, y=767.47, z=121.63}, 
        PosExit = {x=-323.707, y=767.1247, z=121.5827}, 
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Valentine Motel', -- blip name 
        price = 20, -- price to buy room
        inventorylimit = 100
    },

    Armadillo = {
        PosEntrance = {x=-3666.34, y=-2600.93, z=-13.5}, 
        PosExit = {x=-323.707, y=767.1247, z=121.5827}, 
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Armadillo Motel', -- blip name 
        price = 20, -- price to buy room
        inventorylimit = 100
    },
    bw = {
        PosEntrance = {x=-790.3, y=-1264.22, z=43.6}, 
        PosExit = {x=-323.707, y=767.1247, z=121.5827}, 
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Blackwater Motel', -- blip name 
        price = 20, -- price to buy room
        inventorylimit = 100
    },
    strawberry = {
        PosEntrance = {x=-1831.3, y=-401.44, z=162.23}, 
        PosExit = {x=-323.707, y=767.1247, z=121.5827}, 
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Strawberry Motel', -- blip name 
        price = 20, -- price to buy room
        inventorylimit = 100
    },
    rhodes = {
        PosEntrance = {x=1343.5, y=-1301.3, z=77.4}, 
        PosExit = {x=-323.707, y=767.1247, z=121.5827}, 
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Rhodes Motel', -- blip name 
        price = 20, -- price to buy room
        inventorylimit = 100
    },
    sd = {
        PosEntrance = {x=2593.6, y=-1163.8, z=53.53}, 
        PosExit = {x=-323.707, y=767.1247, z=121.5827}, 
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Saint Denis Motel', -- blip name 
        price = 20, -- price to buy room
        inventorylimit = 100
    },
    annes = {
        PosEntrance = {x=2911.58, y=1325.57, z=45.1}, 
        PosExit = {x=-323.707, y=767.1247, z=121.5827}, 
        PosChangingroom = {x=-326.82, y=764.62, z=122.0866}, 
        PosInventory = {x=-325.4, y=767.02, z=122.0866}, 
        blipsprite = 1116438174, -- blip sprite for motel
        Name = 'Annesburg Motel', -- blip name 
        price = 20, -- price to buy room
        inventorylimit = 100
    },
}
-------------------------------------------------------------------
Config.Storageupgrades = {  -- when building houses make sure u set their inventory limit to allow them to have the quantity of items below otherwise they wont be able to upgrade because the inventory cant 
-- hold the items. the storage upgrade system checks to see if the house inventory has the required items below to make the upgrade
    Upgrade1 = {	   
        num = 1, -- always use a number make sure each subsequent number is an addition by 1 not more, and make sure its not repeated.
        title = "Upgrade 1", 
        materials = {
            item1 = {name = "nails", label = "nails", amount = 5},
            item2 = {name = "wood",label = "wood", amount = 10},
            item3 = {name = "clay",label = "clay", amount = 5},
        }, 
		slotamount = 25,  
    },
    Upgrade2 = {	   
        num = 2, 
        title = "Upgrade 2", 
        materials = {
            item1 = {name = "nails",label = "nails", amount = 10},
            item2 = {name = "wood",label = "wood", amount = 20},
            item3 = {name = "clay",label = "clay", amount = 5},
        }, 
		slotamount = 25,  
    },
    Upgrade3 = {	   
        num = 3, 
        title = "Upgrade 3", 
        materials = {
            item1 = {name = "nails",label = "nails", amount = 15},
            item2 = {name = "hwood",label = "hard wood", amount = 25},
            item3 = {name = "clay",label = "clay", amount = 5},
        }, 
		slotamount = 50,  
    },
    Upgrade4 = {	   
        num = 4, 
        title = "Upgrade 4", 
        materials = {
            item1 = {name = "nails",label = "nails", amount = 15},
            item2 = {name = "wooden_boards",label = "wooden boards", amount = 15},
            item3 = {name = "rock",label = "rock", amount = 20},
        }, 
		slotamount = 100,  
    },
    Upgrade5 = {	   
        num = 5, 
        title = "Upgrade 5", 
        materials = {
            item1 = {name = "nails",label = "nails", amount = 25},
            item2 = {name = "wooden_boards",label = "wooden boards", amount = 25},
            item3 = {name = "rock",label = "rock", amount = 25},
        }, 
		slotamount = 100,  
    },
    Upgrade6 = {	   
        num = 6, 
        title = "Upgrade 6", 
        materials = {
            item1 = {name = "nails",label = "nails", amount = 25},
            item2 = {name = "wooden_boards",label = "wooden boards", amount = 25},
            item3 = {name = "hwoodboard",label = "hard wood boards", amount = 10},
        }, 
		slotamount = 200,  
    },
    Upgrade7 = {	   
        num = 7, 
        title = "Upgrade 7", 
        materials = {
            item1 = {name = "nails",label = "nails", amount = 25},
            item2 = {name = "wooden_boards",label = "wooden boards", amount = 25},
            item3 = {name = "hwoodboard",label = "hard wood boards", amount = 25},
        }, 
		slotamount = 200,  
    },
    Upgrade8 = {	   
        num = 8, 
        title = "Upgrade 8", 
        materials = {
            item1 = {name = "nails",label = "nails", amount = 25},
            item2 = {name = "barrel",label = "barrel", amount = 10},
            item3 = {name = "hwoodboard",label = "hard wood boards", amount = 5},
        }, 
		slotamount = 300,  
    },
}

Config.housebliphash = -2024635066 -- unowned
Config.ownedhouseblip = -235048253 -- owned
Config.showblipsforsale = true  -- show blips for houses on sale 

------------------------------------------
-- only set one of those true 

Config.monthlyrepo = true
Config.repotime ={ -- day, hour, and minute of monthly repo of houses. when the server time matches these values. houses that dont have money in their ledger = or more than the tax rate of the house will 
-- go on sale and their owner will lose their ownership. these houses will be marked as repoed and when bought the money spend on buying them will go to no one.
    day = 15,
    hour = 6,
    minute = 10
} 
Config.weeklyrepo = false
Config.repotime2 ={ -- day, hour, and minute of monthly repo of houses. when the server time matches these values. houses that dont have money in their ledger = or more than the tax rate of the house will 
-- go on sale and their owner will lose their ownership. these houses will be marked as repoed and when bought the money spend on buying them will go to no one.
    day1 = 3,
    day2 = 10,
    day3 = 17,
    day4 = 24,
    hour = 6,
    minute = 10
} 


Config.furniturelimit = 100
Config.furnituresellrate = 1.0 -- this is the rate at which furniture will sell for if ur not using furniture as items 

Config.furniture = { -- you can add more furniture by following the format and getting the hashes from http://rdr2.mooshe.tv/, use Model Hash (Signed)
-- i only added a few, fill them up with the items you like
    ["Chairs"] = {
        ["Wood Chair"] = { cost = 10, hash = 325252933, item = "woodchair"},
        ["Leather Chair"] = { cost = 10, hash = 805425957, item = "leatherchair"},

    },
    ["Tables"] = {
	    ["Round Table"] = { cost = 20, hash = 1070917324, item = "roundtable"},
        ["Table"] = { cost = 20, hash = 85453683, item = "normaltable"},
        ["Rectangle Table"] = { cost = 20, hash = 1287780262, item = "rectable"},
		["Timber Table"] = { cost = 20, hash = 1624513686, item = "timbertable"},

    },
    ["Fires"] = {
        ["Crafting Fire"] = { cost = 25, hash = -1279776992, item = "craftingfire"},
        ["Pot"] = { cost = 25, hash = 174418135, item = "pota"},

    },
	 ["Decor"] = {
        ["Water Pump"] = { cost = 500, hash = -40350080, item = "waterpump"},
        ["Flower Boxes"] = { cost = 5, hash = 456717314, item = "flowerboxes"},
        ["Coffin Decor"] = { cost = 5, hash = 1373121931, item = "coffindecor"},
		["Deer Pelt"] = { cost = 10, hash = -944201792, item = "deerpelt"},
		["Coyote Pelt"] = { cost = 10, hash = -1156281048, item = "coyotepelt"},

		["Blanket Box"] = { cost = 5, hash = -542120195, item = "blanketbox"},
        ["Gun Barrel"] = { cost = 10, hash = 187048082, item = "gbarrelx"},
		["Apple Barrel"] = { cost = 5, hash = -156060815, item = "applebarrel"},
		["Apple Basket"] = { cost = 5, hash = 86968515, item = "applebasket"},
        ["Food Barrel"] = { cost = 5, hash = -589926798, item = "foodbarrel"},
		["Wash Tub"] = { cost = 5, hash = 768802576, item = "washtub"},
		["Clothes Line"] = { cost = 5, hash = -25978087, item = "clothesline"},
		["Tool Barrel"] = { cost = 10, hash = -462883214, item = "toolbarrel"},
		["Coyote Taxidermy"] = { cost = 25, hash = 755719297, item = "coyotetaxi"},
		["Pheasant Taxidermy"] = { cost = 10, hash = -139659644, item = "phestaxi"},
		["Deer Taxidermy"] = { cost = 15, hash = 270188936, item = "deertaxi"},
		["Cougar Taxidermy"] = { cost = 30, hash = 106531847, item = "cougartaxi"},
		["Vulture Taxidermy"] = { cost = 10, hash = 1751914218, item = "vulturetaxi"},

    },
	 ["Benches"] = {
        ["Bear Bench"] = { cost = 30, hash = -191845882, item = "bearbench"},
        ["Log Bench 1"] = { cost = 10, hash = -359794697, item = "logbench"},
		["Log Bench 2"] = { cost = 10, hash = 861210780, item = "logbechs"},
		["Cloth Bench"] = { cost = 15, hash = 964931263, item = "clothbench"},
		["Wooden Bench"] = { cost = 20, hash = 1057555344, item = "woodbench"},
		["Wicker Bench"] = { cost = 25, hash = 1220939063, item = "wickerbench"},

    },
    ["Dresser"] = {
        ["brown wood"] = { cost = 25, hash = 614869605, item = "bwdresser"},
        ["brown mirror"] = { cost = 35, hash = -565436466, item = "bmdresser"},
		["night stand"] = { cost = 20, hash = -154796631, item = "nightstand"},
		["side table 1"] = { cost = 15, hash = 335118833, item = "sidetable"},
		["side table 2"] = { cost = 15, hash = -96741014, item = "sidetablea"},
		["side table 3"] = { cost = 15, hash = 341544623, item = "sidetableb"},
		
    },
    ["Chests"] = {
        ["chest 1"] = { cost = 50, hash = -576101586, item = "chesta"},
        ["chest 2"] = { cost = 50, hash = 370527842, item = "chestb"},
		
    },
    ["Lights"] = {
        ["Lantern"] = { cost = 10, hash = 319326044, item = "lanterna"},
        ["Dbl Candle"] = { cost = 5, hash = 1443543434, item = "dbcandle"},
        ["Candle"] = { cost = 5, hash = 526843578, item = "candlea"},
        ["Small Melted Candle"] = { cost = 5, hash = -1200234060, item = "smallmcandle"},
        ["Bottle Candle"] = { cost = 5, hash = -1012195445, item = "bcandle"},
		
    },
	["Beds"] = {
	    ["Old bed"] = { cost = 10, hash = -335869017, item = "obed"},
        ["bunk bed"] = { cost = 20, hash = -661790979, item = "bunkbed"},
		["single bed"] = { cost = 30, hash = 1190865994, item = "singlebed"},
        ["fancy double"] = { cost = 50, hash = 204817984, item = "fancydouble"},
		
    },
}
---------------------------------------------------------
Config.Language = {
	["qt"] = "Invalid quantity",
    ["carry"] = "You cant carry more items",
    ["limit"] = "You reached the limit for this item",
    ["maxslots"] = "your house cant store more items, slot limit is ",	
    ["aimingatdoor"] = "Press ~e~G~q~ While Aiming at Door",	
    ["nodoorhouse"] = "Press ~e~B~q~ To Create A No Door House",
    ["createhousecancel"] = "Type ~e~/createhouse~q~ To Cancel & Exit",	
    ["pressenterconfirm"] = "Press ~e~Enter~q~ To Confirm",
    ["uparrowicon"] = "Press ~e~Up Arrow~q~ To Move Icon",
    ["downarrowicon"] = "Press ~e~Down Arrow~q~ To Move Icon",
    ["rightarrowicon"] = "Press ~e~Right Arrow~q~ To Move Icon",
    ["leftarrowicon"] = "Press ~e~Left Arrow~q~ To Move Icon",
    ["bracketrighticon"] = "Press ~e~]~q~ To Move Icon",
    ["bracketlefticon"] = "Press ~e~[~q~ To Move Icon",
    ["confirm"] = "Confirm",
    ["outofrange"] = "~e~Out Of Range~q~",
    ["fourtocancel"] = "Press ~e~4~q~ To Cancel & Exit item placement",
    ["gitemplace"] = "Press ~e~G~q~ To place item into place",
    ["bonground"] = "Press ~e~B~q~ To place item on Ground Properly",
    ["changemoverate"] = "Press ~e~3~q~ To Change item movement rate",
    ["rotateitem1"] = "Press ~e~1~q~ To Rotate Item",
    ["rotateitem2"] = "Press ~e~2~q~ To Rotate Item",
    ["moveitem1"] = "Press ~e~Up Arrow~q~ To Move Item",
    ["moveitem2"] = "Press ~e~Down Arrow~q~ To Move Item",
    ["moveitem3"] = "Press ~e~Right Arrow~q~ To Move Item",
    ["moveitem4"] = "Press ~e~Left Arrow~q~ To Move Item",
    ["moveitem5"] = "Press ~e~]~q~ To Move Item",
    ["moveitem6"] = "Press ~e~[~q~ To Move Item",
    ["changerateinfo"] = "Change Rate Of Each Press (0.5) default, max is 5",
    ["set"] = "Set",
    ["notset"] = "Not Set",
    ["furnilimit"] = "You Cant Have More Furniture, the limit is ",
    ["createhousemenu"] = "Create House Menu",
    ["buyhouse"] = "Buy House",
    ["managehouse"] = "Manage House",
    ["soldhomeledger"] = "Sold Home Ledger",
    ["buyfurni"] = "Buy Furniture",
    ["changingroom"] = "Wardrobe",
    ["setupprimdoor"] = "Primary Door Setup",
    ["extradoorsetup"] = "Extra Doors Setup",
    ["aresure"] = "Are You Sure?",
    ["upstore"] = "Upgrade Storage",
    ["furni"] = "Furniture",
    ["furnicata"] = "Furniture Catagory",
    ["sellfurni"] = "Sell Furniture",
    ["keyholders"] = "Key Holders",
    ["ledger"] = "Ledger",
    ["cancel"] = "Cancel",
    ["yes"] = "Yes",
    ["no"] = "No",
    ["setupprimodoor"] = "Set Up Primary Door : ",
    ["setupotherdoors"] = "Set Up Other Doors",
    ["range"] = "Furniture Range: ",
    ["furnirange"] = "Furniture Range",
    ["taxrate"] = "Tax Rate: ",
    ["taxrate2"] = "Tax Rate",
    ["price"] = "Price",
    ["doorname"] = "Door Name: ",
    ["changedooriconloc"] = "Change Door Icon Location",
    ["confirmdoor"] = "Confirm Door",
    ["addadoor"] = "Add a Door",
    ["returntomainmenu"] = "Return to Main Menu",
    ["otherdoor"] = "Other Door",
    ["addeditdoor"] = "Add a Door",
    ["inventoryspace"] = "Inventory Space",
    ["delhouse"] = "Remove House",
    ["houseid"] = "House ID : ",
    ["givekey"] = "Give Keys",
    ["id"] = "ID",
    ["takekey"] = "Take Keys",
    ["setchangeroomloc"] = "Set Changing Room Location",
    ["setinvloc"] = "Set Inventory Location",
    ["sellhouse"] = "Sell House",
    ["furni"] = "Furniture",
    ["price2"] = " / Price: ",
    ["cost2"] = " / Cost: ",
    ["increaseby"] = " / Increase by: ",
    ["ledgercash"] = "Ledger Cash: ",
    ["dollar"] = " $",
    ["ledgerdepo"] = "Ledger Deposit",
    ["tooclose"] = "someone is too close",
    ["ledgerwithdraw"] = "Ledger Withdraw",
    ["soldhouseid"] = "Sold House ID: ",
    ["profit"] = " / Profit: ",
    ["nooutfits"] = "no outfits",
    ["house"] = "House",
    ["presstobuy"] = "Buy House",
    ["presstomanage"] = "Manage House",
    ["pressforchangingroom"] = "Wardrobe",
    ["pressforinvent"] = "Inventory",
    ["pressforsold"] = "Press ~e~G~q~ For Sold Houses Ledger",
    ["presstoexit"] = "Exit",
    ["presstobuyroom"] = "Buy A Room",
    ["presstoaccess"] = "Enter",
    ["presstochangechangingroom"] = "Press ~e~G~q~ to save changing room location",
    ["presstochangeinv"] = "Press ~e~G~q~ to save inventory location",
    ["changingset"] = "Changing Room Location Set",
    ["invset"] = "Inventory Location Set",
    ["outofhouserange"] = "Out Of House Range",
    ["youcreatedhouse"] = "You Created a House",
    ["boughthome"] = "You Bought A Home",
    ["cantaffordhome"] = "You Cant Afford This House",
    ["puthomeforsale"] = "You put a house up for sale",
    ["youdepo"] = "You Deposited ",
    ["intoledger"] = " $ into ledger",
    ["intoledger2"] = " $ into tax ledger",
    ["cantdepo"] = "You Cant Afford This Deposite",
    ["youwith"] = "You Withdrew ",
    ["fromledger"] = " $ from ledger",
    ["yougot"] = "You got ",
    ["forsold"] = " $ for Your Sold House",
    ["youdelh"] = "You Deleted House: ",
    ["homtax1h"] = "~e~Home Tax Collection in 1 hour~q~",
    ["makesure"] = "~e~Make Sure Your Home Ledger Has Enoguh Money To Pay Tax~q~",
    ["youupped"] = "You Upgraded Your House Inventory Space",
    ["nomat"] = "You Dont Have Enough Material In Your House Inventory For This Upgrade",
    ["cantaffitem"] = "You Cant Afford This Item",
    ["gotitem"] = "You Bought The Item",
    ["itemsoldfor"] = "You Sold The Item for ",
    ["gavekeysto"] = "You Gave Keys to ",
    ["gotkeys"] = "You Recieved a House Key",
    ["alreadykeys"] = "You Already Have Keys",
    ["wrongid"] = "Already has Keys or wrong id",
    ["takekeysfrom"] = "You Took House Keys From ",
    ["motelroomcantafford"] = "You Cant Afford This Motel it costs ",
    ["nosold"] = "No Sold Houses", 
    ["hsfrsale"] = "House For Sale", 
    ["mehome"] = "My Home", 
    ["menuinuse"] = "Menu is in use",
    ["nokeys"] = "You Dont have keys",
    ["nosuchuser"] = "No Such user",
    ["doorlock"] = "Doorlock",
    ["open"] = "open",
    ["motel"] = "Motel",
    ["cantownmore"] = "Cant own more houses max: ",
    ["taxledger"] = "Tax Ledger: $",
    ["taxledger2"] = "Deposit money into your tax ledger. this ledger only allows you to deposit",
    ["cantdepomore"] = "Cant Deposit more than Tax amount: $",
    ["placefurniture"] = "Place Furniture",
    ["removefurni"] = "Remove Furniture",
    ["cantcarry"] = "You Cant Carry More Items",
    ["gotbackitem"] = "You Withdrew the item: ",
    ["furnicantremove"] = "cant get back item",
    ["nodoorhouse2"] = "No Door House",
    ["telehouse"] = "Teleporter House",
    ["typeoftele"] = "Type of teleport: ", 
    ["enterhouse"] = "Enter House",
    ["exithouse"] = "Exit",
    ["knockprompt"] = "Knock Door",
    ["allowinprompt"] = "Allow in",
    ["declineprompt"] = "Ignore",
    ["doorknocked"] = "Door is knocking",
}
---------------------------------------------------------