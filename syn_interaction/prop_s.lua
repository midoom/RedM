VORP = exports.vorp_inventory:vorp_inventoryApi()

VORP.RegisterUsableItem("cigarette", function(data)
	VORP.subItem(data.source, "cigarette", 1)
	TriggerClientEvent('prop:cigarettes', data.source)
end)

VORP.RegisterUsableItem("cigar", function(data)
	VORP.subItem(data.source, "cigar", 1)
	TriggerClientEvent('prop:cigar', data.source)
end)

VORP.RegisterUsableItem("camera", function(data)
	TriggerClientEvent('camera:deploy', data.source)
end)

VORP.RegisterUsableItem("hairpomade", function(data)
	VORP.subItem(data.source, "hairpomade", 1)
	TriggerClientEvent('prop:hairpomade', data.source)
end)

VORP.RegisterUsableItem("pocket_watch", function(data)
	TriggerClientEvent('prop:watch', data.source)
end)

VORP.RegisterUsableItem("pipe", function(data)
	TriggerClientEvent('prop:pipe', data.source)
end)

VORP.RegisterUsableItem("fan", function(data)
	TriggerClientEvent('prop:fan', data.source)
end)

VORP.RegisterUsableItem("chewingtobacco", function(data)
	VORP.subItem(data.source, "chewingtobacco", 1)
	TriggerClientEvent('prop:chewingtobacco', data.source)
end)

VORP.RegisterUsableItem("unique_dr_cleanser", function(data)
	VORP.subItem(data.source, "unique_dr_cleanser", 1)
	TriggerClientEvent('prop:unique_dr_cleanser', data.source)
end)

VORP.RegisterUsableItem("guitar", function(data)
	TriggerClientEvent('prop:unique_guitar_special', data.source)
end)

VORP.RegisterUsableItem("trompette", function(data)
	TriggerClientEvent('prop:unique_trompette_special', data.source)
end)

VORP.RegisterUsableItem("mandolin", function(data)
	TriggerClientEvent('prop:unique_mandolin_special', data.source)
end)

VORP.RegisterUsableItem("banjo", function(data)
	TriggerClientEvent('prop:unique_banjo_special', data.source)
end)

VORP.RegisterUsableItem("harmonica", function(data)
	TriggerClientEvent('prop:unique_harmonica_special', data.source)
end)

VORP.RegisterUsableItem("acordeon", function(data)
	TriggerClientEvent('prop:unique_acordeon_special', data.source)
end)

VORP.RegisterUsableItem("guimbarde", function(data)
	TriggerClientEvent('prop:unique_guimbarde_special', data.source)
end)

VORP.RegisterUsableItem("unique_bouquet", function(data)
	TriggerClientEvent('prop:unique_bouquet', data.source)
end)

VORP.RegisterUsableItem("parasol", function(data)
	TriggerClientEvent('prop:parasol', data.source,"parasol")
end)

VORP.RegisterUsableItem("cane", function(data)
	TriggerClientEvent('prop:cane', data.source)
end)