local A = 0
local AH = 0
local Goons = {}
local GoonsWithH = {}
local GoonsHorses = {}
local SpawnedEm = false


local weaponNames = {
	"WEAPON_MELEE_BROKEN_SWORD",
	"WEAPON_MELEE_HATCHET",
	"WEAPON_MELEE_CLEAVER",
	"WEAPON_MELEE_ANCIENT_HATCHET",
	"WEAPON_MELEE_HATCHET_VIKING",
	"WEAPON_MELEE_HATCHET_HEWING",
	"WEAPON_MELEE_HATCHET_DOUBLE_BIT",
	"WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED",
	"WEAPON_MELEE_HATCHET_HUNTER",
	"WEAPON_MELEE_HATCHET_HUNTER_RUSTED",
	"WEAPON_MELEE_KNIFE_JOHN",
	"WEAPON_MELEE_KNIFE",
	"WEAPON_MELEE_KNIFE_JAWBONE",
	"WEAPON_THROWN_THROWING_KNIVES",
	"WEAPON_MELEE_KNIFE_MINER",
	"WEAPON_MELEE_KNIFE_CIVIL_WAR",
	"WEAPON_MELEE_KNIFE_BEAR",
	"WEAPON_MELEE_KNIFE_VAMPIRE",
	"WEAPON_MELEE_MACHETE",
	"WEAPON_THROWN_TOMAHAWK",
	"WEAPON_THROWN_TOMAHAWK_ANCIENT",
	"WEAPON_PISTOL_M1899",
	"WEAPON_PISTOL_MAUSER",
	"WEAPON_PISTOL_MAUSER_DRUNK",
	"WEAPON_PISTOL_SEMIAUTO",
	"WEAPON_PISTOL_VOLCANIC",
	"WEAPON_REPEATER_CARBINE",
	"WEAPON_REPEATER_HENRY",
	"WEAPON_RIFLE_VARMINT",
	"WEAPON_REPEATER_WINCHESTER",
	"WEAPON_REVOLVER_CATTLEMAN",
	"WEAPON_REVOLVER_CATTLEMAN_JOHN",
	"WEAPON_REVOLVER_CATTLEMAN_MEXICAN",
	"WEAPON_REVOLVER_CATTLEMAN_PIG",
	"WEAPON_REVOLVER_DOUBLEACTION",
	"WEAPON_REVOLVER_DOUBLEACTION_EXOTIC",
	"WEAPON_REVOLVER_DOUBLEACTION_GAMBLER",
	"WEAPON_REVOLVER_DOUBLEACTION_MICAH",
	"WEAPON_REVOLVER_LEMAT",
	"WEAPON_REVOLVER_SCHOFIELD",
	"WEAPON_REVOLVER_SCHOFIELD_GOLDEN",
	"WEAPON_REVOLVER_SCHOFIELD_CALLOWAY",
	"WEAPON_SHOTGUN_DOUBLEBARREL",
	"WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC",
	"WEAPON_SHOTGUN_PUMP",
	"WEAPON_SHOTGUN_REPEATING",
	"WEAPON_SHOTGUN_SAWEDOFF",
	"WEAPON_SHOTGUN_SEMIAUTO",
}

