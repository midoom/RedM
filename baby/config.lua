Config = {}
Config.vorp = true
Config.redm = false

Config.Prompts = {
    Title = "Baby",
    StopPrompt = 0x5966D52A,
    StopName = "Stop",
}

Config.Baby = {
    model = GetHashKey("prop_stuntdoll_01"),
    anim = {"amb_rest_sit@prop_human_seat_bench@parasol@female_a@wip_base", "wip_base"},
    male = {
        Attach = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        BoneIndex = 302,
    },
    female = {
        Attach = {0.0, 0.0, -0.20, 0.0, 0.0, 0.0},
        BoneIndex = 366,
    },
}


Config.Messages = {
    Title = "Baby",
    NoCalu = "Enjoy!",
}

--[[
    Items for redemrp_inventory 2.0
    ["calumet"] =
    {
        label = "calumet",
        description = "A calumet",
        weight = 1.0,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 1,
        imgsrc = "items/calumet.png",
        type = "item_standard",
    },
]]
