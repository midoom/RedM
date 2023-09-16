local Hangings = {}
local ped = PlayerPedId()

Citizen.CreateThread(function()
    while true do
        ped = PlayerPedId()
        local waitingTime = 800
        for k,v in ipairs(config.hanging_locations) do
            if (not Hangings[k]) then
                TriggerServerEvent("Hanging:AddNewRope", k)
            else
                local coords = GetEntityCoords(ped)
                local dist = #(coords - v.location)
                if (dist < 8.0) then
                    waitingTime = 5
                    local isHanging = (Hangings[k].hPlayers["pId"] ~= nil and Hangings[k].hPlayers["pId"] == GetServerId(ped))
                    local floorBoard = GetClosestObjectOfType(v.location, 3.0, -1923741333, false, 0, 0)
                    local lever = GetClosestObjectOfType(v.location, 3.0, -1539465244, false, 0, 0)
                    local leverCoords = GetEntityCoords(lever)
                    local floorboardCoords = GetEntityCoords(floorBoard)
                    local isTrapdoorOpen = IsEntityPlayingAnim(floorBoard, "script_re@public_hanging@lever", "pull_lever_deputy_trapdoor_val", 1)
                    local canClose = HasEntityAnimFinished(floorBoard, "script_re@public_hanging@lever", "pull_lever_deputy_trapdoor_val", 1)
                    if (IsControlJustPressed(0, 0xCEFD9220)) then
                        if (isTrapdoorOpen) then
                            if (canClose) then
                                StopEntityAnim(lever, "push_lever_deputy_lever", "script_re@public_hanging@lever", 1)
                                StopEntityAnim(floorBoard, "pull_lever_deputy_trapdoor_val", "script_re@public_hanging@lever", 1)
                                TriggerServerEvent("Hanging:SetTrapdoorStatus", k, false)
                            end
                        else
                            reqAnimDict("script_re@public_hanging@lever")-- TRAP DOOR
                            PlayEntityAnim(lever, "push_lever_deputy_lever", "script_re@public_hanging@lever", 1, 0, 1, 0, 0, 0); -- LEVER PUSHING OPENING
                            PlayEntityAnim(floorBoard, "pull_lever_deputy_trapdoor_val", "script_re@public_hanging@lever", 1, 0, 1, 0, 0, 0); -- TRAPDOOR OPENING
                            TriggerServerEvent("Hanging:SetTrapdoorStatus", k, true)
                        end
                    elseif (IsControlJustPressed(0, 0x24978A28)) then
                        if (isHanging) then
                            TriggerServerEvent("Hanging:RemovePlayer", k)
                        else
                            config["HANGING_PED"].requestDict()
                            SetEntityCoords(ped, (v.location - vector3(0.0,0.0,0.97)))
                            SetEntityHeading(ped, v.heading)
                            TaskPlayAnim(ped, config["HANGING_PED"].dict,config["HANGING_PED"].name, 1090519040, -1056964608, -1, 1, 0, 0, 0, 0, 0, 0)
                            reqModelHash(`p_jug01x`)
                            reqModelHash(357863945)
                            local object = CreateObject(`p_jug01x`, (v.location + v.ropeHang), 0, 1, 0, 0, 0)
                            local knot = CreateObject(357863945, GetEntityCoords(ped), 0, 1, 0, 0, 0)
                            SetEntityVisible(object, false)
                            local objCo = GetEntityCoords(object)
                            local rope = Citizen.InvokeNative(0xE9C59F6809373A99,objCo, 0, 0, 0, 1.35, 6, 1, 31, -1082130432)
                            print(ObjToNet(rope))
                            Citizen.InvokeNative(0xF092B6030D6FD49C, rope, "ROPE_SETTINGS_DEFAULT")
                            ActivatePhysics(rope)
                            Citizen.InvokeNative(0x462FF2A432733A44, rope, ped, object, 0.020, -0.11, 0.0, 0, 0, 0, "skel_head", 0)
                            Citizen.InvokeNative(0x3C6490D940FF5D0B, rope, 0, 0, 3.0, 0)
                            Citizen.InvokeNative(0x814D453FCFDF119F, rope, 1, -999)
                            FreezeEntityPosition(object, true)
                            AttachEntityToEntity(knot, ped, GetPedBoneIndex(ped, 21030), 0.0, -0.07, 0.015, 183, 88.5, -50.0, -1, 0, 1, 0, 0, 1, 1, 1065353216, 1065353216)
                            TriggerServerEvent("Hanging:AddPlayer", k, GetServerId(ped), rope ,ObjToNet(knot))
                        end
                    end
                    DrawText3D((leverCoords - vector3(0.0,0.0,1.0)), "Press [E] to " .. (isTrapdoorOpen and "close" or "open") .. " the trapdoor")
                    DrawText3D(floorboardCoords, "Press [H] to " .. (isHanging and "let yourself down" or "hang yourself"))
                end
            end
        end
        Citizen.Wait(waitingTime)
    end
end)

