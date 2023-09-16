Citizen.CreateThread(function()
    for v = 1, #Config.Zones, 1 do
        Citizen.InvokeNative(0x563FCB6620523917, Config.Zones[v].Hash, GetHashKey(Config.Zones[v].Color));
    end
end)

--Test
--[[local wanted_region_is_activated = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsDisabledControlJustPressed(0, 0x17BEC168) then  -- pressed E
            for v = 1, #Config.Zones, 1 do
                if not wanted_region_is_activated then
                    -- apply wanted region blip
                    Citizen.InvokeNative(0x563FCB6620523917, Config.Zones[v].Hash, GetHashKey(Config.Zones[v].Color));
                    wanted_region_is_activated = true
                else
                    -- remove wanted region blip
                    Citizen.InvokeNative(0x6786D7AFAC3162B3, Config.Zones[v].Hash);
                    wanted_region_is_activated = false
                end
            end
        end
    end
end)]]