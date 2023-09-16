local isScratching = false
local threshold = 0.5
local winningamount = 0
local itemUsed = {}
local prompts = GetRandomIntInRange(0, 0xffffff)
local openmenu


RegisterNetEvent("vorp:SelectedCharacter") 
AddEventHandler("vorp:SelectedCharacter", function(charid)
    if Config.useLocations then
        InitMarkets() -- NPCs and Blips loading after selecting character
    end
end)



Citizen.CreateThread(function()
    if Config.useLocations then
        while true do
            local sleep = true
            Citizen.Wait(5)
            local playerPed = PlayerPedId()
            local playerLoc = GetEntityCoords(playerPed)
            for i,v in pairs(Config.locations) do 
                if IsPlayerNearCoords(v.coords.x, v.coords.y, v.coords.z, v.distance) then
                    sleep = false
                    local label = CreateVarString(10, 'LITERAL_STRING',
                                                  v.marketName)
                    PromptSetActiveGroupThisFrame(prompts, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE, openmenu) then
                        TriggerServerEvent("twh_lottery:exchange")
                    end
                end
            end
            if sleep then
                Citizen.Wait(500)
                
            end
        end  
    end
    
end)

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = _U("prompt")
    openmenu = PromptRegisterBegin()
    PromptSetControlAction(openmenu, Config.key)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(openmenu, str)
    PromptSetEnabled(openmenu, 1)
    PromptSetVisible(openmenu, 1)
    PromptSetStandardMode(openmenu, 1)
    PromptSetGroup(openmenu, prompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, openmenu, true)
    PromptRegisterEnd(openmenu)
end)






RegisterNetEvent("twh_lottery:clientUpdate")
AddEventHandler("twh_lottery:clientUpdate", function(prize,item)
	if isScratching == false then		
		isScratching = true
		Wait(100)
		SetNuiFocus(true, true)
		SendNUIMessage({type = "shownui", value = prize, threshold = threshold})
		winningamount = prize
        itemUsed = item
	end
end)

RegisterNUICallback("closenui", function(data,cb)
	SetNuiFocus(false, false)
	TriggerServerEvent("twh_lottery:setPrice", winningamount, itemUsed)
	isScratching = false
	winningamount = 0
	if cb then
		cb({})
	end
end)