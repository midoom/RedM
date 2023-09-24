RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
TriggerEvent('valDirectory')
TriggerEvent('BwDirectory')
TriggerEvent('StDirectory')
TriggerEvent('ValShDirectory')
TriggerEvent('BwShDirectory')
TriggerEvent('StShDirectory')
end)


RegisterNetEvent('valDirectory', function()
    local PromptGroup = VORPutils.Prompts:SetupPromptGroup()
    local firstprompt = PromptGroup:RegisterPrompt(_U("openDirectory"), 0x760A9C6F, 1, 1, true, 'hold',
        { timedeventhash = "MEDIUM_TIMED_EVENT" })
    while true do
        Wait(5)
        local sleep = true
        local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
            if GetDistanceBetweenCoords(-187.7973, 626.8018, 114.0321, px, py, pz, true) < 2 then
                sleep = false
                PromptGroup:ShowGroup(_U("info"))
                if firstprompt:HasCompleted() then
                    TriggerEvent('s:ValCall')
                end
            end
        end
        if sleep then
            Wait(1500)
        end
    end)


    RegisterNetEvent('BwDirectory', function()
    local PromptGroup = VORPutils.Prompts:SetupPromptGroup()
    local firstprompt = PromptGroup:RegisterPrompt(_U("openDirectory"), 0x760A9C6F, 1, 1, true, 'hold',
        { timedeventhash = "MEDIUM_TIMED_EVENT" })
    while true do
        Wait(5)
        local sleep = true
        local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
            if GetDistanceBetweenCoords(-869.7830, -1328.0912, 43.9500, px, py, pz, true) < 2 then
                sleep = false
                PromptGroup:ShowGroup(_U("info"))
                if firstprompt:HasCompleted() then
                    TriggerEvent('s:BWCall')
                end
            end
        end
        if sleep then
            Wait(1500)
        end
    end)

    RegisterNetEvent('StDirectory', function()
        local PromptGroup = VORPutils.Prompts:SetupPromptGroup()
        local firstprompt = PromptGroup:RegisterPrompt(_U("openDirectory"), 0x760A9C6F, 1, 1, true, 'hold',
            { timedeventhash = "MEDIUM_TIMED_EVENT" })
        while true do
            Wait(5)
            local sleep = true
            local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
                if GetDistanceBetweenCoords(2739.1714, -1395.1139, 46.1831, px, py, pz, true) < 2 then
                    sleep = false
                    PromptGroup:ShowGroup(_U("info"))
                    if firstprompt:HasCompleted() then
                        TriggerEvent('s:StCall')
                    end
                end
            end
            if sleep then
                Wait(1500)
            end
        end)

        RegisterNetEvent('ValShDirectory', function()
            local PromptGroup = VORPutils.Prompts:SetupPromptGroup()
            local firstprompt = PromptGroup:RegisterPrompt(_U("openDirectory"), 0x760A9C6F, 1, 1, true, 'hold',
                { timedeventhash = "MEDIUM_TIMED_EVENT" })
            while true do
                Wait(5)
                local sleep = true
                local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
                    if GetDistanceBetweenCoords(-273.2441, 803.2582, 119.3494, px, py, pz, true) < 2 then
                        sleep = false
                        PromptGroup:ShowGroup(_U("infogoverment"))
                        if firstprompt:HasCompleted() then
                            TriggerServerEvent('s:checkvaljob')
                        end
                    end
                end
                if sleep then
                    Wait(1500)
                end
            end)

            RegisterNetEvent('BwShDirectory', function()
                local PromptGroup = VORPutils.Prompts:SetupPromptGroup()
                local firstprompt = PromptGroup:RegisterPrompt(_U("openDirectory"), 0x760A9C6F, 1, 1, true, 'hold',
                    { timedeventhash = "MEDIUM_TIMED_EVENT" })
                while true do
                    Wait(5)
                    local sleep = true
                    local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
                        if GetDistanceBetweenCoords(-756.2975, -1266.0258, 44.0477, px, py, pz, true) < 2 then
                            sleep = false
                            PromptGroup:ShowGroup(_U("infogoverment"))
                            if firstprompt:HasCompleted() then
                                TriggerServerEvent('s:checkbwjob')
                            end
                        end
                    end
                    if sleep then
                        Wait(1500)
                    end
                end)

            RegisterNetEvent('StShDirectory', function()
                local PromptGroup = VORPutils.Prompts:SetupPromptGroup()
                local firstprompt = PromptGroup:RegisterPrompt(_U("openDirectory"), 0x760A9C6F, 1, 1, true, 'hold',
                    { timedeventhash = "MEDIUM_TIMED_EVENT" })
                while true do
                    Wait(5)
                    local sleep = true
                    local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
                        if GetDistanceBetweenCoords(2492.6750, -1308.6676, 48.8658, px, py, pz, true) < 2 then
                            sleep = false
                            PromptGroup:ShowGroup(_U("infogoverment"))
                            if firstprompt:HasCompleted() then
                                TriggerServerEvent('s:checkstjob')
                            end
                        end
                    end
                    if sleep then
                        Wait(1500)
                    end
                end)

                


