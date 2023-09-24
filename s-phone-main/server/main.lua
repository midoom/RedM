local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterServerEvent("s:checkvaljob")
AddEventHandler("s:checkvaljob", function()
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local job = Character.job
    for k,v in pairs(Config.Job) do
        if job == v.Job then
            TriggerClientEvent('s:valSheriff', _source)
        else
            TriggerClientEvent("vorp:TipRight", _source, _U("nothave"), 4000) 
        end
    end
end)

RegisterServerEvent("s:checkbwjob")
AddEventHandler("s:checkbwjob", function()
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local job = Character.job
    for k,v in pairs(Config.Job) do
        if job == v.Job then
            TriggerClientEvent('s:BwSheriff', _source)
        else
            TriggerClientEvent("vorp:TipRight", _source, _U("nothave"), 4000) 
        end
    end
end)


RegisterServerEvent("s:checkstjob")
AddEventHandler("s:checkstjob", function()
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local job = Character.job
    for k,v in pairs(Config.Job) do
        if job == v.Job then
            TriggerClientEvent('s:StSheriff', _source)
        else
            TriggerClientEvent("vorp:TipRight", _source, _U("nothave"), 4000) 
        end
    end
end)


RegisterNetEvent("soundStatus")
AddEventHandler("soundStatus", function(type, musicId, data)
    TriggerClientEvent("soundStatus", -1, type, musicId, data)
end)
