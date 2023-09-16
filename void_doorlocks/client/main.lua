local lockbreaker = false

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    TriggerServerEvent('void_doorlocks:Load')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        local sleep = true
        local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true
        for k,doorID in ipairs(Config.DoorList) do
            local distance
            if doorID.doors then
                distance = #(playerCoords - doorID.doors[1].objCoords)
            else
                distance = #(playerCoords - doorID.textCoords)
            end
            local maxDistance, displayText = 1.25, 'Ouvrir'
            if doorID.distance then
                maxDistance = doorID.distance
            end
            if distance < 10 then
                sleep = false
                if doorID.locked then
                    if DoorSystemGetOpenRatio(doorID.object) ~= 0.0 then
                        DoorSystemSetOpenRatio(doorID.object, 0.0, true)
                        local object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object, 0)
                        SetEntityRotation(object, 0.0, 0.0, doorID.objYaw, 2, true)
                        if doorID.object2 ~= nil then
                            DoorSystemSetOpenRatio(doorID.object2, 0.0, true)
                            object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object2, 0)
                            SetEntityRotation(object, 0.0, 0.0, doorID.objYaw2, 2, true)
                        end
                    end
                    if DoorSystemGetDoorState(doorID.object) ~= 1 then
                        Citizen.CreateThread(function()
                            Citizen.InvokeNative(0xD99229FE93B46286,doorID.object,1,1,0,0,0,0)
                        end)
                        local object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object, 0)
                        Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object,doorID.locked)
                        SetEntityRotation(object, 0.0, 0.0, doorID.objYaw, 2, true)
                        if doorID.object2 ~= nil then
                            Citizen.CreateThread(function()
                                Citizen.InvokeNative(0xD99229FE93B46286,doorID.object2,1,1,0,0,0,0)
                            end)
                            object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object2, 0)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object2,doorID.locked)
                            SetEntityRotation(object, 0.0, 0.0, doorID.objYaw2, 2, true)
                        end
                    end
                else
                    if DoorSystemGetDoorState(doorID.object) ~= 0 then
                        Citizen.CreateThread(function()
                            Citizen.InvokeNative(0xD99229FE93B46286,doorID.object,1,1,0,0,0,0)
                        end)
                        Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object,doorID.locked)
                        if doorID.object2 ~= nil then
                            Citizen.CreateThread(function()
                                Citizen.InvokeNative(0xD99229FE93B46286,doorID.object2,1,1,0,0,0,0)
                            end)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object2,doorID.locked)
                        end
                    end
                end
            end
            if distance < maxDistance then
                DrawText3D(doorID.textCoords.x, doorID.textCoords.y, doorID.textCoords.z, " " ,doorID.locked)
                if Config.useitems == false then
                    if IsControlJustPressed(2, 0xC7B5340A) then -- Hold ENTRER
                        makeEntityFaceEntity(PlayerPedId(), doorID.textCoords , k )
                    end
                end
            end
        end
        if sleep then
            Citizen.Wait(1000)
        end
    end
end)

function makeEntityFaceEntity( entity1, coords , k)
    local p1 = GetEntityCoords(entity1, true)
    local p2 = coords
    local dx = p2.x - p1.x
    local dy = p2.y - p1.y
    local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading( entity1, heading )
    Wait(100)
    ClearPedTasks(ped)
    prop_name = 'P_KEY02X'
    local ped = entity1
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")
    local key = false
    if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
        local waiting = 0
        RequestAnimDict("script_common@jail_cell@unlock@key")
        while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                break
            end
        end
        Wait(100)
        TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
        Wait(750)
        AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
        key = true
        while key do
            if IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
                Wait(100)
            else
                ClearPedSecondaryTask(ped)
                DeleteObject(prop)
                RemoveAnimDict("script_common@jail_cell@unlock@key")
                key = false
                TriggerEvent("void_doorlocks:updatedoor", GetPlayerServerId(PlayerId()), k)
                break
            end
        end
    end
end