local GoonWepNames = {
	"WEAPON_MELEE_BROKEN_SWORD",
	"WEAPON_FISHINGROD",
	"WEAPON_MELEE_HATCHET",
	"WEAPON_MELEE_CLEAVER",
	"WEAPON_MELEE_ANCIENT_HATCHET",
	"WEAPON_MELEE_HATCHET_VIKING",
	"WEAPON_MELEE_HATCHET_HEWING",
	"WEAPON_MELEE_HATCHET_DOUBLE_BIT",
	"WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED",
	"WEAPON_MELEE_HATCHET_HUNTER",
	"WEAPON_MELEE_HATCHET_HUNTER_RUSTED",
	"WEAPON_MELEE_KNIFE_JOHN",
	"WEAPON_MELEE_KNIFE",
	"WEAPON_MELEE_KNIFE_JAWBONE",
	"WEAPON_THROWN_THROWING_KNIVES",
	"WEAPON_MELEE_KNIFE_MINER",
	"WEAPON_MELEE_KNIFE_CIVIL_WAR",
	"WEAPON_MELEE_KNIFE_BEAR",
	"WEAPON_MELEE_KNIFE_VAMPIRE",
	"WEAPON_MELEE_MACHETE",
	"WEAPON_THROWN_TOMAHAWK",
	"WEAPON_THROWN_TOMAHAWK_ANCIENT",
	"WEAPON_PISTOL_M1899",
	"WEAPON_PISTOL_MAUSER",
	"WEAPON_PISTOL_MAUSER_DRUNK",
	"WEAPON_PISTOL_SEMIAUTO",
	"WEAPON_PISTOL_VOLCANIC",
	"WEAPON_REPEATER_CARBINE",
	"WEAPON_REPEATER_HENRY",
	"WEAPON_RIFLE_VARMINT",
	"WEAPON_REPEATER_WINCHESTER",
	"WEAPON_REVOLVER_CATTLEMAN",
	"WEAPON_REVOLVER_CATTLEMAN_JOHN",
	"WEAPON_REVOLVER_CATTLEMAN_MEXICAN",
	"WEAPON_REVOLVER_CATTLEMAN_PIG",
	"WEAPON_REVOLVER_DOUBLEACTION",
	"WEAPON_REVOLVER_DOUBLEACTION_EXOTIC",
	"WEAPON_REVOLVER_DOUBLEACTION_GAMBLER",
	"WEAPON_REVOLVER_DOUBLEACTION_MICAH",
	"WEAPON_REVOLVER_LEMAT",
	"WEAPON_REVOLVER_SCHOFIELD",
	"WEAPON_REVOLVER_SCHOFIELD_GOLDEN",
	"WEAPON_REVOLVER_SCHOFIELD_CALLOWAY",
	"WEAPON_RIFLE_BOLTACTION",
	"WEAPON_SNIPERRIFLE_CARCANO",
	"WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
	"WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC",
	"WEAPON_RIFLE_SPRINGFIELD",
	"WEAPON_SHOTGUN_DOUBLEBARREL",
	"WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC",
	"WEAPON_SHOTGUN_PUMP",
	"WEAPON_SHOTGUN_REPEATING",
	"WEAPON_SHOTGUN_SAWEDOFF",
	"WEAPON_SHOTGUN_SEMIAUTO",
	"WEAPON_BOW",
	"WEAPON_THROWN_DYNAMITE",
	"WEAPON_THROWN_MOLOTOV",
}

local CopWepNames = {
	"WEAPON_PISTOL_M1899",
	"WEAPON_PISTOL_MAUSER",
	"WEAPON_PISTOL_SEMIAUTO",
	"WEAPON_PISTOL_VOLCANIC",
	"WEAPON_REPEATER_CARBINE",
	"WEAPON_REPEATER_HENRY",
	"WEAPON_RIFLE_VARMINT",
	"WEAPON_REPEATER_WINCHESTER",
	"WEAPON_REVOLVER_CATTLEMAN",
	"WEAPON_REVOLVER_CATTLEMAN_JOHN",
	"WEAPON_REVOLVER_CATTLEMAN_MEXICAN",
	"WEAPON_REVOLVER_CATTLEMAN_PIG",
	"WEAPON_REVOLVER_DOUBLEACTION",
	"WEAPON_REVOLVER_DOUBLEACTION_EXOTIC",
	"WEAPON_REVOLVER_DOUBLEACTION_GAMBLER",
	"WEAPON_REVOLVER_DOUBLEACTION_MICAH",
	"WEAPON_REVOLVER_LEMAT",
	"WEAPON_REVOLVER_SCHOFIELD",
	"WEAPON_REVOLVER_SCHOFIELD_GOLDEN",
    "WEAPON_REVOLVER_SCHOFIELD_CALLOWAY",
    "WEAPON_SHOTGUN_DOUBLEBARREL",
	"WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC",
	"WEAPON_SHOTGUN_PUMP",
	"WEAPON_SHOTGUN_REPEATING",
	"WEAPON_SHOTGUN_SAWEDOFF",
	"WEAPON_SHOTGUN_SEMIAUTO",
}

