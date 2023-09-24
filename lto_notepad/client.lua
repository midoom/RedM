local display = false
local t = {}

-- add context menu option to give notepad to another player

local notepadContext = {
    title = "Give Notepad",
    callback = "giveNotepad"
    }
    
    VORP.addInventoryContext("notepad", notepadContext)
    
    function giveNotepad(player, data)
    local playerId = player
    local targetId = data.target
    if DoesEntityExist(GetPlayerPed(targetId)) then
    TriggerServerEvent("giveNotepad", playerId, targetId)
    else
    exports.pNotify:SendNotification({text = "This player does not exist", type = "error", queue = "left", timeout = 2000, layout = "centerRight"})
    end
    end
    
RegisterCommand("tvyt", function(source, args)
local playerPed = PlayerPedId()
TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_WRITE_NOTEBOOK'), -1, true, false, false, false)
if args[1] == "open" then -- these args are pretty useless ngl
SetGui(true)
print("open")
elseif args[1] == "close" then
SetGui(false)
else
SetGui(not display)
end
end)

RegisterNetEvent('lto_notepad:open')
AddEventHandler('lto_notepad:open', function()
TriggerServerEvent("LoadUserNote")
--ExecuteCommand('tvyt')

end)

RegisterNetEvent("MessageHandler")
AddEventHandler("MessageHandler", function(mex)
t = mex
updateNotes(t)
SetGui(not display)

end)

RegisterNetEvent('lto_notepad:close')
AddEventHandler('lto_notepad:close', function()
ClearPedTasksImmediately(PlayerPedId(), true, true)
end)

RegisterNUICallback('exit', function(data)
updateNotes(t)
SetGui(false)
TriggerEvent("lto_notepad:close")
end)

RegisterNUICallback('error', function(data)
updateNotes(t)
SetGui(false)
end)

RegisterNUICallback('save', function(data)
SetGui(false)
table.insert(t, data.main)
TriggerServerEvent("AddNote", data.main)
updateNotes(t)
TriggerEvent("lto_notepad:close")
end)

RegisterNUICallback('clear', function(data)
SetGui(false)
t = {}
updateNotes(t)
TriggerServerEvent("DeleteAll")
TriggerEvent("lto_notepad:close")
end)

RegisterNUICallback('give', function(data)
SetGui(false)
giveNotepad(PlayerId(), data.id)
end)

--[[ function dump(o)
if type(o) == 'table' then
local s = '{ '
for k,v in pairs(o) do
if type(k) ~= 'number' then k = '"'..k..'"' end
s = s .. '['..k..'] = ' .. dump(v) .. ','
end
return s .. '} '
else
return tostring(o)
end
end ]]

function SetGui(enable)
SetNuiFocus(enable, enable)
display = enable
SendNUIMessage({
    type = "ui",
    enable = enable,
    data = t,

})

end

function table.length(tbl)
local cnt = 0