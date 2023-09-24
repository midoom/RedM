local robbing = false
local lastRobberyTime = 0
local robberyCooldown = 60000 -- 1-minute cooldown in milliseconds

local messages = {
    startRobbery = "You have started robbing this bank!",
    cooldownMessage = "You must wait another %s minutes before you can rob again.",
    lockpickSuccess = "You successfully lockpicked the bank!",
    lockpickFail = "Lockpicking the bank failed.",
}

-- Function to draw text on the screen
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    Citizen.InvokeNative(0xADA9255D, 1)
    DisplayText(str, x, y)
end

-- RegisterNetEvent for Starting Robbery
RegisterNetEvent('StartRobbing')
AddEventHandler('StartRobbing', function()    
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local currentTime = GetGameTimer()

    if IsPlayerDead(PlayerId()) then
        -- Player is dead, prevent robbery
        TriggerEvent("vorp:Tip", "You cannot start a robbery while dead.", 5000)
        return
    end
    
    local isNearBank = IsNearBank()

    if isNearBank and not robbing and (currentTime - lastRobberyTime) >= robberyCooldown then
        robbing = true
        TriggerEvent("vorp:Tip", messages.startRobbery, 5000)
        Citizen.Wait(5000)
        
        robbing = false
        lastRobberyTime = currentTime

        local lockpickResult = LockpickBank() -- Attempt to lockpick the bank
        if lockpickResult then
            -- Lockpick was successful, give a reward here
            TriggerServerEvent("mlpayout") -- Restore the "mlpayout" event for adding gold/money
            TriggerEvent("vorp:Tip", messages.lockpickSuccess, 5000)
        else
            -- Lockpick failed
            TriggerEvent("vorp:Tip", messages.lockpickFail, 5000)
        end
    elseif (currentTime - lastRobberyTime) < robberyCooldown then
        local remainingCooldown = math.ceil((robberyCooldown - (currentTime - lastRobberyTime)) / 60000) -- Convert milliseconds to minutes
        local cooldownMessage = string.format(messages.cooldownMessage, remainingCooldown)
        TriggerEvent("vorp:Tip", cooldownMessage, 5000)
    end
end)

-- Function to check if player is near a bank
function IsNearBank()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    for _, bank in pairs(Config.Banks) do
        local betweencoords = GetDistanceBetweenCoords(coords, bank.coords.x, bank.coords.y, bank.coords.z, true)
        if betweencoords < 2.0 then
            return true
        end
    end
    
    return false
end

-- Function to simulate lockpicking, returns true for success, false for failure
function LockpickBank()
    local lockpickSkill = exports["lockpick"]:lockpick() -- Use the lockpick resource to start the lockpick mini-game
    return lockpickSkill
end

-- Bank markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        
        for _, bank in pairs(Config.Banks) do
            local betweencoords = GetDistanceBetweenCoords(coords, bank.coords.x, bank.coords.y, bank.coords.z, true)
            if betweencoords < 2.0 then
                DrawTxt(Config["Rob" .. bank.name], 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
                if IsControlJustReleased(0, 0xC7B5340A) then
                    TriggerServerEvent("lockpick", function()
                    end)
                end
            end
        end
    end
end)
