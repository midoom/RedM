VORP = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()
	Citizen.Wait(2000)

	VORP.RegisterUsableItem("weedseed", function(data)
			VORP.subItem(data.source, "weedseed", 1)
			local item = "weedseed"
			TriggerClientEvent('poke_planting:planto1', data.source, "prop_weed_02", "prop_weed_02", "prop_weed_01", item)
		
	end)

	VORP.RegisterUsableItem("wateringcan", function(data)
		TriggerClientEvent('poke_planting:regar1', data.source)
	end)
	
end)

RegisterServerEvent('giveback')
AddEventHandler('giveback', function(item)
	VORP.addItem(source, item, 1)
	TriggerClientEvent("seed:used")
end)

RegisterServerEvent('poke_planting:giveitem')
AddEventHandler('poke_planting:giveitem', function(tipo)
    local _source = source
	local count = math.random(2, 5)
	if tipo == "prop_weed_01" then
        TriggerClientEvent("vorp:TipRight", _source, 'Vous avez collecte [X'..count..'] Weed', 3000)
        VORP.addItem(_source, "weedbuds", count)
	end

end)
