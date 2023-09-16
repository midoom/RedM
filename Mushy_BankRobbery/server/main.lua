VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


Locations = {
    vector3(1290.0882568359, -1312.4019775391, 76.039939880371),
}

RegisterServerEvent('mushy_robbery:talk')
AddEventHandler('mushy_robbery:talk', function()
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        TriggerClientEvent("vorp:TipBottom", _source, "JOHN: Salut, j'ai un petit job pour toi ", 5000)
		Citizen.Wait(5000)
        TriggerClientEvent("vorp:TipBottom", _source, "JOHN: Faire sauté la banque de Rhodes", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent("vorp:TipBottom", _source, "JOHN: Si cela t'interresse je te fournis 1 paquet de dynamite pour 300$ ", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent("vorp:TipBottom", _source, "JOHN: Tu veux le faire ? ", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent('mushy_robbery:info', _source)
end)

RegisterServerEvent('mushy_robbery:pay')
AddEventHandler('mushy_robbery:pay', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    u_money = Character.money

    if u_money <= 300 then
    TriggerClientEvent("vorp:TipBottom", _source, "Vous avez pas l'argent", 9000)
    return
    end

    VORP.addItem(_source,"dynamite", 1)
    TriggerEvent("vorp:removeMoney", _source, 0, 0)
    TriggerClientEvent("vorp:TipBottom", _source, "JOHN: Vas faire pete la banque!", 5000)
	Citizen.Wait(1000)
    TriggerClientEvent('mushy_robbery:go', _source)
end)

RegisterNetEvent("mushy_robbery:startrobbery")
AddEventHandler("mushy_robbery:startrobbery", function(robtime)
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    local count = VORP.getItemCount(_source, "dynamite")
    if count >= 1 then
        VORP.subItem(_source,"dynamite", 1)
        isRobbing = false
        TriggerClientEvent("vorp:TipBottom", _source, "Les sheriffs on vu quelque chose de suspect", 5000)
        Citizen.Wait(5000)
        TriggerClientEvent('mushy_robbery:startAnimation2', _source)
    else
        TriggerClientEvent("vorp:TipBottom", _source, "Vous avez perdu la dynamite", 6000)
    end
end)


RegisterServerEvent('mushy_robbery:loot')
AddEventHandler('mushy_robbery:loot', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    Blowedynamite = Blowedynamite
    if Blowedynamite == true then
    end
    TriggerClientEvent('mushy_robbery:loot2', _source)
end)

RegisterNetEvent("mushy_robbery:payout")
AddEventHandler("mushy_robbery:payout", function()
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
        local Character = VorpCore.getUser(_source).getUsedCharacter
        ritem = math.random(2,2)
        local randomitempull = math.random(1, #Config.Items)
        local itemName = Config.Items[randomitempull]
        VORP.addItem(_source, itemName, ritem)
        Character.addCurrency(0, 500)
        TriggerClientEvent("vorp:TipBottom", _source, "Vous avez trouver le pognon et des bijoux! Barrez vous!!!", 9000)
    end)
end)


RegisterNetEvent("policenotify")
AddEventHandler("policenotify", function(players, coords, alert)
    for each, playerId  in ipairs(GetPlayers()) do
        local User = VorpCore.getUser(playerId).getUsedCharacter
        if User.job == 'sheriff_rh' or User.job == 'marshal' or User.job == 'sheriff_bw' then
            TriggerClientEvent("Witness:ToggleNotification2", playerId, coords, alert)
        end
    end
end)