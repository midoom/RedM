---------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------- Server File (This is code that is run globally on the server) ----------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------


---------------- Initialize Vorpcore ----------------
local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterServerEvent("Joker:ElectricChair:CheckJob")
AddEventHandler("Joker:ElectricChair:CheckJob", function()
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    TriggerClientEvent('Joker:ElectricChair:ReturnJob', _source, Character.job)
end)

RegisterServerEvent("Joker:ElectricChair:MakePrisonerSit")
AddEventHandler("Joker:ElectricChair:MakePrisonerSit", function(closestPlayer, ClosestPlayers, PrisoneiroSource, PrisoneiroPed)
    local PlayersSource = ClosestPlayers
    for _,__ in pairs(PlayersSource) do
        TriggerClientEvent('Joker:ElectricChair:SyncChairAnim', __, PrisoneiroPed)
    end
    TriggerClientEvent('Joker:ElectricChair:SitInChair', closestPlayer)
end)

RegisterServerEvent("Joker:ElectricChair:SyncFX")
AddEventHandler("Joker:ElectricChair:SyncFX", function(ClosestPlayers, PrisoneiroPed)
    local PlayersSource = ClosestPlayers
    for _,__ in pairs(PlayersSource) do
        TriggerClientEvent('Joker:ElectricChair:SyncedFX', __, PrisoneiroPed)
    end
end)

RegisterServerEvent("Joker:ElectricChair:Matar")
AddEventHandler("Joker:ElectricChair:Matar", function(ClosestPlayer)
    TriggerClientEvent('Joker:ElectricChair:Matame', ClosestPlayer)
end)