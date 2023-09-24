AddEventHandler('s:MenuClose', function()
    while inMenu do
        Wait(5)
        if IsControlJustReleased(0, 0x156F7119) then
            StopAnimTask(PlayerPedId(), "script_proc@robberies@coach@rhodes","waiting_01_alden")
            disconnect()
            inMenu = false
            MenuData.CloseAll()
            break
        end
    end
end)

RegisterNetEvent('s:ValCall', function()
    inMenu = true
    TriggerEvent('s:MenuClose')
    MenuData.CloseAll()

    local elements = {
        { label = _U("Blackwater"),     value = 'Blackwater',     desc = _U("blackwater_desc") },
        { label = _U("StDenis"),       value = 'StDenis',       desc = _U("stdenis_desc") },
        { label = _U("incomingcalls"),       value = 'incomingcalls',       desc = _U("incomingcallsdesc") }
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title =
                "<img style='max-height:5vh;max-width:7vh; float: left;text-align: center; margin-top: 4vh; position:relative; right: 8vh;' src='nui://s-phone/images/phone.png'>"
                .. "<div style='position: relative; right: 6vh; margin-top: 4vh;'>" .. _U("menuTitle") .. "</div>",
            align = 'top-left',
            elements = elements,
        },
        function(data)
            if data.current == 'backup' then
                _G[data.trigger]()
            end
            local selectedOption = {
                ['Blackwater'] = function()
                    anim()
                    TriggerEvent('bwsound')
                    bwincomingcalls()
                end,
                ['StDenis'] = function()
                    anim()
                    TriggerEvent('stsound')
                    stincomingcalls()
                end,
                ['incomingcalls'] = function()
                    anim()
                    valincomingcalls()
                end,
            }

            if selectedOption[data.current.value] then
                selectedOption[data.current.value]()
            end
        end)
end)

RegisterNetEvent('s:BWCall', function()
    inMenu = true
    TriggerEvent('s:MenuClose')
    MenuData.CloseAll()

    local elements = {
        { label = _U("Valentine"),     value = 'Valentine',     desc = _U("valentine_desc") },
        { label = _U("StDenis"),       value = 'StDenis',       desc = _U("stdenis_desc") },
        { label = _U("incomingcalls"),       value = 'incomingcalls',       desc = _U("incomingcallsdesc") }
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title =
                "<img style='max-height:5vh;max-width:7vh; float: left;text-align: center; margin-top: 4vh; position:relative; right: 8vh;' src='nui://s-phone/images/phone.png'>"
                .. "<div style='position: relative; right: 6vh; margin-top: 4vh;'>" .. _U("menuTitle") .. "</div>",
            align = 'top-left',
            elements = elements,
        },
        function(data)
            if data.current == 'backup' then
                _G[data.trigger]()
            end
            local selectedOption = {
                ['Valentine'] = function()
                    anim()
                    TriggerEvent('valsound')
                    valincomingcalls()
                end,
                ['StDenis'] = function()
                    anim()
                    TriggerEvent('stsound')
                    stincomingcalls()
                end,
                ['incomingcalls'] = function()
                    anim()
                    valincomingcalls()
                end,
            }

            if selectedOption[data.current.value] then
                selectedOption[data.current.value]()
            end
        end)
end)

RegisterNetEvent('s:StCall', function()
    inMenu = true
    TriggerEvent('s:MenuClose')
    MenuData.CloseAll()

    local elements = {
        { label = _U("Valentine"),     value = 'Valentine',     desc = _U("valentine_desc") },
        { label = _U("Blackwater"),     value = 'Blackwater',     desc = _U("blackwater_desc") },
        { label = _U("incomingcalls"),       value = 'incomingcalls',       desc = _U("incomingcallsdesc") }
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title =
                "<img style='max-height:5vh;max-width:7vh; float: left;text-align: center; margin-top: 4vh; position:relative; right: 8vh;' src='nui://s-phone/images/phone.png'>"
                .. "<div style='position: relative; right: 6vh; margin-top: 4vh;'>" .. _U("menuTitle") .. "</div>",
            align = 'top-left',
            elements = elements,
        },
        function(data, menu)
            if data.current == 'backup' then
                _G[data.trigger]()
            end
            local selectedOption = {
                ['Valentine'] = function()
                    anim()
                    TriggerEvent('valsound')
                    valincomingcalls()
                end,
                ['Blackwater'] = function()
                    anim()
                    TriggerEvent('bwsound')
                    bwincomingcalls()
                end,
                ['incomingcalls'] = function()
                    anim()
                    stincomingcalls()
                end,
            }

            if selectedOption[data.current.value] then
                selectedOption[data.current.value]()
        end

        end)
