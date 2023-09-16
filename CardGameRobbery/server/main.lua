VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


--Locations = {
 --   vector3(2716.97265625, -1282.83203125, 60.34485244750976),
--}

RegisterServerEvent('mushy_robbery:talk3')
AddEventHandler('mushy_robbery:talk3', function()
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        TriggerClientEvent("vorp:TipBottom", _source, "Angel: I have a dangerous job for you. ", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent("vorp:TipBottom", _source, "Angel: These guys are really dangerous, you might not make it out alive", 5000)
		Citizen.Wait(5000)
		TriggerClientEvent("vorp:TipBottom", _source, "Angel: It's a secret card game above the gunshop in Saint Denis.", 5000)
		Citizen.Wait(5000)
        TriggerClientEvent("vorp:TipBottom", _source, "Angel: Alot of high stake games and a safe FULL of valuables.", 5000)
        Citizen.Wait(5000)
        TriggerClientEvent("vorp:TipBottom", _source, "Angel: You will need Dynamite, two Lock Breakers and some big balls!! ", 5000)
        Citizen.Wait(5000)
        TriggerClientEvent("vorp:TipBottom", _source, "Angel: Are you up for the job? ", 5000)
        Citizen.Wait(5000)   
		TriggerClientEvent('mushy_robbery:info3', _source)
end)

RegisterServerEvent('mushy_robbery:pay3')
AddEventHandler('mushy_robbery:pay3', function()
        local _source = source
        local Character = VorpCore.getUser(_source).getUsedCharacter
        u_money = Character.money

    if u_money <= 0 then
        TriggerClientEvent("vorp:TipBottom", _source, "You have no money", 9000)
        return
    end

    TriggerEvent("vorp:removeMoney", _source, 0, 0)
    TriggerClientEvent("vorp:TipBottom", _source, "Angel: Now Go To The Secret Room Above The GunShop!", 5000)
	Citizen.Wait(1000)
    TriggerClientEvent('mushy_robbery:go3', _source)    
end)

RegisterNetEvent("mushy_robbery:startrobbery3")
AddEventHandler("mushy_robbery:startrobbery3", function(robtime)
    local _source = source
    local Character = VorpCore.getUser(source).getUsedCharacter
    local count = VORP.getItemCount(_source, "dynamite")

    if count >= 1 then      
        VORP.subItem(_source,"dynamite", 1)
        isRobbing = false    
        TriggerClientEvent('mushy_robbery:startAnimation3', _source)
        
        
        TriggerClientEvent("vorp:TipBottom", _source, "The Police Have Been Alerted",6000)
    else   
        
        TriggerClientEvent("vorp:TipBottom", _source, "You dont have a dynamite", 6000)
    end    
           
end)


RegisterServerEvent('mushy_robbery:loot3')
AddEventHandler('mushy_robbery:loot3', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    Blowedynamite = Blowedynamite    
        
    if Blowedynamite == true then
    end        
    TriggerClientEvent('mushy_robbery:loot4', _source)    
end)

RegisterNetEvent("mushy_robbery:payout3")
AddEventHandler("mushy_robbery:payout3", function()
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
        local Character = VorpCore.getUser(_source).getUsedCharacter
        ---randommoney = math.random(10,20)
        ritem = math.random(2,2)
        local randomitempull = math.random(1, #Config.Items)
        local itemName = Config.Items[randomitempull]
        VORP.addItem(_source, itemName, ritem)
        Character.addCurrency(0, 125) 
        TriggerClientEvent("vorp:TipBottom", _source, "You got the loot", 9000)
    end)
end)


RegisterNetEvent("policenotify3")
AddEventHandler("policenotify3", function(players, coords, alert)
    for each, playerId  in ipairs(GetPlayers()) do
        local User = VorpCore.getUser(playerId).getUsedCharacter

        if User.job == 'police' or User.job == 'marshal' or User.job == 'sheriff' then
            TriggerClientEvent("Witness:ToggleNotification3", playerId, coords, alert)
        end
    end
end)