TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VORP = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("lto_slots:BetsAndMoney")
AddEventHandler("lto_slots:BetsAndMoney", function(bets)
	local _source = source 
    TriggerEvent('vorp:getCharacter', _source, function(user)
    u_money = user.money
        if bets % 50 == 0 and bets >= 50 then
            if u_money >= bets then
				TriggerEvent("vorp:removeMoney",source, 0, bets)
                TriggerClientEvent("lto_slots:UpdateSlots", _source, bets)
            else
				TriggerClientEvent("vorp:TipBottom", _source, Config.Language.nomoney, 3000)
            end
        else
		    TriggerClientEvent("vorp:TipBottom", _source, Config.Language.multiple, 3000)
        end
    end)
end)

RegisterServerEvent("lto_slots:PayOutRewards")
AddEventHandler("lto_slots:PayOutRewards", function(amount)
		TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
		amount = tonumber(amount)
		if amount > 0 then
		    TriggerEvent("vorp:addMoney",source, 0, amount)
		    TriggerClientEvent("vorp:TipBottom", _source, Config.Language.winmoney, 5000)
        else
		    TriggerClientEvent("vorp:TipBottom", _source, Config.Language.losemoney, 3000)
        end
    end)
end)