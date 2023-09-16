local carry = false 

Citizen.CreateThread(function()
    carry = false 
    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(0,0x1CE6D9EB) then
            ToggleCarry()
        end
        if carry then
            StopCarrying(entity)
        end
    end
end)


local EntityInHands

RegisterNetEvent('carry:toggle')

function GetNearbyEntities(entityType, coords)
	local itemset = CreateItemset(true)
	local size = Citizen.InvokeNative(0x59B57C4B06531E1E, coords, Config.MaxDistance, itemset, entityType, Citizen.ResultAsInteger())

	local entities = {}

	if size > 0 then
		for i = 0, size - 1 do
			table.insert(entities, GetIndexedItemInItemset(i, itemset))
		end
	end

	if IsItemsetValid(itemset) then
		DestroyItemset(itemset)
	end

	return entities
end

function StartCarrying(entity)
	local bone = GetEntityBoneIndexByName(PlayerPedId(), 'skel_r_hand')
	local h1 = GetEntityHeading(PlayerPedId())
	local h2 = GetEntityHeading(entity)
	NetworkRequestControlOfEntity(entity)
	FreezeEntityPosition(entity, false)
	AttachEntityToEntity(entity, PlayerPedId(), bone, 0.0, 0.3, -0.3, 0.0, 0.0, h1 - h2 - 90, false, false, true, false, 0, true, false, false)
end

function GetClosestNetworkedEntity()
	local playerCoords = GetEntityCoords(PlayerPedId())

	local minDistance
	local closestEntity

	for _, object in ipairs(GetNearbyEntities(3, playerCoords)) do
		if NetworkGetEntityIsNetworked(object) and not IsEntityAttached(object) then
			local objectCoords = GetEntityCoords(object)
			local distance = #(playerCoords - objectCoords)

			if not minDistance or distance < minDistance then
				minDistance = distance
				closestEntity = object
			end
		end
	end

	for _, ped in ipairs(GetNearbyEntities(1, playerCoords)) do
		if ped ~= PlayerPedId() and NetworkGetEntityIsNetworked(ped) and not IsEntityAttached(ped) then
			local pedCoords = GetEntityCoords(ped)
			local distance = #(playerCoords - pedCoords)

			if not minDistance or distance < minDistance then
				minDistance = distance
				closestEntity = ped
			end
		end
	end

	return closestEntity
end

function LoadAnimDict(dict)
	if DoesAnimDictExist(dict) then
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Citizen.Wait(0)
		end
	end
end

function PlayPickUpAnimation()
	LoadAnimDict(Config.PickUpAnimDict)
	TaskPlayAnim(PlayerPedId(), Config.PickUpAnimDict, Config.PickUpAnimName, 1.0, 1.0, -1, 0, 0, false, false, false, '', false)
	RemoveAnimDict(Config.PickUpAnimDict)
end

function StartCarryingClosestEntity()
	local entity = GetClosestNetworkedEntity()

	if entity then
		PlayPickUpAnimation()

		Citizen.Wait(750)

		StartCarrying(entity)

		return entity
	else
		exports.uifeed:showObjective("Il n\'y a rien à ramasser ici.", 3000)
		return nil
	end
end

function PlayPutDownAnimation()
	LoadAnimDict(Config.PutDownAnimDict)
	TaskPlayAnim(PlayerPedId(), Config.PutDownAnimDict, Config.PutDownAnimName, 1.0, 1.0, -1, 0, 0, false, false, false, '', false)
	RemoveAnimDict(Config.PutDownAnimDict)
end

function PlacePedOnGroundProperly(ped)
	local x, y, z = table.unpack(GetEntityCoords(ped))
	local found, groundz, normal = GetGroundZAndNormalFor_3dCoord(x, y, z)
	if found then
		SetEntityCoordsNoOffset(ped, x, y, groundz + normal.z, true)
	end
end

function PlaceOnGroundProperly(entity)
	local entityType = GetEntityType(entity)

	if entityType == 1 then
		PlacePedOnGroundProperly(entity)
	elseif entityType == 2 then
		SetVehicleOnGroundProperly(entity)
	elseif entityType == 3 then
		PlaceObjectOnGroundProperly(entity)
	end
end

function StopCarrying(entity)
	local heading = GetEntityHeading(entity)

	ClearPedTasks(PlayerPedId())

	PlayPutDownAnimation()

	Citizen.Wait(500)

	NetworkRequestControlOfEntity(entity)
	FreezeEntityPosition(entity, false)
	DetachEntity(entity, false, true)
	PlaceOnGroundProperly(entity)
	SetEntityHeading(entity, heading)
end

function PlayCarryingAnimation()
	LoadAnimDict(Config.CarryAnimDict)
	TaskPlayAnim(PlayerPedId(), Config.CarryAnimDict, Config.CarryAnimName, speed, speed, -1, 25, 0, false, false, false, '', false)
	RemoveAnimDict(Config.CarryAnimDict)
end

function Start()
	EntityInHands = StartCarryingClosestEntity()
end

function Stop()
	local entity = EntityInHands
	EntityInHands = nil
	StopCarrying(entity)
end

function ToggleCarry()
	if EntityInHands then
		Stop()
	else
		Start()
	end
end

RegisterCommand('carry', function(source, args, raw)
	ToggleCarry()
end)

AddEventHandler('carry:toggle', ToggleCarry)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if EntityInHands then
			DisableControlAction(0, 0x07CE1E61, true)
			DisableControlAction(0, 0xB2F377E8, true)
			DisableControlAction(0, 0x018C47CF, true)
			DisableControlAction(0, 0x2277FAE9, true)

			if not IsEntityAttachedToEntity(EntityInHands, PlayerPedId()) or GetEntityHealth(EntityInHands) == 0 then
				Stop()
			elseif not IsEntityPlayingAnim(PlayerPedId(), Config.CarryAnimDict, Config.CarryAnimName, 25) then
				PlayCarryingAnimation()
			end
		end
	end
end)