local ModelsBountyHunters = {
	"MP_CHU_ROB_MILLESANI_MALES_01",
	"AM_VALENTINEDOCTORS_FEMALES_01",
	"A_F_M_ARMCHOLERACORPSE_01",
	"A_F_M_ARMTOWNFOLK_01",
	"A_F_M_ArmTownfolk_02",
	"A_F_M_AsbTownfolk_01",
	"A_F_M_BiVFancyTravellers_01",
	"A_F_M_BlWTownfolk_01",
	"A_F_M_BlWTownfolk_02",
	"A_F_M_BlWUpperClass_01",
	"A_F_M_BtcHillbilly_01",
	"A_F_M_BTCObeseWomen_01",
	"A_F_M_GuaTownfolk_01",
	"A_F_M_LagTownfolk_01",
	"A_F_M_LowerSDTownfolk_01",
	"A_F_M_LowerSDTownfolk_02",
	"A_F_M_LowerSDTownfolk_03",
	"A_F_M_MiddleSDTownfolk_01",
	"A_F_M_MiddleSDTownfolk_02",
	"A_F_M_MiddleSDTownfolk_03",
	"A_F_M_NbxSlums_01",
	"A_F_M_NbxUpperClass_01",
	"A_F_M_NbxWhore_01",
	"A_F_M_RhdTownfolk_01",
	"A_F_M_RhdTownfolk_02",
	"A_F_M_ROUGHTRAVELLERS_01",
	"A_F_M_SDChinatown_01",
	"A_F_M_SDSlums_02",
	"A_F_M_StrTownfolk_01",
	"A_F_M_TumTownfolk_01",
	"A_F_M_TumTownfolk_02",
    "mp_dr_u_m_m_MISTAKENBOUNTIES_01",
    "CS_VALSHERIFF",
    "U_M_M_ValSheriff_01",
    "S_M_M_DispatchLawRural_01",
    "S_M_M_AmbientLawRural_01",
    "S_M_M_PinLaw_01",
    "S_M_M_MARSHALLSRURAL_01",
}

local ModelsCopsVal = {
    "CS_VALSHERIFF",
    "U_M_M_ValSheriff_01",
    "S_M_M_DispatchLawRural_01",
    "S_M_M_AmbientLawRural_01",
    "S_M_M_PinLaw_01",
    "S_M_M_MARSHALLSRURAL_01",
}

local GoonHorse = {
    "A_C_Horse_MissouriFoxTrotter_SilverDapplePinto",
    "A_C_Horse_Mustang_TigerStripedBay",
    "A_C_Horse_Thoroughbred_Brindle",
    "A_C_Horse_TennesseeWalker_BlackRabicano",
    "A_C_Horse_Morgan_FlaxenChestnut",
    "A_C_Horse_KentuckySaddle_ButterMilkBuckskin_PC",
    "A_C_Horse_Shire_LightGrey",
    "A_C_Horse_Nokota_WhiteRoan",
    "A_C_Horse_Appaloosa_BlackSnowflake",
}

local keys = {
    -- Letters
    ["A"] = 0x7065027D,
    ["B"] = 0x4CC0E2FE,
    ["C"] = 0x9959A6F0,
    ["D"] = 0xB4E465B4,
    ["E"] = 0xCEFD9220,
    ["F"] = 0xB2F377E8,
    ["G"] = 0x760A9C6F,
    ["H"] = 0x24978A28,
    ["I"] = 0xC1989F95,
    ["J"] = 0xF3830D8E,
    -- Missing K, don't know if anything is actually bound to it
    ["L"] = 0x80F28E95,
    ["M"] = 0xE31C6A41,
    ["N"] = 0x4BC9DABB, -- Push to talk key
    ["O"] = 0xF1301666,
    ["P"] = 0xD82E0BD2,
    ["Q"] = 0xDE794E3E,
    ["R"] = 0xE30CD707,
    ["S"] = 0xD27782E3,
    -- Missing T
    ["U"] = 0xD8F73058,
    ["V"] = 0x7F8D09B8,
    ["W"] = 0x8FD015D8,
    ["X"] = 0x8CC9CD42,
    -- Missing Y
    ["Z"] = 0x26E9DC00,

    -- Symbol Keys
    ["RIGHTBRACKET"] = 0xA5BDCD3C,
    ["LEFTBRACKET"] = 0x430593AA,
    -- Mouse buttons
    ["MOUSE1"] = 0x07CE1E61,
    ["MOUSE2"] = 0xF84FA74F,
    ["MOUSE3"] = 0xCEE12B50,
    ["MWUP"] = 0x3076E97C,
    -- Modifier Keys
    ["CTRL"] = 0xDB096B85,
    ["TAB"] = 0xB238FE0B,
    ["SHIFT"] = 0x8FFC75D6,
    ["SPACEBAR"] = 0xD9D0E1C0,
    ["ENTER"] = 0xC7B5340A,
    ["BACKSPACE"] = 0x156F7119,
    ["LALT"] = 0x8AAA0AD4,
    ["DEL"] = 0x4AF4D473,
    ["PGUP"] = 0x446258B6,
    ["PGDN"] = 0x3C3DD371,
    -- Function Keys
    ["F1"] = 0xA8E3F467,
    ["F4"] = 0x1F6D95E5,
    ["F6"] = 0x3C0A40F2,
    -- Number Keys
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
    ["5"] = 0xAB62E997,
    ["6"] = 0xA1FDE2A6,
    ["7"] = 0xB03A913B,
    ["8"] = 0x42385422,
    -- Arrow Keys
    ["DOWN"] = 0x05CA7C52,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
}



