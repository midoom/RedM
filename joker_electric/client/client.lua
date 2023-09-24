---------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------- Client File (This is code that is run on the players side) -------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

local PromptGroup1 = GetRandomIntInRange(0, 0xffffff) 
local PromptGroup2 = GetRandomIntInRange(0, 0xffffff) 

local PlayerJobs
local ValorChoque = 10
local Eletrocutando = false
local NaoPressionado = false
local PrisoneiroSentado = false

local PrisoneiroPed
local PrisoneiroSource

local EntitiesIds = { }

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    local str = Config.Cadeira
	prenderpris = PromptRegisterBegin()
	PromptSetControlAction(prenderpris, 0x5415BE48) -- add to config
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(prenderpris, str)
	PromptSetEnabled(prenderpris, 1)
	PromptSetVisible(prenderpris, 1)
	PromptSetStandardMode(prenderpris, 1)
    PromptSetHoldMode(prenderpris, 1)
	PromptSetGroup(prenderpris, PromptGroup1)
	PromptRegisterEnd(prenderpris)

    --local str = Config.Choque
	eletrocut = PromptRegisterBegin()
	PromptSetControlAction(eletrocut, 0x5415BE48) -- add to config
	str = CreateVarString(10, 'LITERAL_STRING', str)
	--PromptSetText(eletrocut, str)
	PromptSetEnabled(eletrocut, 1)
	PromptSetVisible(eletrocut, 1)
	PromptSetStandardMode(eletrocut, 1)
    PromptSetHoldMode(eletrocut, 1)
	PromptSetGroup(eletrocut, PromptGroup2)
	PromptRegisterEnd(eletrocut)

    local str = Config.Aumentar
	aumentarforca = PromptRegisterBegin()
	PromptSetControlAction(aumentarforca, 0x6319DB71) -- add to config
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(aumentarforca, str)
	PromptSetEnabled(aumentarforca, 1)
	PromptSetVisible(aumentarforca, 1)
	PromptSetStandardMode(aumentarforca, 1)
    PromptSetHoldMode(aumentarforca, 1)
	PromptSetGroup(aumentarforca, PromptGroup2)
	PromptRegisterEnd(aumentarforca)

    local str = Config.Diminuir
	diminuirforca = PromptRegisterBegin()
	PromptSetControlAction(diminuirforca, 0x05CA7C52) -- add to config
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(diminuirforca, str)
	PromptSetEnabled(diminuirforca, 1)
	PromptSetVisible(diminuirforca, 1)
	PromptSetStandardMode(diminuirforca, 1)
    PromptSetHoldMode(diminuirforca, 1)
	PromptSetGroup(diminuirforca, PromptGroup2)
	PromptRegisterEnd(diminuirforca)
end)

Citizen.CreateThread(function()
    while true do Wait(5000)
        local Ped = PlayerPedId()
        local PCoord = GetEntityCoords(Ped)
        for _,__ in pairs(Config.Zones) do
            local Dist = Vdist(PCoord - __.ChairCoord)
            if Dist <= __.SpawnRange then
                if not __.ChairSpawn and not __.GenSpawn then
                    Generator = CreateObject('p_cs_generator01x', __.GeneratorCoord.x, __.GeneratorCoord.y, __.GeneratorCoord.z, false, false, false)
                    Chair = CreateObject('p_cs_electricchair01x', __.ChairCoord.x, __.ChairCoord.y, __.ChairCoord.z, false, false, false)
                    table.insert(EntitiesIds, Generator)
                    table.insert(EntitiesIds, Chair)
                    __.ChairId = Chair
                    __.GeneratorId = Generator
                    __.GenSpawn = true
                    __.ChairSpawn = true
                    SetEntityCollision(Chair, false, true)
                end
            end
            if Dist > __.SpawnRange then
                if __.ChairSpawn and __.GenSpawn then
                    local GenExist = DoesEntityExist(__.ChairId)
                    local ChairExist = DoesEntityExist(__.GeneratorId)
                    if GenExist then
                        DeleteEntity(__.ChairId)
                    end
                    if ChairExist then
                        DeleteEntity(__.GeneratorId)
                    end
                    __.GenSpawn = false
                    __.ChairSpawn = false
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local Otimizador = 5000
    while true do Wait(Otimizador)
        local Ped = PlayerPedId()
        local PCoord = GetEntityCoords(Ped)
        local Chair = GetClosestObjectOfType(PCoord, 2.0, GetHashKey('p_cs_electricchair01x'), false, false, false)
        local ChairCoord = GetEntityCoords(Chair)
        local Dist = Vdist(PCoord - ChairCoord)
        local Generator = GetClosestObjectOfType(PCoord, 2.0, GetHashKey('p_cs_generator01x'), false, false, false)
        local GeneratorCoord = GetEntityCoords(Generator)
        local Dist2 = Vdist(PCoord - GeneratorCoord)
        if Dist <= 2 then
            if PlayerJobs == Config.Job and not NaoPressionado then
                Otimizador = 5
                local label = CreateVarString(10, 'LITERAL_STRING', Config.ChairName)
                PromptSetActiveGroupThisFrame(PromptGroup1, label)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, prenderpris) then
                    NaoPressionado = true
                    PrenderPrisioneiro()
                    Wait(5000)
                    NaoPressionado = false
                end
            end
        end
        if Dist2 <= 2 then
            if PlayerJobs == Config.Job and not Eletrocutando and PrisoneiroSentado then
                Otimizador = 5
                local Color = '~COLOR_GREENLIGHT~'
                if ValorChoque <= 30 then
                    Color = '~COLOR_GREENLIGHT~'
                elseif ValorChoque > 30 and ValorChoque <= 60 then
                    Color = '~COLOR_YELLOWSTRONG~'
                elseif ValorChoque > 60 then
                    Color = '~COLOR_RED~'
                end
                local str = Config.Choque.. ' ' .. Color .. ValorChoque .. '%'
	            str = CreateVarString(10, 'LITERAL_STRING', str)
                PromptSetText(eletrocut, str)
                local label = CreateVarString(10, 'LITERAL_STRING', Config.GeradorName)
                PromptSetActiveGroupThisFrame(PromptGroup2, label)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, eletrocut) then
                    if ValorChoque >= 70 then
                        EletrocutarMatar()
                        TriggerServerEvent('Joker:ElectricChair:Matar', PrisoneiroSource)
                        PrisoneiroSentado = false
                    end
                    Eletrocutar()
                    local VolumeChoque = 0
                    if ValorChoque <= 30 then
                        VolumeChoque = 0.3
                    elseif ValorChoque > 30 and ValorChoque <= 60 then
                        VolumeChoque = 0.8
                    elseif ValorChoque > 60 then
                        VolumeChoque = 1.6
                    end
                    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 20, 'choque', VolumeChoque)
                    Eletrocutando = true
                    Wait(6000)
                    Eletrocutando = false
                end
                if Citizen.InvokeNative(0xC92AC953F0A982AE, aumentarforca) then
                    if ValorChoque < 100 then
                        ValorChoque = ValorChoque + 10
                    end
                end
                if Citizen.InvokeNative(0xC92AC953F0A982AE, diminuirforca) then
                    if  ValorChoque ~= 10 then
                        ValorChoque = ValorChoque - 10
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    TriggerServerEvent('Joker:ElectricChair:CheckJob')
end)

