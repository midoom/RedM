TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VORP = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("lto_roulette:Bets")
AddEventHandler("lto_roulette:Bets", function(u_money)
	local _source = source 
    TriggerEvent('vorp:getCharacter', _source, function(user)
    u_money = user.money
        if u_money >= 10 then -- minimum money to open the UI of the Game but it dont change the minium bet you need to edit the index.html for that.
            TriggerClientEvent("lto_roulette:start", _source, u_money)
            else
			TriggerClientEvent("vorp:TipBottom", _source, Config.Language.nomoney, 3000)
        end
    end)
end)

RegisterServerEvent('lto_roulette:removemoney')
AddEventHandler('lto_roulette:removemoney', function(amount)
	local amount = amount
	local _source = source
	TriggerEvent("vorp:removeMoney", source, 0, amount)
end)

RegisterServerEvent('lto_roulette:givemoney')
AddEventHandler('lto_roulette:givemoney', function(action, amount)
	local action = action
	local amount = amount
	local _source = source
	if action == 'Black' or action == 'Red' then
		local win = amount*2
        TriggerEvent("vorp:addMoney", source, 0, win)
	elseif action == 'Green' then
		local win = amount*14
        TriggerEvent("vorp:addMoney", source, 0, win)
	else
	end
end)

RegisterServerEvent('InteractSound_SV:PlayOnSource')
AddEventHandler('InteractSound_SV:PlayOnSource', function(soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, soundFile, soundVolume)
end)

-- TP from St-Denis to the Boat for 10$
RegisterServerEvent('lto_roulette:BoatMoney')
AddEventHandler('lto_roulette:BoatMoney', function()
	local _source = source 
    TriggerEvent('vorp:getCharacter', _source, function(user)
        argent = user.money
    end)
    if argent <= 10 then -- change price to travel
	    TriggerClientEvent("vorp:TipBottom", _source, Config.Language.nomoney, 3000)
        return
    end
	TriggerClientEvent('lto_roulette:Teleport', _source)
    TriggerEvent("vorp:removeMoney", _source, 0, 10) -- change price to travel
end)