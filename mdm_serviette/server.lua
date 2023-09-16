local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local itemName = "serviette"
VorpInv.RegisterUsableItem(itemName, function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("Mdm_Serviette:UseServiette", data.source)
	VorpInv.subItem(data.source, "serviette", 1)
   	VORPcore.NotifyLeft(_source,"Nettoyage","Vous avez nettoyer vos vetements","generic_textures","tick", 5000)
end)