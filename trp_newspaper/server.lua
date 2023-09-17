VORP = exports.vorp_inventory:vorp_inventoryApi()

VORP.RegisterUsableItem("newspaper", function(data)
	TriggerClientEvent('lto_newspaper:open', data.source)
end)