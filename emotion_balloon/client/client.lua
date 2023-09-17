local balloon = nil
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local RentABalloon

-------------------------------------------------------------------------
--------------------------------    NPC    ------------------------------
-------------------------------------------------------------------------

function LoadModel(model)
    local model = GetHashKey(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(10)
    end
end

Citizen.CreateThread(function()
    while true do
        for _, npc in pairs(Config.RentABalloon) do
            local pcoords = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(pcoords, npc.pos.x, npc.pos.y, npc.pos.z, 1)

            if dist < 180 and not DoesEntityExist(npc.NPC) then
                LoadModel(npc.npcmodel)
                local npc_ped = CreatePed(npc.npcmodel, npc.pos, false, true, true, true)
                Citizen.InvokeNative(0x283978A15512B2FE, npc_ped, true)

                if npc.scenario then
                    TaskStartScenarioInPlace(npc_ped, GetHashKey(npc.scenario), 0, true, false, false, false)
                end

                SetEntityCanBeDamaged(npc_ped, false)
                SetEntityInvincible(npc_ped, true)
                FreezeEntityPosition(npc_ped, true)
                SetBlockingOfNonTemporaryEvents(npc_ped, true)
                SetModelAsNoLongerNeeded(npc.npcmodel)
                SetEntityAsMissionEntity(npc_ped, true, true)

                npc.NPC = npc_ped

            elseif dist > 180 and DoesEntityExist(npc.NPC) then
                DeleteEntity(npc.NPC)
            end
        end
        Citizen.Wait(500)
    end
end)

-------------------------------------------------------------------------
--------------------------------    Blip    -----------------------------
-------------------------------------------------------------------------

for i, v in pairs(Config.RentABalloon) do
    if v.blip then
        BalloonBlip = N_0x554d9d53f696d002(1664425300, v.pos.x, v.pos.y, v.pos.z)
        SetBlipSprite(BalloonBlip, v.sprite, 1)
        SetBlipScale(BalloonBlip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, BalloonBlip, v.name)
    end
end 

-------------------------------------------------------------------------
--------------------------    Rent a Balloon    -------------------------
-------------------------------------------------------------------------

function Button_Prompt()

    Citizen.CreateThread(function()
        local str = _U("PromptMessage")
        RentABalloon = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(RentABalloon, 0xD9D0E1C0)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(RentABalloon, str)
        PromptSetEnabled(RentABalloon, true)
        PromptSetVisible(RentABalloon, true)
        PromptSetHoldMode(RentABalloon, true)
        PromptSetGroup(RentABalloon, buttons_prompt)
        PromptRegisterEnd(RentABalloon)
    end)
end

Citizen.CreateThread(function()
    Button_Prompt()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())
        for i, v in pairs(Config.RentABalloon) do
            if (Vdist(coords.x, coords.y, coords.z, v.pos.x, v.pos.y, v.pos.z) < 2.0) then
            local rent = CreateVarString(10, 'LITERAL_STRING', _U("PromptTitle"))
            PromptSetActiveGroupThisFrame(buttons_prompt, rent) 
                if Citizen.InvokeNative(0x50F940259D3841E6, 0, 0xD9D0E1C0) then
                        TriggerEvent("emotion_balloon:spwan")
                            TriggerServerEvent("emotion_balloon:takemoney")
                end
            end
        end
    end
end)

-------------------------------------------------------------------------
--------------------------    Spwan Balloon    --------------------------
-------------------------------------------------------------------------

RegisterNetEvent('emotion_balloon:spwan')
AddEventHandler('emotion_balloon:spwan', function()
    Citizen.CreateThread(function()

        local playerPed = PlayerPedId()
        local coords = Config.RentABalloon
        local head = GetEntityHeading(playerPed)
        local hash = GetHashKey('hotAirBalloon01')

        while not HasModelLoaded(hash) do
            Wait(10)
            RequestModel(hash)
        end

        if DoesEntityExist(balloon) then
            SetEntityAsMissionEntity(balloon)
            DeleteEntity(balloon)
            balloon = nil
        end
        
        for i, v in pairs(Config.RentABalloon) do
            balloon = CreateVehicle(hash, v.spawn.x, v.spawn.y, v.spawn.z, head, true, true)
        end
    end)
end)

-------------------------------------------------------------------------
----------------------------    Controls    -----------------------------
-------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsUsing(playerPed)
        local driving = GetPedInVehicleSeat(vehicle, -1)
        if IsPedInFlyingVehicle(playerPed) and driving then
            wait = 53
            if IsControlPressed(0, Config.Keys["W"].key) then -- Forward
                ApplyForceToEntity(vehicle, 0, 2.5, 0.0, 0.0, 1.0, 0.0, 0.0, 0, false, true, true, false, true)
            end
            if IsControlPressed(0, Config.Keys["A"].key) then -- Left
                ApplyForceToEntity(vehicle, 0, 0.0, 2.5, 0.0, 1.0, 0.0, 0.0, 0, false, true, true, false, true)
            end
            if IsControlPressed(0, Config.Keys["S"].key) then -- Backward
                ApplyForceToEntity(vehicle, 0, -2.5, 0.0, 0.0, 1.0, 0.0, 0.0, 0, false, true, true, false, true)
            end
            if IsControlPressed(0, Config.Keys["D"].key) then -- Right
                ApplyForceToEntity(vehicle, 0, 0.0, -2.5, 0.0, 1.0, 0.0, 0.0, 0, false, true, true, false, true)
            end
        end
        Wait(wait)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if DoesEntityExist(balloon) then
        SetEntityAsMissionEntity(balloon)
        DeleteEntity(balloon)
        balloon = nil
    end
    for i, v in pairs(Config.RentABalloon) do
        if v.NPC then
            DeleteEntity(v.NPC)
            DeletePed(v.NPC)
        end
        if v.blip then
            RemoveBlip(BalloonBlip)
        end
    end
end)

-------------------------------------------------------------------------
-------------------------------   End    --------------------------------
-------------------------------------------------------------------------