function makeEntityFaceEntity2( entity1, coords , k)
    local p1 = GetEntityCoords(entity1, true)
    local p2 = coords
    local dx = p2.x - p1.x
    local dy = p2.y - p1.y
    local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading( entity1, heading )
    Wait(100)
    ClearPedTasks(ped)
    prop_name = 'P_KEY02X'
    local ped = entity1
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")
    local key = false
    if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
        local waiting = 0
        RequestAnimDict("script_common@jail_cell@unlock@key")
        while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                break
            end
        end
        Wait(100)
        TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
        Wait(750)
        AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
        key = true
        while key do
            if IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
                Wait(100)
            else
                ClearPedSecondaryTask(ped)
                DeleteObject(prop)
                RemoveAnimDict("script_common@jail_cell@unlock@key")
                key = false
                TriggerServerEvent("void_doorlocks:updatedooritm", GetPlayerServerId(PlayerId()), k, lockbreak, function(cb) end)
                break
            end
        end
    end
end

RegisterNetEvent('void_doorlocks:opendoor')
AddEventHandler('void_doorlocks:opendoor', function(lockbreak, itm)
    local playerCoords = GetEntityCoords(PlayerPedId())
    for k,doorID in ipairs(Config.DoorList) do
        local distance
        if doorID.doors then
            distance = #(playerCoords - doorID.doors[1].objCoords)
        else
            distance = #(playerCoords - doorID.textCoords)
        end
        local maxDistance, displayText = 1.25, 'open'
        if doorID.distance then
            maxDistance = doorID.distance
        end
        if distance < maxDistance then
            if doorID.locked then
                if DoorSystemGetOpenRatio(doorID.object) ~= 0.0 then
                    DoorSystemSetOpenRatio(doorID.object, 0.0, true)
                    local object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object, 0)
                    SetEntityRotation(object, 0.0, 0.0, doorID.objYaw, 2, true)
                    if doorID.object2 ~= nil then
                        DoorSystemSetOpenRatio(doorID.object2, 0.0, true)
                        object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object2, 0)
                        SetEntityRotation(object, 0.0, 0.0, doorID.objYaw2, 2, true)
                    end
                end
                if DoorSystemGetDoorState(doorID.object) ~= 1 then
                    Citizen.CreateThread(function()
                        Citizen.InvokeNative(0xD99229FE93B46286,doorID.object,1,1,0,0,0,0)
                    end)
                    local object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object, 0)
                    Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object,doorID.locked)
                    SetEntityRotation(object, 0.0, 0.0, doorID.objYaw, 2, true)
                    if doorID.object2 ~= nil then
                        Citizen.CreateThread(function()
                            Citizen.InvokeNative(0xD99229FE93B46286,doorID.object2,1,1,0,0,0,0)
                        end)
                        object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object2, 0)
                        Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object2,doorID.locked)
                        SetEntityRotation(object, 0.0, 0.0, doorID.objYaw2, 2, true)
                    end
                end
            else
                if DoorSystemGetDoorState(doorID.object) ~= 0 then
                    Citizen.CreateThread(function()
                        Citizen.InvokeNative(0xD99229FE93B46286,doorID.object,1,1,0,0,0,0)
                    end)
                    Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object,doorID.locked)
                    if doorID.object2 ~= nil then
                        Citizen.CreateThread(function()
                            Citizen.InvokeNative(0xD99229FE93B46286,doorID.object2,1,1,0,0,0,0)
                        end)
                        Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object2,doorID.locked)
                    end
                end
            end
        end
        if Config.useitems and doorID.authorizedItem == itm and not lockbreak and distance <= maxDistance then
            makeEntityFaceEntity2(PlayerPedId(), doorID.textCoords , k)
        elseif Config.useitems and not lockbreak and doorID.authorizedItem ~= itm and distance <= maxDistance then
            TriggerEvent("vorp:TipBottom", "Mauvaise Cle !", 2000)
        end

        if  distance <= maxDistance and lockbreak == true and doorID.locked == false then
            TriggerEvent("vorp:TipBottom", "La Porte est deja OUVERTE !", 2000)
            
        elseif distance <= maxDistance and lockbreak == true and doorID.locked == true and doorID.canlockbreak then
            
            TriggerEvent('void_doorlocks:updatedoor', GetPlayerServerId(PlayerId()), k, lockbreak)
        elseif distance <= maxDistance and lockbreak == true and doorID.locked == true and doorID.canlockbreak == false then

            TriggerEvent("vorp:TipBottom", "Vous ne pouvez pas casser la serrure de cette porte!", 2000)
        end
    end
