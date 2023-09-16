
local Babyout = false
local EndPrompt
local BabyGroup = GetRandomIntInRange(0, 0xffffff)
local BabyObj

function CreateBaby()
    if BabyObj ~= nil then
        DeleteEntity(BabyObj)
        SetEntityAsNoLongerNeeded(BabyObj)
        BabyObj = nil
    end
    local pedp = PlayerPedId()
    local pc = GetEntityCoords(pedp)
    local model = Config.Baby.model
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end

    local boneIndex
    local Attach
    if IsPedMale(pedp) then 
        boneIndex = Config.Baby.male.BoneIndex
        Attach = Config.Baby.male.Attach
    else
        boneIndex = Config.Baby.female.BoneIndex
        Attach = Config.Baby.female.Attach
    end

    BabyObj = CreateObject(model, pc.x,pc.y,pc.z, true, true, true)
    AttachEntityToEntity(BabyObj, pedp, boneIndex, Attach[1], Attach[2], Attach[3], Attach[4], Attach[5], Attach[6], false, false, false, true, 2, true)
    SetModelAsNoLongerNeeded(model)

    if not HasAnimDictLoaded(Config.Baby.anim[1]) then 
        RequestAnimDict(Config.Baby.anim[1])
        while not HasAnimDictLoaded(Config.Baby.anim[1]) do 
            Citizen.Wait(1)
        end
    end

    TaskPlayAnim(pedp, Config.Baby.anim[1], Config.Baby.anim[2], 5.0, 5.0, -1, 31, 0)
    Citizen.Wait(100)
    RemoveAnimDict(Config.Baby.anim[1])
end

function EndBaby()
    if Babyout == true then
        if BabyObj ~= nil then
            DeleteEntity(BabyObj)
            SetEntityAsNoLongerNeeded(BabyObj)
            BabyObj = nil
        end
        ClearPedTasksImmediately(PlayerPedId())
        Babyout = false
        return
    end
end

function SetupBabyPrompt()
        local str2 = Config.Prompts.StopName
        EndPrompt = PromptRegisterBegin()
        PromptSetControlAction(EndPrompt, Config.Prompts.StopPrompt) 
        str2 = CreateVarString(10, 'LITERAL_STRING', str2)
        PromptSetText(EndPrompt, str2)
        PromptSetEnabled(EndPrompt, 1)
        PromptSetVisible(EndPrompt, 1)
		PromptSetStandardMode(EndPrompt,1)
		PromptSetGroup(EndPrompt, BabyGroup)
		Citizen.InvokeNative(0xC5F428EE08FA7F2C,EndPrompt,true)
		PromptRegisterEnd(EndPrompt)
end

Citizen.CreateThread(function() --
    SetupBabyPrompt()
	while true do
		local t = 5
		if Babyout == true then
            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Prompts.Title)
            PromptSetActiveGroupThisFrame(BabyGroup, label)
            DisableControlAction(0, 0x8FFC75D6, 1)
            DisableControlAction(0, 0xD9D0E1C0, 1)

            if Citizen.InvokeNative(0xC92AC953F0A982AE,EndPrompt) then
                EndBaby()
            end
            if IsPedSwimming(PlayerPedId()) or IsPedFalling(PlayerPedId()) or IsEntityDead(PlayerPedId()) then
                EndBaby()
            end
        else
            t = 2000
        end
        Citizen.Wait(t)
    end
end)


RegisterNetEvent('ricx_Baby:start')
AddEventHandler('ricx_Baby:start', function()
    local playerp = PlayerPedId()
    if  not IsEntityDead(playerp) and Babyout == false and GetMount(playerp) == 0 and not IsPedSwimming(playerp) and not IsPedClimbing(playerp) and not IsPedFalling(playerp) then
        Babyout = true
        CreateBaby()
    else
        TriggerEvent("Notification:left_Baby", Config.Messages.Title, Config.Messages.NoBaby, 'menu_textures', 'stamp_locked_rank', 3000)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    if Babyout == true then
        if BabyObj ~= nil then
            DeleteObject(BabyObj)        
            SetObjectAsNoLongerNeeded(BabyObj)
            ClearPedTasksImmediately(PlayerPedId())
            BabyObj = nil
        end
    end
    PromptDelete(EndPrompt)
end)

--Basic Notification
RegisterNetEvent('Notification:left_Baby')
AddEventHandler('Notification:left_Baby', function(t1, t2, dict, txtr, timer)
    if not HasStreamedTextureDictLoaded(dict) then
        RequestStreamedTextureDict(dict, true) 
        while not HasStreamedTextureDictLoaded(dict) do
            Citizen.Wait(5)
        end
    end
    if txtr ~= nil then
        exports.ricx_Baby.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
    else
        local txtr = "tick"
        exports.ricx_Baby.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
    end
    SetStreamedTextureDictAsNoLongerNeeded(dict)
end)