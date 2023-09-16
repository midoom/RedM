Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(1)
            local player = PlayerPedId()
    
            local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, player)
    
            if hogtied then
                DisableControlAction(0, 0x295175BF, true)
            end
        end
end)

