local VORPInv = {}

VORPInv = exports.vorp_inventory:vorp_inventoryApi()

local VORPcore = {}

TriggerEvent("getCore", function(core)
VORPcore = core
end)

local _source = source -- player source

local itemName = "kit_clean_weapon"
VorpInv.RegisterUsableItem(itemName, function(data)
	VorpInv.CloseInv(data.source)
   	TriggerClientEvent('nettoyage:cleangun', source, cleaning)
	VorpInv.subItem(data.source, "kit_clean_weapon", 1) 
   	VORPcore.NotifyLeft(_source,"Nettoyage","Votre arme est propre","generic_textures","tick", 5000)
end)