--whenKeyJustPressed(keys["X"])
function whenKeyJustPressed(key)
    k = keys[key]
    if Citizen.InvokeNative(0x580417101DDB492F, 0, k) then
        return true
    else
        return false
    end
end

function IsDead(e)
	return Citizen.InvokeNative(0x2E9C3FCB6798F397, e)
end

function ClearPTask(e)
	return ClearPedTasks(e)
end

function p()
	return PlayerId()
end

-- ped = PlayerPedId()
function Ped()
	return PlayerPedId()
end

-- ps = GetPlayerServerId(PlayerId())
function ps()
	return GetPlayerServerId(PlayerId())
end

function GetEntityCoords(e)
    return Citizen.InvokeNative(0xA86D5F069399F44D, e, Citizen.ResultAsVector())
end

function GetEntityHead(e)
	return GetEntityHeading(e)
end

function GetDistance(pc,oc)
    return GetDistanceBetweenCoords(pc.x, pc.y, pc.z, oc.x, oc.y, oc.z, false)
end
function GetDistanceZTrue(pc,oc)
    return GetDistanceBetweenCoords(pc.x, pc.y, pc.z, oc.x, oc.y, oc.z, true)
end

function SetCoords(c)
	return SetEntityCoords(c.x,c.y,c.z)
end

function PlayAnim(d,a)
    local player = PlayerPedId()

    local dict = d
    RequestAnimDict(d)
    while not HasAnimDictLoaded(d) do
        Citizen.Wait(10)
    end
    TaskPlayAnim(player, d, a, 1.0, 8.0, -1, 1, 0, false, false, false)
end

function GetEntityAimedAt(p)                                          
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)    
    return entity                                                   
end

function PlayWalkAnim(d,a)
    local player = PlayerPedId()

    local dict = d
    RequestAnimDict(d)
    while not HasAnimDictLoaded(d) do
        Citizen.Wait(10)
    end
    TaskPlayAnim(player, d, a, 1.0, 8.0, -1, 31, 0, false, false, false)
end

function PlayScenario(s)
    local player = PlayerPedId()
    local model = GetHashKey(s)
    TaskStartScenarioInPlace(player, model,-1, true, false, false, false)
end


-- pv = PlayerVehicle
function pv()
	return GetVehiclePedIsIn(ped(), false)
end

-- lpv = LastPlayerVehicle
function lpv()
	return GetVehiclePedIsIn(ped(), true)
end

-- fix = Fixes the specified vehicle
function fix(veh)
	SetVehicleFixed(veh)
	return ""
end

function translateAngle(x1, y1, ang, offset)
    x1 = x1 + math.sin(ang) * offset
    y1 = y1 + math.cos(ang) * offset
    return {x1, y1}
end

function SpawnEntOnP(e)
    local player = GetPlayerPed()
    local pCoords = GetEntityCoords(player)
    local pDir = GetEntityHeading(player)
    -- 0x405180B14DA5A935 SetPedType(entity, ??) -- Always makes PedType 4

    local spawnCoords = GetOffsetFromEntityInWorldCoords(player, 0, -0.5, -0.5)

    local modelName = e
    local modelHash = GetHashKey(modelName)
    Citizen.CreateThread(function()
        LoadModel(modelHash)
        local entity = CreatePed(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, pDir, true, false, false, false)
        SetEntityVisible(entity, true)
        SetEntityAlpha(entity, 255, false)
        Citizen.InvokeNative(0x283978A15512B2FE, entity, true)
        SetModelAsNoLongerNeeded(modelHash)
    end)
end

-- function SpawnObjOnP(e)
--     local player = GetPlayerPed()
--     local pCoords = GetEntityCoords(player)
--     local pDir = GetEntityHeading(player)
--     -- 0x405180B14DA5A935 SetPedType(entity, ??) -- Always makes PedType 4