RegisterNetEvent("Joker:ElectricChair:ReturnJob")
AddEventHandler("Joker:ElectricChair:ReturnJob", function(PlayerJob)
    if PlayerJob ~= ' ' then
        PlayerJobs = PlayerJob
    end
    if PlayerJobs == Config.Job then
        print('Player Job: ' ..PlayerJobs)
    end
end)

RegisterNetEvent("Joker:ElectricChair:SitInChair")
AddEventHandler("Joker:ElectricChair:SitInChair", function()
    local Ped = PlayerPedId()
    local PCoord = GetEntityCoords(Ped)

    local chair = GetClosestObjectOfType(PCoord, 2.0, GetHashKey('p_cs_electricchair01x'), false, false, false)
    local chairHeading = GetEntityHeading(chair)

    local chaircoords = GetOffsetFromEntityInWorldCoords(chair, 0.00, 0.00, 0.45)

    SetEntityCoords(Ped, chaircoords)
    SetEntityHeading(Ped, chairHeading + 180.0)

    Wait(1000)

    local animDict2 = "script_rc@rtl@leadout@rc_6"
    local anim2 = "leadout_alive_prisoner"
    while not HasAnimDictLoaded(animDict2) do
        RequestAnimDict(animDict2)
        Wait(50)
    end
    TaskPlayAnim(PlayerPedId(), animDict2, anim2, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
end)

RegisterNetEvent("Joker:ElectricChair:SyncChairAnim")
AddEventHandler("Joker:ElectricChair:SyncChairAnim", function(PrisoneiroSource, PrisoneiroPed)
    local coords = GetEntityCoords(PlayerPedId())
    local chair = GetClosestObjectOfType(coords, 22.0, GetHashKey('p_cs_electricchair01x'), false, false, false)

    local animDict = "script_rc@rtl@leadin@rc_6"
    local anim = "leadin_chair"
    while not HasAnimDictLoaded(animDict) do
        RequestAnimDict(animDict)
        Wait(50)
    end
    PlayEntityAnim(chair, anim, animDict, 8.0, false, true, false, 0.0, 0)
end)

RegisterNetEvent("Joker:ElectricChair:SyncedFX")
AddEventHandler("Joker:ElectricChair:SyncedFX", function(PrisoneiroPed)
    local new_ptfx_dictionary = "cut_rrtl"
    local new_ptfx_name = "cs_rrtl_electric_arcs"

	local is_particle_effect_active = false
	local current_ptfx_dictionary = new_ptfx_dictionary
	local current_ptfx_name = new_ptfx_name

	local current_ptfx_handle_id = false

	local bone_index = 247 -- HEAD

	local ptfx_offcet_x = 0.0
	local ptfx_offcet_y = 0.0
	local ptfx_offcet_z = 0.0
	local ptfx_rot_x = -90.0
	local ptfx_rot_y = 0.0
	local ptfx_rot_z = 0.0
	local ptfx_scale = 1.0
	local ptfx_axis_x = 0
	local ptfx_axis_y = 0
	local ptfx_axis_z = 0

    if ValorChoque <= 30 then
        ptfx_scale = 1.5
    elseif ValorChoque > 30 and ValorChoque <= 60 then
        ptfx_scale = 1.8
    elseif ValorChoque > 60 then
        ptfx_scale = 2.0
    end

    if not Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) then -- HasNamedPtfxAssetLoaded
        Citizen.InvokeNative(0xF2B2353BBC0D4E8F, GetHashKey(current_ptfx_dictionary))  -- RequestNamedPtfxAsset
        local counter = 0
        while not Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) and counter <= 300 do  -- while not HasNamedPtfxAssetLoaded
            Citizen.Wait(0)
        end
    end
    if Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) then  -- HasNamedPtfxAssetLoaded
        Citizen.InvokeNative(0xA10DB07FC234DD12, current_ptfx_dictionary) -- UseParticleFxAsset
                
        current_ptfx_handle_id = Citizen.InvokeNative(0x9C56621462FFE7A6,current_ptfx_name,PrisoneiroPed,ptfx_offcet_x,ptfx_offcet_y,ptfx_offcet_z,ptfx_rot_x,ptfx_rot_y,ptfx_rot_z,bone_index,ptfx_scale,ptfx_axis_x,ptfx_axis_y,ptfx_axis_z) -- StartNetworkedParticleFxLoopedOnEntityBone
    end

    Wait(4000)
    if current_ptfx_handle_id then
        if Citizen.InvokeNative(0x9DD5AFF561E88F2A, current_ptfx_handle_id) then   -- DoesParticleFxLoopedExist
        	Citizen.InvokeNative(0x459598F579C98929, current_ptfx_handle_id, false)   -- RemoveParticleFx
        end
    end
