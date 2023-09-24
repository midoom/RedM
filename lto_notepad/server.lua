local VorpCore = {}
local message = {}

VORP = exports.vorp_inventory:vorp_inventoryApi()

VORP.RegisterUsableItem("notepad", function(data)
TriggerClientEvent('lto_notepad:open', data.source)
end)

TriggerEvent("getCore",function(core)
VorpCore = core
end)

RegisterServerEvent("addNote")
AddEventHandler("addNote", function(note)
local _source = source
local Character = VorpCore.getUser(_source).getUsedCharacter
local steamname = GetPlayerName(_source)
local identifier = Character.identifier
local charidentifier = Character.charIdentifier
local note = note
exports.ghmattimysql:execute('INSERT INTO notepad (charidentifier, note) VALUES (@charidentifier, @note) ON DUPLICATE KEY UPDATE note = @note;',
{
charidentifier = charidentifier,
note = note,
})
end)

RegisterServerEvent("loadPlayerNotes")
AddEventHandler("loadPlayerNotes", function()
local _source = source
local Character = VorpCore.getUser(_source).getUsedCharacter
local charidentifier = Character.charIdentifier
local Parameters = { ['charidentifier'] = charidentifier }
exports.ghmattimysql:execute( "SELECT n.*, c.name FROM notepad n INNER JOIN characters c ON n.charidentifier = c.charIdentifier WHERE n.charidentifier = @charidentifier ORDER BY n.timestamp DESC LIMIT 10", Parameters, function(result)
if result[1] ~= nil then
message = {}
for i=1, #result, 1 do
table.insert(message, {note = result[i].note, name = result[i].name, timestamp = result[i].timestamp})
end
else
message = {}
end
-- Trigger the client event to display the messages
TriggerClientEvent("MessageHandler", _source, message)
end)
end)

RegisterServerEvent("deleteAll")
AddEventHandler("deleteAll", function()
local _source = source
local Character = VorpCore.getUser(_source).getUsedCharacter
local charidentifier = Character.charIdentifier
local Parameters = { ['charidentifier'] = charidentifier }
exports.ghmattimysql:execute( "DELETE FROM notepad WHERE charidentifier = @charidentifier", Parameters, function(result)
end)
end)

-- add function to give notepad to another player	
RegisterServerEvent("giveNotepad")
-- Define an event handler function for the "giveNotepad" event
AddEventHandler("giveNotepad", function(playerId, targetId)
    -- Check if the target player exists
    if DoesEntityExist(GetPlayerPed(targetId)) then
        -- Get the names of the players
        local playerName = GetPlayerName(playerId)
        local targetName = GetPlayerName(targetId)

        -- Get the character data for the target player
        local Character = VorpCore.getUser(targetId).getUsedCharacter
        local charidentifier = Character.charIdentifier

        -- Define the parameters for the database query
        local Parameters = { ['charidentifier'] = charidentifier }

        -- Execute the database query
        exports.ghmattimysql:execute("SELECT n.*, c.name FROM notepad n INNER JOIN characters c ON n.charidentifier = c.charIdentifier WHERE n.charidentifier = @charidentifier ORDER BY n.timestamp DESC LIMIT 10", Parameters, function(result)
            -- Check if the query returned any results
            if result[1] ~= nil then
                -- Store the results in the message table
                message = {}
                for i=1, #result, 1 do
                    table.insert(message, {note = result[i].note, name = result[i].name, timestamp = result[i].timestamp})
                end
            else
                -- If the query returned no results, create an empty message table
                message = {}
            end
        end)
    end
end)