RegisterNetEvent("Hanging:GetInformation")
AddEventHandler("Hanging:GetInformation", function(i)
    Hangings = i
    print("Got new rope data")
end)
RegisterNetEvent("Hanging:PlayerRelease")
AddEventHandler("Hanging:PlayerRelease", function()
    for k,v in pairs(Hangings) do
        if (v.hPlayers["pId"] ~= nil and v.hPlayers["pId"] == GetServerId(ped)) then
            local ped = ped
            local rope = v.hPlayers["rId"]--Citizen.InvokeNative(0xEB1A4DD8352EC828, v.hPlayers["rId"])
            local knot = NetToObj(v.hPlayers["kId"])
            DetachEntity(knot)
            DeleteEntity(knot)
            ClearPedTasksImmediately(ped, 1,1)
            DetachRopeFromEntity(rope, ped)
            DeleteRope(rope)
        end
    end
end)
RegisterNetEvent("Hanging:LetTheHangingBegin")
AddEventHandler("Hanging:LetTheHangingBegin", function(i)
    if (Hangings[i].hPlayers ~= nil and Hangings[i].hPlayers["pId"] ~= nil) then
        if (Hangings[i].hPlayers["pId"] == GetServerId(ped) and Hangings[i].tDoorOpen) then
            Citizen.Wait(3300)
            SetPedToRagdoll(ped, 1000, 1000, 0, 0,0,0)
            KnockOffPedProp(ped, 0,1,0,0)
            Citizen.Wait(2000)
            -- Kill the player
            -- SetEntityHealth(PlayerPedId(), 0.0)
        end
    end
end)

function reqModelHash(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(1)
    end
end
function reqAnimDict(model)
    RequestAnimDict(model)
    while not HasAnimDictLoaded(model) do
        Citizen.Wait(5)
    end
end

function GetServerId(ped)
    for i=0, 255 do
        if (GetPlayerPed(i) == ped and NetworkIsPlayerActive(i)) then
            return GetPlayerServerId(i)
        end
    end
end

--[[
    Light Board: -1666207837
    Dark Board: -1923741333
    Lever: -1539465244
    Rope Around Neck: 357863945
    Lever Anim: push_lever_deputy_lever
]]

function DrawText3D(loc, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(loc.x,loc.y,loc.z+2)
    local dist = #(GetGameplayCamCoord() - vector3(loc.x,loc.y,loc.z+2))
    local scale = (1/dist) * 0.8
    local fov = (1/GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextColor(255, 255, 255, 255)
        Citizen.InvokeNative(0xADA9255D, 1)
        SetTextDropshadow(0, 0, 0, 0, 255)
        Citizen.InvokeNative(0xBE5261939FBECB8C,true)
        Citizen.InvokeNative(0xd79334a4bb99bad1, Citizen.InvokeNative(0xfa925ac00eb830b9, 10, "LITERAL_STRING", text, Citizen.ResultAsLong()), _x, _y)
    end
end