end)

RegisterNetEvent("Joker:ElectricChair:Matame")
AddEventHandler("Joker:ElectricChair:Matame", function()
    ApplyDamageToPed(PlayerPedId(), 10000, true, 54890, PlayerPedId())
end)

_IsAnimSceneLoaded = function(animscene)
	return Citizen.InvokeNative(0x477122B8D05E7968, animscene, 1, 0)
end

function PrenderPrisioneiro()
    local Ped = PlayerPedId()
    local PCoord = GetEntityCoords(Ped)
    local closestPlayer, closestDistance = GetClosestPlayer()
    local ClosestPlayers = GetClosestPlayers()
    if closestPlayer ~= -1 and closestDistance <= 2 then
        PrisoneiroPed = GetPlayerPed(closestPlayer)
        PrisoneiroSource = GetPlayerServerId(closestPlayer)
        TriggerServerEvent('Joker:ElectricChair:MakePrisonerSit', GetPlayerServerId(closestPlayer), ClosestPlayers, PrisoneiroSource, PrisoneiroPed)
        PrisoneiroSentado = true
    else
        VORPcore.NotifyLeft(Config.NoPrisoneiro, Config.NoPrisoneiroTexto, Config.DictNo, Config.IconNo, Config.TimeNo, Config.ColorNo)
    end
end

function Eletrocutar()
    local ClosestPlayers = GetClosestPlayers()
    TriggerServerEvent('Joker:ElectricChair:SyncFX', ClosestPlayers, PrisoneiroPed)
end

function EletrocutarMatar()
    local ClosestPlayers = GetClosestPlayers()
    TriggerServerEvent('Joker:ElectricChair:SyncFX', ClosestPlayers, PrisoneiroPed)
end

function GetClosestPlayers()
    local Ped = PlayerPedId()
    local PCoord = GetEntityCoords(Ped)
    local players = GetActivePlayers()
    local PCPlayers = { }
    for _,__ in pairs(players) do
        local PCCoord = GetEntityCoords(GetPlayerPed(__))
        local Dist = Vdist(PCoord - PCCoord)
        if Dist <= 20 then
            table.insert(PCPlayers, GetPlayerServerId(__))
        end
    end
    return PCPlayers
end

function GetClosestPlayer()
	local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
	local playerPed, playerId = PlayerPedId(), PlayerId()
	local coords, usePlayerPed = coords, false

	if coords then
		coords = vector3(coords.x, coords.y, coords.z)
	else
		usePlayerPed = true
		coords = GetEntityCoords(playerPed)
	end

	for i = 1, #players, 1 do
		local tgt = GetPlayerPed(players[i])

		if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

			local targetCoords = GetEntityCoords(tgt)
			local distance = #(coords - targetCoords)

			if closestDistance == -1 or closestDistance > distance then
				closestPlayer = players[i]
				closestDistance = distance
			end
		end
	end
	return closestPlayer, closestDistance
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' was stopped.')
    for k, v in pairs(EntitiesIds) do
        local Exist = DoesEntityExist(v)
        if Exist then
            DeleteEntity(v)
        end
    end
end)