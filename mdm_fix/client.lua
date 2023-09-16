--DESACTIVE LES CARTES BLANCHES EN HAUT A DROITE

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)       
        Citizen.InvokeNative(0x4CC5F2FC1332577F, 1058184710)
       end 
end)

--DESACTIVE Les coups critiques, les etranglements et les attaques aux corps a corps

Citizen.CreateThread(function()
    while true do
        Wait(0)
        SetPedConfigFlag(PlayerPedId(),263,true) -- No Critical Hits
        SetPedConfigFlag(PlayerPedId(),169,true) -- Disable Grapple
        SetPedConfigFlag(PlayerPedId(),340,true) -- Disable All Melee TakeDowns    
    end
end)

--EMPECHE LE SPAM DE TOUCHES PENDANT UN COMBAT

Citizen.CreateThread(function()
    local flag=false
    local counter=nil
    while true do
        Wait(0)
        if counter then
            counter=counter+1
        end
        if counter and counter>=40 then
            print("RESETTING")
            flag=false
            counter=nil
        end
        local Ped = PlayerId()
        local PlayerPed = PlayerPedId()
        --melee
        if flag then
            DisableControlAction(0, `INPUT_ATTACK`, true)
            DisableControlAction(0, `INPUT_MELEE_ATTACK`, true)
            DisableControlAction(0, `INPUT_MELEE_GRAPPLE_CHOKE`, true)
            DisableControlAction(0, `INPUT_MELEE_GRAPPLE`, true)
        end
        if IsPedInMeleeCombat(PlayerPed) and IsPedPerformingMeleeAction(PlayerPed, 1) and not flag then
           flag=true
           counter=0
           print('MeleeAction!')
        end
    end
end)

-- DESACTIVE LA BARRE ESPACE DANS LA WHEEL WEAPON

Citizen.CreateThread(function()
while true do 
Wait(0)
DisableControlAction(0,0x9CC7A1A4, true) -- space bar
end
end)

-- FIX WAGON FREEZE

    Citizen.CreateThread(function()
        -- List of vehicles (entities) in the game
        local vehiclePool = {}
        -- Variables pour stocker le charriot bug, le conducteur et le cheval
        local buggyWagon = 0
        local driver = 0
        local horse = 0
        
        while true do
            -- Get the list of vehicles (entities) from the pool
            vehiclePool = GetGamePool('CVehicle')

            for i = 1, #vehiclePool do
                -- Get the current vehicle from the list
                buggyWagon = vehiclePool[i]

                -- Check if the current vehicle is a buggy wagon
                -- Un wagon buggy est défini comme un véhicule arrêté avec un cheval qui marche
                if IsEntityAVehicle(buggyWagon) and IsVehicleStopped(buggyWagon) then
                    horse = Citizen.InvokeNative(0xA8BA0BAE0173457B, buggyWagon, 0)
                    if IsPedWalking(horse) then
                        -- Get the driver of the buggy wagon
                        driver = Citizen.InvokeNative(0x2963B5C1637E8A27, buggyWagon)
                        -- Delete the driver and buggy wagon if they exist
                        -- and if the driver is not a player
                        if driver and driver ~= PlayerPedId() then
                            DeleteEntity(driver)
                            DeleteEntity(buggyWagon)
                        end
                    end
                end
            end

            -- Attendez 1 seconde avant de vérifier s'il y a plus de wagons buggy
            Citizen.Wait(1000)
        end
    end)
end

-- 1.Désactivez les achievements de RDO

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 	
 		local size = GetNumberOfEvents(0)
        if size > 0 then
            for i = 0, size - 1 do
                local eventAtIndex = GetEventAtIndex(0, i)
                if eventAtIndex == GeHashKey("EVENT_CHALLENGE_GOAL_COMPLETE") or eventAtIndex == GetHashKey("EVENT_CHALLENGE_REWARD") or eventAtIndex == GetHashKey("EVENT_DAILY_CHALLENGE_STREAK_COMPLETED") then
                    Citizen.InvokeNative(0x6035E8FBCA32AC5E)
                end
            end
        end
    end
end)

-- anti noyade bateau qui ne coule pas hors map

Citizen.CreateThread(function()
	while true do
		Wait(0)
		Citizen.InvokeNative(0xC1E8A365BF3B29F2, PlayerPedId(), 364)   -- PRF_IgnoreDrownAndKillVolumes
	end
end)

-- ANTI VOL CHEVAL

AddEventHandler('playerEnteredVehicle', function(playerId, vehicle, seat)
    local playerPed = GetPlayerPed(playerId)
    local ownerId = GetEntityOwner(vehicle)

    if ownerId ~= playerId then
        local ownerPed = GetPlayerPed(GetPlayerFromServerId(ownerId))
        if GetPedInVehicleSeat(vehicle, -1) == ownerPed then
            -- Le propriétaire du véhicule est déjà monté dessus, donc on autorise le joueur à monter également
        else
            VORPcore.NotifyBottomRight("Vous ne pouvez pas monter, car il ne vous appartient pas.",4000)
            SetPedCanBeKnockedOffVehicle(playerPed, 0)
        end
    end
end)
