VORPInv = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()
	Citizen.Wait(10)
	VORPInv.RegisterUsableItem("ladder", function(data)
		local _source = source
		TriggerClientEvent('nic_ladder:useLadder', data.source)
	end)
end)

RegisterServerEvent('nic_ladder:removeitem')
AddEventHandler('nic_ladder:removeitem', function()
	local _source = source
	VORPInv.subItem(_source, 'ladder', 1)
end)

RegisterServerEvent('nic_ladder:additem')
AddEventHandler('nic_ladder:additem', function()
	local _source = source
	VORPInv.addItem(_source, 'ladder', 1)
end)