end)

RegisterNetEvent('void_doorlocks:updatedoor')
AddEventHandler('void_doorlocks:updatedoor', function(source, door, lockbreak)
    if not lockbreak then
        TriggerServerEvent("void_doorlocks:updatedoorsv", source, door, function(cb) end)
    else
        local ped = PlayerPedId()
        local isDead = IsPedDeadOrDying(PlayerPedId())
        if not isDead then
            local minigame = exports['lockpick']:lockpick()
            if not minigame then
                TriggerServerEvent("void_doorlocks:lockbreaker:break")
            else
                local anim = "mini_games@story@mud5@cracksafe_look_at_dial@small_r@ped"
                local open = "open"
                RequestAnimDict(anim)
                while not HasAnimDictLoaded(anim) do
                    Citizen.Wait(50)
                end
                TaskPlayAnim(ped, anim, open, 8.0, -8.0, -1, 32, 0, false, false, false)
                Citizen.Wait(1250)
                TriggerServerEvent("void_doorlocks:updatedoorbreak", source, door, function(cb) end)
            end
        else
            return
        end
    end
end)

RegisterNetEvent('void_doorlocks:changedoor')
AddEventHandler('void_doorlocks:changedoor', function(doorID)
    local name = Config.DoorList[doorID]
    name.locked = not name.locked
    TriggerServerEvent('void_doorlocks:updateState', doorID, name.locked, function(cb) end)
end)

function DrawText3D(x, y, z, text , state)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    if state then
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 255, 0, 0, 255, 0)
    else
        DrawSprite("inventory_items", "consumable_lock_breaker", _x, _y+0.0125, 0.04, 0.05, 0.1, 1, 255, 1, 255, 0)
    end
end

RegisterNetEvent('void_doorlocks:setState')
AddEventHandler('void_doorlocks:setState', function(doorID, state)
    Config.DoorList[doorID].locked = state
end)

--FixBankDoors / Turn on if you have a problems with Bank Doors.
local door_hashes = {
    -408139633,     -- Valentine Bank
    -1652509687,    -- Valentine Bank
    -1477943109,    -- Saint Denis Bank
    2089945615,     -- Saint Denis Bank
    -2136681514,    -- Saint Denis Bank
    1733501235,     -- Saint Denis Bank
    -977211145,     -- Rhodes Bank
    -1206757990,    -- Rhodes Bank
    531022111,      -- Blackwater Bank
    160636303,      -- Armadillo Bank
    -1669881355,    -- Rhodes Gunshop Basement Door
    340151973,      -- New Theater Door
    544106233,      -- New Theater Door
    94437577,       -- Strawberry Dressing Room
}

Citizen.CreateThread(function()
    for k,v in pairs(door_hashes) do 
        Citizen.InvokeNative(0xD99229FE93B46286,v,1,1,0,0,0,0)
        Citizen.InvokeNative(0x6BAB9442830C7F53,v,0) 
    end
end)

local doors_delete = {
    73503,
    5867812,
    5966884,
    5966372,
    5965092,
    2663716,
    6278948,
    6382116,
    5772068,
    6260516,
    5989668,
    5966628,
    5789476
}

Citizen.CreateThread(function()
    for k,v in pairs(doors_delete) do
        SetEntityAsMissionEntity(v, true, true)
        DeleteEntity(v)
    end
end)