--     local spawnCoords = GetOffsetFromEntityInWorldCoords(player, 0, -0.5, -0.5)

--     local modelName = e
--     local modelHash = GetHashKey(modelName)
--     Citizen.CreateThread(function()
--         LoadModel(modelHash)
--         Obj = CreateObject(modelHash, spawnCoords.x, spawnCoords.y,spawnCoords.z, true, false, false)
--         SetEntityVisible(Obj, true)
--         SetEntityAlpha(Obj, 255, false)
--         Citizen.InvokeNative(0x283978A15512B2FE, Obj, true)
--         SetModelAsNoLongerNeeded(modelHash)
--     end)
-- end

function LoadModel(model)
    local attempts = 0
    while attempts < 100 and not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(10)
        attempts = attempts + 1
    end
    return IsModelValid(model)
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    local factor = (string.len(text)) / 150
    DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end

function ShowPrompt(msg)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end


function SpawnGoons(Count)
    if count == nil then count = 3 end
    Goons = {}
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)              
        local i = 0
        local AToStop = Count
        while A < AToStop do
            local retval, outPosition = GetNthClosestVehicleNode(coords.x, coords.y,  coords.z, 30, 0, 0, 0)

            local mod = getRandomModel(ModelsBountyHunters)
			RequestModel(GetHashKey(mod))
			while not HasModelLoaded(GetHashKey(mod)) do
				Wait(10)
            end

            if outPosition.x == 0 or outPosition.y == 0 or outPosition.z == 0 then
                local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0+math.random(5,20), -40.0+math.random(5,20), 0.0))
                local gChk, groundZ = nil, nil
                
                for height = 1, 1000 do
                    gChk, groundZ = GetGroundZAndNormalFor_3dCoord(x, y, height+0.0)
                    local InsideInterior = Citizen.InvokeNative(0xF291396B517E25B2,x, y, groundZ)
                        if gChk then
                            print('FOUND GROUND!: ' .. groundZ)
                            break
                        end
                end
                Goons[i] = CreatePed(GetHashKey(mod), x, y, groundZ, true, true, true, true)
            else
                Goons[i] = CreatePed(GetHashKey(mod), outPosition.x, outPosition.y, outPosition.z, true, true, true, true)
            end

            local Wep = getRandomWep(GoonWepNames)
            ---setpedvariationforeachcomp
            Citizen.InvokeNative(0xC8A9481A01E63C28,Goons[i],0x9925C067) -- Hat
            Citizen.InvokeNative(0xC8A9481A01E63C28,Goons[i],0xE06D30CE) --coats
            Citizen.InvokeNative(0xC8A9481A01E63C28,Goons[i],0x1D4C528A) --pants
            -------
            Citizen.InvokeNative(0x283978A15512B2FE, Goons[i], true)
            Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, Goons[i])
            Citizen.InvokeNative(0x77FF8D35EEC6BBC4, Goons[i], 1, 0) --makeenvisble
            SetEntityAsMissionEntity(Goons[i], true, true)

            ---givewep
            GiveWeaponToPed_2(Goons[i], GetHashKey(Wep), 10, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
            SetCurrentPedWeapon(GoonsWithH[i], GetHashKey(Wep), true)

            --set attack and attrib
            Wait(500)
            TaskCombatPed(Goons[i],PlayerPedId())
            SetPedFleeAttributes(Goons[i], 0, false)
            SetPedCombatAttributes(Goons[i], 46, true)
            SetPedCombatAbility(Goons[i], 2)

            i = i + 1
            A = A + 1
            if A == C then
                SpawnedEm = true
                SetModelAsNoLongerNeeded(mod)
            end
        end

        while SpawnedEm do
            Citizen.Wait(3000)
            local pl = Citizen.InvokeNative(0x217E9DC48139933D)
            for k,v in pairs(Goons) do
                if Citizen.InvokeNative(0x2E9C3FCB6798F397, pl) then
                    Wait(5000)
                    DeletePed(v)
                    DeleteEntity(v)
                    A = 0
                end
                if IsEntityDead(v) or GetEntityHealth(v) <= 0 then
                    Goons[k] = nil
                    A = tablelength(Goons)
                end
            end
            if A == 0 then
                SpawnedEm = false
            end
        end
end


function SpawnGoonsWithHorses(Count)
    print("EFasdfasdf")
    local C = tonumber(Count)
    if C == nil then C = 3 end
    GoonsWithH = {}
    GoonsHorses = {}
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)              
        local i = 0
        local h = 0
        local AToStop = C
        while A < AToStop do
  -----------give them a cunting horse---
            local retval, outPosition = GetNthClosestVehicleNode(coords.x, coords.y,  coords.z, 30, 0, 0, 0)
            print(outPosition)
            local modH = getRandomModel(GoonHorse)
            RequestModel(GetHashKey(modH))
            while not HasModelLoaded(GetHashKey(modH)) do
                Wait(10)
            end
            if outPosition.x == 0 or outPosition.y == 0 or outPosition.z == 0 then
                local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, -60.0+math.random(5,20), -60.0+math.random(5,20), 0.0))
                local gChk, groundZ = nil, nil
                
                for height = 1, 1000 do
                    gChk, groundZ = GetGroundZAndNormalFor_3dCoord(x, y, height+0.0)
                    local InsideInterior = Citizen.InvokeNative(0xF291396B517E25B2,x, y, groundZ)
                        if gChk then
                            print('FOUND GROUND!: ' .. groundZ)
                            break
                        end
                end
                GoonsHorses[h] = CreatePed(modH, x, y, groundZ, true, true, true, true)
            else
                GoonsHorses[h] = CreatePed(modH, outPosition.x, outPosition.y, outPosition.z, true, true, true, true)
            end


            Citizen.InvokeNative(0x283978A15512B2FE, GoonsHorses[h], true)
            Citizen.InvokeNative(0xD3A7B003ED343FD9,GoonsHorses[h],0x150D0DAA,true,true,true)
            SetPedFleeAttributes(GoonsHorses[h], 0, false)
