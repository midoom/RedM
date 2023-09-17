local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

VorpInv.RegisterUsableItem("antipoison", function(data)
	VorpInv.CloseInv(data.source)
    VorpInv.subItem(data.source, "antipoison", 1)
	TriggerClientEvent("Perry_Poison:UseAntidote", data.source)
end)
