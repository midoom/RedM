Citizen.CreateThread(function()
    while true do 
        local playerActive = Citizen.InvokeNative(0xB8DFD30D6973E135, PlayerId(), Citizen.ResultAsInteger())
        if playerActive then 
			Citizen.Wait(100)
            TriggerServerEvent('LoadisInjured:check')
            break
        end
        Wait(10)
    end
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    local injured = 1
    TriggerServerEvent('LoadisInjured:player', injured)
end)

RegisterNetEvent("vorp:injuredinplayers")
AddEventHandler("vorp:injuredinplayers", function(injured)
  local chanceInjured = math.random(1, 55)
    Citizen.CreateThread(function()
        if chanceInjured >= 8 then
            TriggerEvent("vorp:NotifyLeft", '~t6~VIRUS', '~e~Vous êtes malade', 'generic_textures', 'tick', 4000)
            Injuredtrue = false
            while Injuredtrue do 
                Wait(50000)
                if tonumber(injured) == 1 then
                    Citizen.InvokeNative(0x4102732DF6B4005F,"PlayerDrunk01_PassOut", 0, true)
                    Citizen.Wait(20000*3)
                    Citizen.InvokeNative(0xB4FD7446BAB2F394,"PlayerDrunk01_PassOut")
                    Citizen.Wait(500000)
                    Citizen.InvokeNative(0x4102732DF6B4005F,"PlayerDrunk01_PassOut", 0, true)
                    Citizen.Wait(20000*3)
                    Citizen.InvokeNative(0xB4FD7446BAB2F394,"PlayerDrunk01_PassOut")
                    Citizen.Wait(500000)
                    Citizen.InvokeNative(0x4102732DF6B4005F,"PlayerDrunk01_PassOut", 0, true)
                    Citizen.Wait(20000*3)
                    Citizen.InvokeNative(0xB4FD7446BAB2F394,"PlayerDrunk01_PassOut")
                    Citizen.Wait(500000)
                    Citizen.InvokeNative(0x4102732DF6B4005F,"PlayerDrunk01_PassOut", 0, true)
                    Citizen.Wait(20000*3)
                    Citizen.InvokeNative(0xB4FD7446BAB2F394,"PlayerDrunk01_PassOut")
                end
            end
        else
            Citizen.InvokeNative(0xB4FD7446BAB2F394,"PlayerDrunk01_PassOut")
        end
    end)
end)

RegisterNetEvent("vorp:notinjuredinplayers")
AddEventHandler("vorp:notinjuredinplayers", function(injured)
    Citizen.CreateThread(function()
        Injuredtrue = false
        while true do 
            Citizen.Wait(5000)
            if tonumber(injured) == 0 then
                Citizen.InvokeNative(0xB4FD7446BAB2F394,"PlayerDrunk01_PassOut")
            end
        end
    end)
end)

RegisterNetEvent("DVR_Injuredstartremede")
AddEventHandler("DVR_Injuredstartremede", function()
    local injured = 0
    TriggerServerEvent('LoadisInjuredUpdate:player', injured)
    TriggerEvent("vorp:NotifyLeft", '~t6~VIRUS', '~e~Vous n\'êtes plus malade', 'generic_textures', 'tick', 4000)
end)