-----------------------------------------------------------------
            local mod = getRandomModel(ModelsBountyHunters)
			RequestModel(GetHashKey(mod))
			while not HasModelLoaded(GetHashKey(mod)) do
				Wait(10)
            end

            ------PED--------------
            GoonsWithH[i] = CreatePedOnMount(GoonsHorses[h],GetHashKey(mod), -1,true,true,true,true)
            local Wep = getRandomWep(CopWepNames)
            ---setpedvariationforeachcomp
            -------
            Citizen.InvokeNative(0x283978A15512B2FE,  GoonsWithH[i], true)
            Citizen.InvokeNative(0x23f74c2fda6e7c61, 662885764,  GoonsWithH[i])
            Citizen.InvokeNative(0x77FF8D35EEC6BBC4,  GoonsWithH[i], 1, 0) --makeenvisble
            Citizen.InvokeNative(0xC8A9481A01E63C28, GoonsWithH[i],0x9925C067) -- Hat
            Citizen.InvokeNative(0xC8A9481A01E63C28, GoonsWithH[i],0xE06D30CE) --coats
            Citizen.InvokeNative(0xC8A9481A01E63C28, GoonsWithH[i],0x1D4C528A) --pants
            SetEntityAsMissionEntity( GoonsWithH[i], true, true)
            ---givewep
            GiveWeaponToPed_2( GoonsWithH[i], GetHashKey(Wep), 100, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
            SetCurrentPedWeapon( GoonsWithH[i], GetHashKey(Wep), true)
            
            --set attack and attrib
            Wait(1000)
            TaskCombatPed(GoonsWithH[i],PlayerPedId())
            SetPedFleeAttributes(GoonsWithH[i], 0, false)
            SetPedCombatAttributes(GoonsWithH[i], 46, true)
            SetPedCombatAbility(GoonsWithH[i], 2)


            i = i + 1
            h = h + 1
            
            A = A + 1
            AH = AH + 1
            if A == C then
                SpawnedEm = true
                SetModelAsNoLongerNeeded(GetHashKey(mod))
                SetModelAsNoLongerNeeded(GetHashKey(modH))
            end
        end

        while SpawnedEm do
            Citizen.Wait(3000)
            local pl = Citizen.InvokeNative(0x217E9DC48139933D)
            for k,v in pairs(GoonsWithH) do
                if Citizen.InvokeNative(0x2E9C3FCB6798F397, pl) then
                    Wait(5000)
                    for k,v in pairs(GoonsHorses) do
                        if Citizen.InvokeNative(0x2E9C3FCB6798F397, pl) then
                            DeletePed(v)
                            DeleteEntity(v)
                            AH = 0
                        end
                    end
                    DeletePed(v)
                    DeleteEntity(v)
                    A = 0
                end
                if IsEntityDead(v) or GetEntityHealth(v) <= 0 then
                    GoonsWithH[k] = nil
                    A = tablelength(GoonsWithH)
                end
            end
            if A == 0 then
                SpawnedEm = false
            end
        end
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function getRandomWep(wep)
    return wep[math.random(1, #wep)]
end

function getRandomModel(model)
    return model[math.random(1, #model)]
end


function getRandomWitness(model)
    return model[math.random(1, #model)]
end
------------

-- local Witness = {}
-- function GetPedsForWitness()
--     Witness = {}
--     local itemSet = CreateItemset(true)
--     local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(Ped()), 40.0, itemSet, 1,Citizen.ResultAtInteger())
--     if size ~= false and size > 0 then
--         for index = 0, size - 1 do
--             local entity = GetIndexedItemInItemset(index, itemSet)
--             table.insert(Witness,entity)
--             local W = getRandomWitness(Witness)
--             local isped = IsEntityAPed(W)
--             if isped then
--                 local PedType = GetPedType(W)
--                 if PedType == 4 or PedType == 5 then
--                     local EntStatus = Citizen.InvokeNative(0x61914209C36EFDDB,W)
--                     local dead = IsEntityDead(W)
--                     if EntStatus ~= 3 or EntStatus ~= 8 and not dead then 
--                         local OnMount = IsPedOnMount(W)
--                         if OnMount then 
--                             TaskDismountAnimal(W,1,0,0,0,0)
--                         end
--                         local OnFoot = IsPedOnFoot(W)
--                         local IsMeleeCombat = IsPedInMeleeCombat(W)
--                         if not dead and OnFoot and not IsMeleeCombat then
--                             if not IsEntityAMissionEntity(W) then
--                                 local ClearLos = HasEntityClearLosToEntity(Ped(), W, 17)
--                                 if ClearLos then
--                                     if IsItemsetValid(itemSet) then
--                                         DestroyItemset(itemSet)
--                                     end
--                                     return W
--                                 end
--                             end
--                         end
--                     end
--                 end
--             end
--         end
--         if IsItemsetValid(itemSet) then
--             DestroyItemset(itemSet)
--         end
--     end
--     return nil
-- end

local Witness = {}
local ChosenWitness = {}

function GetPedsForWitness()
    ChosenWitness = {}
    Witness = {}
    local itemSet = CreateItemset(true)
    local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(Ped()), 40.0, itemSet, 1)
    if size ~= false and size > 0 then
        for index = 0, size - 1 do
            local entity = GetIndexedItemInItemset(index, itemSet)
            table.insert(Witness,entity)
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end

        for k,v in pairs(Witness) do
            local isped = IsEntityAPed(v)
            if isped then
                local PedType = GetPedType(v)
                if PedType == 4 or PedType == 5 then
                    local dead = IsEntityDead(v)
                    local EntStatus = Citizen.InvokeNative(0x61914209C36EFDDB,v)
                    if EntStatus ~= 3 or EntStatus ~= 8 and not dead then
                        local IsMeleeCombat = IsPedInMeleeCombat(v)
                        if not IsMeleeCombat then
                            local OnFoot = IsPedOnFoot(v)
                            if OnFoot then
                                if not IsEntityAMissionEntity(v) then
                                    local ClearLos = HasEntityClearLosToEntity(Ped(), v, 17)
                                    if ClearLos then
                                        table.insert(ChosenWitness,v)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if next(ChosenWitness) ~= nil then
            local W = getRandomWitness(ChosenWitness)
            return W
        else
            return nil
        end
    end
end

-- local PedsToWatch = {}
-- function GetPedstoStore()
--         if next(PedsToWatch) ~= nil then
--             for k,v in pairs (PedsToWatch) do
--                 local AimedEntity = GetEntityAimedAt(PlayerId())
--                 if AimedEntity then
--                     if v ~= AimedEntity then
--                         local PedType = GetPedType(AimedEntity)
--                         if PedType == 4 or PedType == 5 then
--                             table.insert(PedsToWatch,AimedEntity)
--                         end
--                     end
--                 end
--             end
--         else
--             local AimedEntity = GetEntityAimedAt(PlayerId())
--             -- local IsTarget, TargetEntity  = GetPlayerTargetEntity( player)
--             if AimedEntity then
--                 local PedType = GetPedType(AimedEntity)
--                 if PedType == 4 or PedType == 5 then
--                     table.insert(PedsToWatch,AimedEntity)
--                 end
--             end
--         end
-- end

-- function GetPedLifeStatusAndKiller()
--     if next(PedsToWatch) ~= nil then
--         for k,v in pairs(PedsToWatch) do
--             local EntHealth = GetEntityHealth(v)
--             if EntHealth <= 0 then
--                 PedsToWatch[k] = nil
--                 return true
--             else
--                 PedsToWatch[k] = nil
--                 return false
--             end
--         end
--     end
--     return false
-- end

RegisterCommand('dumppeds', function(source, args)
    for key, value in pairs(Witness) do
        print(key, value)
    end
end)


function GetCurrentTownName(T)
    if T then 
        local pedCoords = GetEntityCoords(PlayerPedId())
        local town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, pedCoords ,1)
        if town_hash == GetHashKey("Annesburg") then
            return "Annesburg"
        elseif town_hash == GetHashKey("Blackwater") then
            return "Blackwater"
        elseif town_hash == GetHashKey("Rhodes") then
            return "Rhodes"
        elseif town_hash == GetHashKey("StDenis") then
            return "Saint Denis"
        elseif town_hash == GetHashKey("Strawberry") then
            return "Strawberry"
        elseif town_hash == GetHashKey("Tumbleweed") then
            return "Tumbleweed"
        elseif town_hash == GetHashKey("valentine") then
            return "Valentine"
        end
    else
        local pedCoords = GetEntityCoords(PlayerPedId())
        local town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, pedCoords ,1)
        if town_hash == GetHashKey("Annesburg") then
            C = {x = 2913.97,y = 1310.26,z = 44.58}
            return C
        elseif town_hash == GetHashKey("Blackwater") then
            C = {x = -755.17,y = -1269.16,z = 44.02}
            return C
        elseif town_hash == GetHashKey("Rhodes") then
            C = {x = 1358.55,y = -1307.17,z = 77.72}
            return C
        elseif town_hash == GetHashKey("StDenis") then
            C = {x = 2518.98,y = -1308.84,z = 48.97}
            return C
        elseif town_hash == GetHashKey("Strawberry") then
            C = {x = -1803.54,y = -352.45,z = 164.15}
            return C 
        elseif town_hash == GetHashKey("Tumbleweed") then
            C = {x = -5526.37,y = -2933.81,z = 1.97}
            return C
        elseif town_hash == GetHashKey("valentine") then
            C = {x = -275.32,y = 801.56,z = 119.4}
            return C
        end
    end
end

local BLIP_TYPES = {
    -678244495, -- gray destination
    -1702907713, -- pink enemy
    -1337945352, -- white unselectable?
    1560611276, -- posse camp
    -674883803, -- invisible?
    1687768444, -- destination, mine icon?
    1260140857, -- invisible?
    -1230993421, -- horse icon "Arthur's Horse"
    -936216634, -- white unselectable?
    2098831270, -- white no name?
    -325639900, -- white pickup
    -773443467, -- corpse
    -700928964, -- gray herd
    -214162151, -- yellow straggler
    -1594303955, -- animal carcass
    662885764, -- red lawman
    -1049390151, -- red witness
    953018525, -- red bounty target
    455691738, -- red bounty target
    -839369609, -- red enemy
    -1749618580, -- white companion
    168093330, -- white destination
    -1595050198, -- red lawman
    -118010418, -- red alternative? lawman
    522464759, -- red bounty hunter
    631964804, -- wagon icon "Arthur's Wagon"
    1055493006, -- small yellow (x) destination
    486881925, -- white hat
    203020899, -- small yellow (x) destination
    -399496385, -- train
    -89429847, -- light gray companion
    1664425300, -- white weapon
    831283580, -- red enemy
    422991367, -- dark gray companion
    -515518185, -- white saddle unselectable?
    2033377404, -- yellow ( ) unselectable?
    -308585968, -- yellow (x) destination
    -108658760, -- invisible?
    -666422021, -- red ( ) unselectable?
    1774867085, -- invisible?
    -1282792512, -- yellow ( ) unselectable?
    227551412, -- yellow ( ) unselectable?
    408396114, -- yellow (x) destination
    -1559907306, -- white ( ) unselectable?
    1673015813, -- white ( ) unselectable?
    1247852480, -- yellow ( ) unselectable?
}
