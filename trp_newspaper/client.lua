local isOpen = false
local doOpen = false
local doClose = true
local active = false
local JournalOuvert = false

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        FreezeEntityPosition(PlayerPedId(), false)
		CloseUI()
    end
end)

RegisterNetEvent('lto_newspaper:open')
AddEventHandler('lto_newspaper:open', function()
	OpenUI()
end)

function OpenUI()
    local playerPed = PlayerPedId()
    isOpen = true
    SetNuiFocus(isOpen,isOpen)
    SendNUIMessage({
    type = "OpenBookGui",
    value = true,
    })
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	JournalOuvert = true
	SortirJournal()
	Wait(2000)
	local player = PlayerPedId()
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_cs_newspaper_02x_noanim"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("mech_carry_box")
    while not HasAnimDictLoaded("mech_carry_box") do
    Citizen.Wait(100)
    end
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"mech_carry_box", "idle", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"SKEL_L_Finger12"), 0.20, 0.00, -0.05, 180.0, 190.0, 0.0, true, true, false, true, 1, true)	
end

function CloseUI()
    local playerPed = PlayerPedId()
    isOpen = false
    SetNuiFocus(isOpen,isOpen)
    active = false
    FreezeEntityPosition(PlayerPedId(), false)
    SendNUIMessage({
    type = "OpenBookGui",
    value = false,
    })
	JournalOuvert = false
    RangerJournal()
    ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
    DetachEntity(prop,false,true)
    ClearPedTasks(player)
    DeleteObject(prop)	
end

Citizen.CreateThread(function(...)
    while true do
        Citizen.Wait(0)
        if doOpen then
            doOpen = false
            OpenUI()
        elseif doClose then
            doClose = false
            CloseUI()
        end
    end
end)

function SortirJournal()
    local ped = PlayerPedId()
	AnimationJ(ped, "mech_inspection@mini_map@satchel", "enter")
end

function RangerJournal()
    local ped = PlayerPedId()
	AnimationJ(ped, "mech_inspection@two_fold_map@satchel", "exit_satchel")
end

function AnimationJ(ped, dict, name)
    if not DoesAnimDictExist(dict) then
      return
    end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
    Citizen.Wait(0)
    end
    TaskPlayAnim(ped, dict, name, -1.0, -0.5, 2000, 1, 0, true, 0, false, 0, false)
    RemoveAnimDict(dict)
end

RegisterNUICallback('close', CloseUI)