end)

RegisterNetEvent('s:valSheriff', function()
    inMenu = true
    TriggerEvent('s:MenuClose')
    MenuData.CloseAll()

    local elements = {
        { label = _U("StSherrif"),     value = 'STSherrif',     desc = _U("stSheriff_desc") },
        { label = _U("BlackwaterSherrif"),     value = 'BlackwaterSherrif',     desc = _U("blackwaterSheriff_desc") },
        { label = _U("incomingcalls"),       value = 'incomingcalls',       desc = _U("incomingcallsdesc") }
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title =
                "<img style='max-height:5vh;max-width:7vh; float: left;text-align: center; margin-top: 4vh; position:relative; right: 8vh;' src='nui://s-phone/images/phone.png'>"
                .. "<div style='position: relative; right: 6vh; margin-top: 4vh;'>" .. _U("menuTitlegov") .. "</div>",
            align = 'top-left',
            elements = elements,
        },
        function(data, menu)
            if data.current == 'backup' then
                _G[data.trigger]()
            end
            local selectedOption = {
                ['STSherrif'] = function()
                    anim()
                    TriggerEvent('stsherrif')
                    stsherrif()
                end,
                ['BlackwaterSherrif'] = function()
                    anim()
                    TriggerEvent('bwsheriff')
                    bwsherrif()
                end,
                ['incomingcalls'] = function()
                    anim()
                    valsherrif()
                end,
            }

            if selectedOption[data.current.value] then
                selectedOption[data.current.value]()
        end

        end)
end)


RegisterNetEvent('s:BwSheriff', function()
    inMenu = true
    TriggerEvent('s:MenuClose')
    MenuData.CloseAll()

    local elements = {
        { label = _U("StSherrif"),     value = 'STSherrif',     desc = _U("stSheriff_desc") },
        { label = _U("ValentineSherrif"),     value = 'ValentineSherrif',     desc = _U("valentineSheriff_desc") },
        { label = _U("incomingcalls"),       value = 'incomingcalls',       desc = _U("incomingcallsdesc") }
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title =
                "<img style='max-height:5vh;max-width:7vh; float: left;text-align: center; margin-top: 4vh; position:relative; right: 8vh;' src='nui://s-phone/images/phone.png'>"
                .. "<div style='position: relative; right: 6vh; margin-top: 4vh;'>" .. _U("menuTitlegov") .. "</div>",
            align = 'top-left',
            elements = elements,
        },
        function(data, menu)
            if data.current == 'backup' then
                _G[data.trigger]()
            end
            local selectedOption = {
                ['STSherrif'] = function()
                    anim()
                    TriggerEvent('stsherrif')
                    stsherrif()
                end,
                ['ValentineSherrif'] = function()
                    anim()
                    TriggerEvent('valsheriff')
                    valsherrif()
                end,
                ['incomingcalls'] = function()
                    anim()
                    bwsherrif()
                end,
            }

            if selectedOption[data.current.value] then
                selectedOption[data.current.value]()
        end

        end)
end)

RegisterNetEvent('s:StSheriff', function()
    inMenu = true
    TriggerEvent('s:MenuClose')
    MenuData.CloseAll()

    local elements = {
        { label = _U("BlackwaterSherrif"),     value = 'BlackwaterSherrif',     desc = _U("blackwaterSheriff_desc") },
        { label = _U("ValentineSherrif"),     value = 'ValentineSherrif',     desc = _U("valentineSheriff_desc") },
        { label = _U("incomingcalls"),       value = 'incomingcalls',       desc = _U("incomingcallsdesc") }
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title =
                "<img style='max-height:5vh;max-width:7vh; float: left;text-align: center; margin-top: 4vh; position:relative; right: 8vh;' src='nui://s-phone/images/phone.png'>"
                .. "<div style='position: relative; right: 6vh; margin-top: 4vh;'>" .. _U("menuTitlegov") .. "</div>",
            align = 'top-left',
            elements = elements,
        },
        function(data, menu)
            if data.current == 'backup' then
                _G[data.trigger]()
            end
            local selectedOption = {
                ['BlackwaterSherrif'] = function()
                    anim()
                    TriggerEvent('bwsheriff')
                    bwsherrif()
                end,
                ['ValentineSherrif'] = function()
                    anim()
                    TriggerEvent('valsheriff')
                    valsherrif()
                end,
                ['incomingcalls'] = function()
                    anim()
                    stsherrif()
                end,
            }

            if selectedOption[data.current.value] then
                selectedOption[data.current.value]()
        end

        end)
end)