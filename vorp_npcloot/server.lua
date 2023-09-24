local VORPcore = {}
local Inventory
local money = Config.money
local gold = Config.gold

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

Inventory = exports.vorp_inventory:vorp_inventoryApi()





function Keysx(table)
    local keys = 0
    for k, v in pairs(table) do
        keys = keys + 1
    end
    return keys
end

RegisterServerEvent('vorp:npcloot:give_reward')
AddEventHandler('vorp:npcloot:give_reward', function()
    local _source = source
    local chance = math.random(1, 100)
    local Character = VORPcore.getUser(_source).getUsedCharacter

    if Config.canreceiveWeapons then
        if chance < Config.receiveWeapon then

            local ammo = { ["nothing"] = 0 }
            local components = {}
            local reward1 = {}

            for k, v in pairs(Config.weapons) do
                table.insert(reward1, v)
            end
            local chance1 = math.random(1, Keysx(reward1))

            TriggerEvent("vorpCore:canCarryWeapons", tonumber(_source), 1, function(canCarry)
                if canCarry then

                    Inventory.createWeapon(_source, reward1[chance1].name, ammo, components)
                    TriggerClientEvent("vorp:TipRight", _source, "You got " .. reward1[chance1].label, 3000)
                else
                    TriggerClientEvent("vorp:TipRight", _source, "You can't carry any more WEAPONS", 3000)
                end


            end)



        end
    end


    if Config.canreceiveMoney then
        if chance < Config.receiveMoney then
            local item_type = math.random(1, #money)
            Character.addCurrency( 0, money[item_type])
            TriggerClientEvent("vorp:ShowAdvancedRightNotification", _source, "you got " .. money[item_type] .. "$", "mp_lobby_textures", "leaderboard_cash", "COLOR_PURE_WHITE", 4000)
        end
    end

    if Config.canreceiveGold then
        if chance < Config.receiveGold then
            local item_type = math.random(1, #gold)
            Character.addCurrency( 1, gold[item_type])
            TriggerClientEvent("vorp:ShowAdvancedRightNotification", _source, "you got " .. gold[item_type] .. " nugget.", "generic_textures", "tick", "COLOR_PURE_WHITE", 4000)
        end
    end


    if Config.canreceiveItems then
        if chance < Config.receiveItem then

            local reward = {}

            for k, v in pairs(Config.items) do
                table.insert(reward, v)
            end
            local chance2 = math.random(1, Keysx(reward))
            local count = 1
            TriggerEvent("vorpCore:canCarryItems", tonumber(_source), count, function(canCarry)
                TriggerEvent("vorpCore:canCarryItem", tonumber(_source), reward[chance2].name, count, function(canCarry2)
                    if canCarry and canCarry2 then
                        Inventory.addItem(_source, reward[chance2].name, count)
                        TriggerClientEvent("vorp:TipRight", _source, "You got " .. reward[chance2].label, 3000)
                    else
                        TriggerClientEvent("vorp:TipRight", _source, "You can't carry any more " .. reward[chance2].label, 3000)
                    end
                end)
            end)


        end
    end
end)
