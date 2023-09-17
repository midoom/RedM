Config = {}

Webhooklink = "" --Place your webhook link here (If you do not want to use the webhook leave this like it is)

Config.converter = { --this is what registers the swapper/converter/unboxing part of the code
    {
        TakenItem = "paquet_cigarette", --This is the item it removes
        Amount = 1, --This is the amount of the item it removes
        GivenItems = {
            {
                name = "cigarette", --This is the item it gives
                count = 10 --The amount it gives
            },
        },
        webhookdesc = "1 Paquet de cigarette ouvert", --is the description displayed by the webhook
    }, --too add more just copy and paste this table changing what you need
    {
        TakenItem = "paquet_biscuit", --This is the item it removes
        Amount = 1, --This is the amount of the item it removes
        GivenItems = {
            {
                name = "biscuit", --This is the item it gives
                count = 10 --The amount it gives
            },
        },
        webhookdesc = "1 paquet de biscuit ouvert", --is the description displayed by the webhook
    }, --too add more just copy and paste this table changing what you need
    {
        TakenItem = "paquet_clou", --This is the item it removes
        Amount = 1, --This is the amount of the item it removes
        GivenItems = {
            {
                name = "clou", --This is the item it gives
                count = 10 --The amount it gives
            },
        },
        webhookdesc = "1 Paquet de clou ouvert", --is the description displayed by the webhook
    }, --too add more just copy and paste this table changing what you need
    {
        TakenItem = "pac_eau", --This is the item it removes
        Amount = 1, --This is the amount of the item it removes
        GivenItems = {
            {
                name = "eau", --This is the item it gives
                count = 6 --The amount it gives
            },
        },
        webhookdesc = "1 pack d eau ouvert", --is the description displayed by the webhook
    }, --too add more just copy and paste this table changing what you need
}

Config.crafting = { --Start of crafting/combiner config. If you do not want this feature then ignore this part
    {
        TakenItems = { --these are the items the script will remove
            {
                displayname = 'Water',
                name = "water", --name of item in database
                count = 2 --amount to remove
            },
            {
                displayname = 'Bonds',
                name = "bonds", --name of item in database
                count = 1 --amount to remove
            },
        },
        GivenItem = { --this is the item/items that will be added
            {
                displayname = 'Soft Wood', --display name of the item(This is what shows on the menu)
                name = "wood", --database name of item
                count = 1 --amaount to give the player
            },
        },
        webhookdesc = "Crafted an item. Used 2x Water and 1x Bonds to make 1x Wood", --text that will show in the webhook if you use webhook
    },  -- to add more just copy this table and past change what you need
    {
        TakenItems = {
            {
                displayname = 'Water',
                name = 'water',
                count = 1,
            },
        },
        GivenItem = {
            {
                displayname = "Hard Wood",
                name = 'hwood',
                count = 2,
            },
        },
        webhookdesc = "crafted an item",
    },
}

Config.Craftingcommand = 'hd_combiner' --This is what the command to open the crafting/combining menu will be

-----------------------------------------------Translate here!!---------------------------------------------------------------------
Config.Language = {
    Donothavetheitemsneeded = 'Vous n\'avez pas tous les éléments requis pour le créer !',
    Invalidamount = 'Montant saisi invalide ! L\'entrée doit être un nombre !',
    Itemcreated = 'Vous avez créé l\'article !',
    Notenoughitems = 'Vous n\'avez pas tous les éléments nécessaires pour créer cet article !',
    Mainmenuname = 'Combiner des éléments',
    Submenuname = 'Articles nécessaires pour combiner',
    Bottomtext = 'Fabriquer cet article ?',
    Itemshow = 'Vous avez besoin',
    Craftitembutton = 'Creer votre objet ?'
}