local CurrentHangings = {}
--[[
    CurrentHangings[ropeIndex] = {
        hPlayers = {
            pId = Player Id,
            rId = Rope Network Id,
            kId = Noose Object Network Id
        },
        tDoorOpen = Wether the trapdoor is open or not.
    }
]]

RegisterServerEvent("Hanging:AddPlayer")
RegisterServerEvent("Hanging:RemovePlayer")
RegisterServerEvent("Hanging:SetTrapdoorStatus")
RegisterServerEvent("Hanging:Refresh")
RegisterServerEvent("Hanging:AddNewRope")

AddEventHandler("Hanging:AddPlayer", function(rIndex, pSource, ropeId, knotId)
    if not (CurrentHangings[rIndex]) then CurrentHangings[rIndex] = {hPlayers = {}, tDoorOpen = false} end
    print(ropeId, knotId)
    CurrentHangings[rIndex].hPlayers = {
        pId = pSource,
        rId = ropeId,
        kId = knotId
    }
    TriggerEvent("Hanging:Refresh")
    print("Added "..tostring(pSource).." | Rope Index " .. tostring(rIndex))
end)
AddEventHandler("Hanging:AddNewRope", function(rIndex)
    if not (CurrentHangings[rIndex]) then CurrentHangings[rIndex] = {hPlayers = {}, tDoorOpen = false} end
    TriggerEvent("Hanging:Refresh")
    print("Created new rope | Index " .. tostring(rIndex))
end)
AddEventHandler("Hanging:RemovePlayer", function(rIndex)
    if not (CurrentHangings[rIndex]) then CurrentHangings[rIndex] = {hPlayers = {}, tDoorOpen = false} end
    print("Removed "..tostring(CurrentHangings[rIndex].hPlayers["pId"]).." | Rope Index " .. tostring(rIndex))
    TriggerClientEvent("Hanging:PlayerRelease", CurrentHangings[rIndex].hPlayers["pId"])
    CurrentHangings[rIndex].hPlayers = {}
    TriggerEvent("Hanging:Refresh")
end)
AddEventHandler("Hanging:SetTrapdoorStatus", function(rIndex, tDStatus)
    if not (CurrentHangings[rIndex]) then CurrentHangings[rIndex] = {hPlayers = {}, tDoorOpen = false} end
    CurrentHangings[rIndex].tDoorOpen = tDStatus
    TriggerEvent("Hanging:Refresh")
    TriggerClientEvent("Hanging:LetTheHangingBegin", -1, rIndex)
    print("Set trapdoor status: "..tostring(tDStatus).." | Rope Index " .. tostring(rIndex))
end)
AddEventHandler("Hanging:Refresh", function()
    TriggerClientEvent("Hanging:GetInformation", -1, CurrentHangings)
end)