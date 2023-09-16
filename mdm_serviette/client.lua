local ped = PlayerPedId()
local prop = nil 

RegisterNetEvent('Mdm_Serviette:UseServiette')
AddEventHandler('Mdm_Serviette:UseServiette', function()
    PutPropInHand("s_balledragcloth01x")
    LaunchCustomAnimation()
    Citizen.Wait(2500)
    WashPlayer()
    SetEntityAsMissionEntity(prop)
    ClearPedTasksImmediately(PlayerPedId())

    Citizen.Wait(1000) 

    if prop ~= nil then
        DeleteObject(prop)
        prop = nil
    end
end)

function WashPlayer()
    local player = PlayerPedId()
    Citizen.InvokeNative(0x6585D955A68452A5, player) -- ClearPedEnvDirt
    Citizen.InvokeNative(0x523C79AEEFCC4A2A, player, 10, 'ALL') -- ClearPedDamageDecalByZone
    Citizen.InvokeNative(0x8FE22675A5A45817, player) -- ClearPedBloodDamage
    Citizen.InvokeNative(0xE3144B932DFDFF65, player, 0.0, -1, 1, 1) -- SetPedDirtCleaned
end

function LaunchCustomAnimation()
    local playerPed = PlayerPedId()
    local animDict = "amb_misc@world_human_wash_wading@wash_off@female_b@wip_base"
    local animName = "wip_base"

    RequestAnimDict(animDict)

    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end

    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 0, 0, false, false, false)

    while IsEntityPlayingAnim(playerPed, animDict, animName, 3) do
        Citizen.Wait(0)
    end
end

function PutPropInHand(propName)
    local playerPed = PlayerPedId()
    local propHash = GetHashKey(propName)

    RequestModel(propHash)
    while not HasModelLoaded(propHash) do
        Wait(1)
    end

    local boneIndex = 231 -- Bone index of the left hand finger
    prop = CreateObject(propHash, 0.0, 0.0, 0.0, true, true, true)

    AttachEntityToEntity(prop, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true, false, false)

    SetModelAsNoLongerNeeded(propHash)
end