local musicId
local playing = false
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    musicId = "music_id_" .. PlayerPedId()
    local pos
    while true do
        Citizen.Wait(100)
        if xSound:soundExists(musicId) and playing then
            if xSound:isPlaying(musicId) then
                pos = vector3(-187.7973, 626.8018, 114.0321)
                TriggerServerEvent("soundStatus", "position", musicId, { position = pos })
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

RegisterNetEvent("soundStatus")
AddEventHandler("soundStatus", function(type, musicId, data)
    if type == "position" then
        if xSound:soundExists(musicId) then
            xSound:Position(musicId, data.position)
        end
    end

    if type == "play" then
        xSound:PlayUrlPos(musicId, data.link, 1, data.position)
        xSound:Distance(musicId, 50)
        xSound:setVolume(musicId, 0.3) 
    end
end)

RegisterNetEvent('valsound', function()
    local pos = vector3(-187.7973, 626.8018, 114.0321)
    playing = true
    TriggerServerEvent("soundStatus", "play", musicId, { position = pos, link = "https://www.youtube.com/watch?v=N2jZmXePKV0" })
end, false)

RegisterNetEvent('bwsound', function()
    local pos = vector3(-756.2975, -1266.0258, 44.0477)
    playing = true
    TriggerServerEvent("soundStatus", "play", musicId, { position = pos, link = "https://www.youtube.com/watch?v=N2jZmXePKV0" })
end, false)

RegisterNetEvent('stsound', function()
    local pos = vector3(2739.1714, -1395.1139, 46.1831)
    playing = true
    TriggerServerEvent("soundStatus", "play", musicId, { position = pos, link = "https://www.youtube.com/watch?v=N2jZmXePKV0" })
end, false)

RegisterNetEvent('valsheriff', function()
    local pos = vector3(-273.2441, 803.2582, 119.3494)
    playing = true
    TriggerServerEvent("soundStatus", "play", musicId, { position = pos, link = "https://www.youtube.com/watch?v=N2jZmXePKV0" })
end, false)

RegisterNetEvent('bwsheriff', function()
    local pos = vector3(-757.8860, -1265.6257, 44.0413)
    playing = true
    TriggerServerEvent("soundStatus", "play", musicId, { position = pos, link = "https://www.youtube.com/watch?v=N2jZmXePKV0" })
end, false)

RegisterNetEvent('stsherrif', function()
    local pos = vector3(2492.6750, -1308.6676, 48.8658)
    playing = true
    TriggerServerEvent("soundStatus", "play", musicId, { position = pos, link = "https://www.youtube.com/watch?v=N2jZmXePKV0" })
end, false)

