local HaveBucketOnHead = false
local open = false

RegisterNetEvent('lto_headbucket:Verification')
AddEventHandler('lto_headbucket:Verification', function()
    local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
    TriggerServerEvent('lto_headbucket:PutBucket', GetPlayerServerId(closestPlayer))                   
    end
end)

function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end

    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])

        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

RegisterNetEvent('lto_headbucket:BucketActif')
AddEventHandler('lto_headbucket:BucketActif', function()
	HaveBucketOnHead = not HaveBucketOnHead
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if HaveBucketOnHead then

		BucketHead("p_bucket03x")

        elseif not HaveBucketOnHead then

        HaveBucketOnHead = false
		RemoveBucketHead()
		
		end
	end)
end)

function BucketHead(hash)
    local Chaudiere = GetHashKey(hash)
    Wait(500)
    RequestModel(Chaudiere)
    if not HasModelLoaded(Chaudiere) then 
    RequestModel(Chaudiere) 
    end
    while not HasModelLoaded(Chaudiere) do 
    Citizen.Wait(1) 
    end
    local playerPed = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    Bucket = CreateObject(Chaudiere, x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(playerPed, "skel_head")
    SetEntityAsMissionEntity(Bucket, true, true)
    AttachEntityToEntity(Bucket, playerPed,boneIndex, 0.200, 0.0, 0.0, 1.024, -90.0, -70.0, true, true, false, true, 1, true)
	open = true
	SendNUIMessage({action = "open"})	
end	

function RemoveBucketHead()
	DetachEntity(Bucket,false,true)
    ClearPedTasks(player)
    DeleteObject(Bucket)
    open = false
    SendNUIMessage({action = "close"})
end	