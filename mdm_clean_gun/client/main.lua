local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)


local isFirstPerson = false

function isFirstPersonCameraActive()
    return Citizen.InvokeNative(0xA24C1D341C6E0D53, 0, 0, 0) 
end


function setFirstPersonCamera()
    if not isFirstPerson then
        Citizen.InvokeNative(0xD1BA66940E94C547)
        isFirstPerson = true
    end
end


function setThirdPersonCamera()
    if isFirstPerson then
        Citizen.InvokeNative(0x5A43C76F7FC7BA5F) 
        isFirstPerson = false
    end
end


RegisterNetEvent('nettoyage:cleangun')
AddEventHandler('nettoyage:cleangun', function()
    local ped = PlayerPedId()
    local Cloth = CreateObject(GetHashKey('s_balledragcloth01x'), GetEntityCoords(PlayerPedId()), false, true, false, false, true)
    local PropId = GetHashKey("CLOTH")
    local actshort = GetHashKey("SHORTARM_CLEAN_ENTER")
    local actlong = GetHashKey("LONGARM_CLEAN_ENTER")
    local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), false, weaponHash, false)
    local model = GetWeapontypeGroup(weaponHash)
    local object = GetObjectIndexFromEntityIndex(GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0))
    
    setFirstPersonCamera() 

    TaskReloadWeapon(ped, false)
    SetCurrentPedWeapon(ped, weaponHash, true, 0, 1, 0)    
    TaskSwapWeapon(ped)

    if retval ~= nil then
        if model == 416676503 or model == -1101297303 then
            Citizen.InvokeNative(0x72F52AA2D2B172CC, PlayerPedId(), 1242464081, Cloth, PropId, actshort, 1, 0, -1.0)
            Wait(15000)
            Citizen.InvokeNative(0xA7A57E89E965D839, object, 0.0, 0)
            Citizen.InvokeNative(0x812CE61DEBCAB948, object, 0.0, 0)
        else
            Citizen.InvokeNative(0x72F52AA2D2B172CC, PlayerPedId(), 1242464081, Cloth, PropId, actlong, 1, 0, -1.0)
            Wait(15000)
            Citizen.InvokeNative(0xA7A57E89E965D839, object, 0.0, 0)
            Citizen.InvokeNative(0x812CE61DEBCAB948, object, 0.0, 0)
        end
    end

    setThirdPersonCamera()
end)
