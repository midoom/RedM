

function InitMarkets() 
    for i,v in pairs(Config.locations) do 
        local x,y,z,h = v.coords.x, v.coords.y, v.coords.z, v.coords.h
        local hashModel = GetHashKey(v.npcmodel) 
        if IsModelValid(hashModel) then 
            RequestModel(hashModel)
            while not HasModelLoaded(hashModel) do                
                Wait(100)
            end
        end        

        local npc = CreatePed(hashModel, x, y, z, h, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) 
        SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        Wait(1000)
        FreezeEntityPosition(npc, true) 
        SetBlockingOfNonTemporaryEvents(npc, true) 

        if v.blip then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, x, y, z) 
            SetBlipSprite(blip, v.blipSprite, true) 
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.marketName) 
        end
    end
end


function IsPlayerNearCoords(x, y, z, dst)
    local playerPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)

    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, x, y, z, true)

    if distance < dst then
        return true
    end
    return false
end



