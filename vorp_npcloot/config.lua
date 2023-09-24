-- by outsider

Config = {}

--name of items like in the DB
------------------------ ITEMS -----------------------------------
Config.canreceiveItems = true
Config.receiveItem = 30 -- percentage out of 100

Config.items = {
    [1] = { name = "Water", label = "Water" }, --you get a random item from the list
    [2] = { name = "ammorepeaternormal", label = "ammo repeater normal" },
    [3] = { name = "ammoriflenormal", label = "ammo rifle normal" },
}


------------------------ MONEY -----------------------------------
Config.canreceiveMoney = true
Config.receiveMoney = 70 -- percentage out of 100

Config.money = {
    [1] = 10, -- you get a random amount from the list
    [2] = 3.5,
    [3] = 5,
}

------------------------ GOLD -----------------------------------
Config.canreceiveGold = true
Config.receiveGold = 5 -- percentage out of 100

Config.gold = {
    [1] = 1, --you get a random amount from the list
    [2] = 2,
    [3] = 3,
}

----------------------- WEAPONS --------------------------------------
Config.canreceiveWeapons = true
Config.receiveWeapon = 12 -- percentage out of 100
Config.weapons = {
    [1] = { name = "WEAPON_REVOLVER_CATTLEMAN", label = "Revolver cattleman" }, --you get a random weapon from the list
    [2] = { name = "WEAPON_REPEATER_CARBINE", label = "Repeater Carbine" },
    [3] = { name = "WEAPON_RIFLE_VARMINT", label = "Rifle Varmint" }
}
