
local VorpCore = {}

TriggerEvent("getCore",function(core) VorpCore = core end)

VORP = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()
	Citizen.Wait(2000)
	
	if Config.UsableItems then
		for k, item in pairs (Config.MultiItemSetList) do

			VORP.RegisterUsableItem(k, function(data)
				TriggerClientEvent("mm_native_headbands:AttachHeadbandTypeOnPlayerPed", data.source, k)
				VORP.CloseInv(data.source)
			end)

		end
	end
	
end)
