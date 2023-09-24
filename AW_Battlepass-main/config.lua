Config = {}

Config.Locale  = "en" -- Please don't change the name and give credit to the developer
Config.Author  = 'AxelWarZ' -- Please don't change the name and give credit to the developer
Config.Name    = 'Valnera Battlepass' -- Please don't change the name and give credit to the developer
Config.Version = '2.0.1' -- Please don't change the name and give credit to the developer

Config.LevelUpCost = 50 -- Cost to unlock the next level

Config.levelRewardPacks    = {} -- Work in progress DO NOT TOUCH

Config.LevelsConfiguration = {
    {
        level = 1, -- Level Battlepass
        playedTimeRequired = 60, -- Play time required
        levelReward = {
            type = 'item', -- Type = item (items) - weapon (weapons) - money (type of money = dollars ) - gold (type of money = gold ) 
            reward = 'coal', -- name items in database
            amount = 25, -- amount received as a reward
            title = 'Coal', -- reward label
            description = '- 25X Coal', -- label description
            image = 'img/items/coal.png' -- path to the displayed image
        } 
    },
    {
        level = 2,
        playedTimeRequired = 90,
        levelReward = {
            type = 'weapon',
            reward = 'WEAPON_REVOLVER_CATTLEMAN',
            amount = 1,
            title = 'Revolver Cattleman',
            description = '- 1X Revolver Cattleman',
            image = 'img/items/WEAPON_REVOLVER_CATTLEMAN.png'
        } 
    },
    {
        level = 3,
        playedTimeRequired = 120,
        levelReward = {
            type = 'item',
            reward = 'coal',
            amount = 25,
            title = 'Coal',
            description = '- 25X Coal',
            image = 'img/items/coal.png'
        } 
    },
    {
        level = 4,
        playedTimeRequired = 150,
        levelReward = {
            type = 'item',
            reward = 'clay',
            amount = 25,
            title = 'Clay',
            description = '- 25X Clay',
            image = 'img/items/clay.png'
        } 
    },
    {
        level = 5,
        playedTimeRequired = 180,
        levelReward = {
            type = 'money',
            reward = 'money',
            amount = 500,
            title = 'Money',
            description = '- 500X Money',
            image = 'img/items/money.png'
        } 
    },
    {
        level = 6,
        playedTimeRequired = 210,
        levelReward = {
            type = 'item',
            reward = 'clay',
            amount = 25,
            title = 'Clay',
            description = '- 25X Clay',
            image = 'img/items/clay.png'
        } 
    },
    {
        level = 7,
        playedTimeRequired = 240,
        levelReward = {
            type = 'item',
            reward = 'coal',
            amount = 25,
            title = 'Coal',
            description = '- 25X Coal',
            image = 'img/items/coal.png'
        } 
    },
    {
        level = 8,
        playedTimeRequired = 270,
        levelReward = {
            type = 'money',
            reward = 'money',
            amount = 500,
            title = 'Money',
            description = '- 500X Money',
            image = 'img/items/money.png'
        } 
    },
    {
        level = 9,
        playedTimeRequired = 300,
        levelReward = {
            type = 'item',
            reward = 'clay',
            amount = 25,
            title = 'Clay',
            description = '- 25X Clay',
            image = 'img/items/clay.png'
        } 
    },
    {
        level = 10,
        playedTimeRequired = 360,
        levelReward = {
            type = 'money',
            reward = 'money',
            amount = 500,
            title = 'Money',
            description = '- 500X Money',
            image = 'img/items/money.png'
        } 
    },
}