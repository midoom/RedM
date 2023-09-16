local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local DoorInfo	= {}

RegisterServerEvent('void_doorlocks:Load')
AddEventHandler('void_doorlocks:Load', function()
	for k,v in pairs(DoorInfo) do
		TriggerClientEvent('void_doorlocks:setState', -1, v.doorID, v.state)
	end
end)

RegisterServerEvent('void_doorlocks:updatedoorsv')
AddEventHandler('void_doorlocks:updatedoorsv', function(source, doorID, cb)
    local _source = source
	
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter
	local job = Character.job
	
	if not IsAuthorized(job, Config.DoorList[doorID]) then
		TriggerClientEvent("vorp:TipRight", _source, "Mauvaise Cle!", 5000)
		return
	else 
		TriggerClientEvent('void_doorlocks:changedoor', _source, doorID)
	end
end)

RegisterServerEvent('void_doorlocks:updatedooritm')
AddEventHandler('void_doorlocks:updatedooritm', function(source, doorID, cb)
    local _source = source
		TriggerClientEvent('void_doorlocks:changedoor', _source, doorID)
end)

RegisterServerEvent('void_doorlocks:updatedoorbreak')
AddEventHandler('void_doorlocks:updatedoorbreak', function(source, doorID, cb)
    local _source = source
		TriggerClientEvent('void_doorlocks:changedoor', _source, doorID)
end)

RegisterServerEvent('void_doorlocks:updateState')
AddEventHandler('void_doorlocks:updateState', function(doorID, state, cb)	
	if type(doorID) ~= 'number' then
		return
	end
	
	DoorInfo[doorID] = {
		doorID = doorID,
		state = state
	}

	TriggerClientEvent('void_doorlocks:setState', -1, doorID, state)
end)

RegisterServerEvent('void_doorlocks:lockbreaker:break')
AddEventHandler('void_doorlocks:lockbreaker:break', function()
    local _source = source
	local user = VorpCore.getUser(_source).getUsedCharacter
	VorpInv.subItem(_source, "lockpick", 1)
	TriggerClientEvent("vorp:TipBottom", _source, "God Damn ! Mon Lockpick a casser!", 2000)
end)

function IsAuthorized(jobName, doorID)
	for _,job in pairs(doorID.authorizedJobs) do
		if job == jobName then
			return true
		end
	end
	return false
end


VorpInv.RegisterUsableItem("lockpick", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, true)
end)
----------------- Registre new keys below------------------

-- New Key Example
--VorpInv.RegisterUsableItem("itemname", function(data)
	--VorpInv.CloseInv(data.source)
	--TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'itemname')
--end)

VorpInv.RegisterUsableItem("cle_sisika", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_sisika')
end)

VorpInv.RegisterUsableItem("cle_docteur_v", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_docteur_v')
end)

VorpInv.RegisterUsableItem("cle_sheriff_v", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_sheriff_v')
end)

VorpInv.RegisterUsableItem("cle_bank_v", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_bank_v')
end)

VorpInv.RegisterUsableItem("cle_saloon_v", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_saloon_v')
end)

VorpInv.RegisterUsableItem("cle_armurier_v", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_armurier_v')
end)

VorpInv.RegisterUsableItem("cle_fortwallace", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_fortwallace')
end)

VorpInv.RegisterUsableItem("cle_bank_rh", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_bank_rh')
end)

VorpInv.RegisterUsableItem("cle_sheriff_rh", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_sheriff_rh')
end)

VorpInv.RegisterUsableItem("cle_manoir", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_manoir')
end)

VorpInv.RegisterUsableItem("cle_sheriff_sd", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_sheriff_sd')
end)

VorpInv.RegisterUsableItem("cle_docteur_sd", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_docteur_sd')
end)

VorpInv.RegisterUsableItem("cle_sheriff_a", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_sheriff_a')
end)

VorpInv.RegisterUsableItem("cle_ranger_arma", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_ranger_arma')
end)

VorpInv.RegisterUsableItem("cle_ranger_arma_bank", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_ranger_arma_bank')
end)

VorpInv.RegisterUsableItem("cle_ranger_tumb", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_ranger_tumb')
end)

VorpInv.RegisterUsableItem("cle_indien", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_indien')
end)

VorpInv.RegisterUsableItem("cle_sheriff_bw", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_sheriff_bw')
end)

VorpInv.RegisterUsableItem("cle_bank_sd", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_bank_sd')
end)

VorpInv.RegisterUsableItem("cle_gouverment_sd", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_gouverment_sd')
end)

VorpInv.RegisterUsableItem("cle_armurier_sd", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_armurier_sd')
end)

VorpInv.RegisterUsableItem("cle_milice", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_milice')
end)

VorpInv.RegisterUsableItem("cle_docteur_rh", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_docteur_rh')
end)

VorpInv.RegisterUsableItem("cle_saloon_rh", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_saloon_rh')
end)

VorpInv.RegisterUsableItem("cle_armurier_rh", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_armurier_rh')
end)
VorpInv.RegisterUsableItem("cle_saloon_bw", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'cle_saloon_bw')
end)

VorpInv.RegisterUsableItem("key", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'key')
end)

VorpInv.RegisterUsableItem("cle_ranger_bw", function(data)
	VorpInv.CloseInv(data.source)
	TriggerClientEvent("void_doorlocks:opendoor", data.source, false, 'key')
end)